using MainApi.DataDb;
using MainApi.DTOs;
using MainApi.ModelsDb;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography;
using System.Text;

namespace MainApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly AppDbContext _context;

        public UsersController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Users/5
        [HttpGet("{login}/{password}")]
        public async Task<ActionResult<UserDto>> GetDoctorUser(string login, string password)
        {
            var user = await _context.Users
                .Include(u => u.Doctor)
                .FirstOrDefaultAsync(u => u.Email == login);

            if (user == null || user.Doctor == null) 
                return NotFound();

            var hashPassword = ComputeSha256Hash(password);
            if (Convert.ToHexString(user.Password) != Convert.ToHexString(hashPassword))
                return NotFound();
            var userData = new UserDto
            {
                Name = user.Name,
                Email = user.Email,
                Patronymic = user.Patronymic,
                PhoneNumber = user.PhoneNumber,
                Surname = user.Surname,
            };
            return userData;
        }

        static byte[] ComputeSha256Hash(string rawData)
        {
            using (SHA256 sha256Hash = SHA256.Create())
                return sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));
        }
    }
}
