using Microsoft.AspNetCore.Mvc;
using RegistrationWebApp.Data;
using RegistrationWebApp.Models;
using System.Diagnostics;

namespace RegistrationWebApp.Controllers
{
    public class HomeController : Controller
    {
        private readonly ApplicationDbContext _context;

        public HomeController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult RegisterPatient()
        {

            return View();
        }

        [HttpPost]
        public IActionResult RegisterPatient(Patient patient)
        {
            //if (!ModelState.IsValid)
            //{
            //    return BadRequest("не верно заполнены данные");
            //}
            var medicalCard = new MedicalCard() {MedicalCardStartDate = DateTime.Now};
            _context.Add(medicalCard);
            patient.MedicalCard = medicalCard;
            _context.Add(patient);

            _context.SaveChanges();
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
