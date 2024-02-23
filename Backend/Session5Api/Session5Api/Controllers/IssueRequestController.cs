using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Session5Api.Data;
using Session5Api.Models;

namespace Session5Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class IssueRequestController : ControllerBase
    {
        private readonly AppDbContext _context;

        public IssueRequestController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/IssueRequest
        [HttpGet]
        public async Task<ActionResult<IEnumerable<IssueRequestDto>>> GetS5IssueRequests()
        {
            if (_context.S5IssueRequests == null)
            {
                return NotFound();
            }
            var res = await _context.S5IssueRequests.ToListAsync();
            var issues = new List<IssueRequestDto>();
            foreach (var item in res)
            {
                issues.Add(item.ToDtoFromIssueRequest());
            }
            return issues;
        }

        // GET: api/IssueRequest/5
        [HttpGet("{id}")]
        public async Task<ActionResult<IEnumerable<IssueRequestHasMedicineDto>>> GetS5IssueRequest(int id)
        {
            if (_context.S5IssueRequests == null)
            {
                return NotFound();
            }
            var IssueRequestWithMedicines = _context.S5IssueRequestHasMedicines
                .Include(x => x.Medicine)
                .Where(i => i.IssueRequestId == id).ToList();

            if (IssueRequestWithMedicines == null)
            {
                return NotFound();
            }
            var res = new List<IssueRequestHasMedicineDto>();
            foreach (var item in IssueRequestWithMedicines)
            {
                res.Add(new IssueRequestHasMedicineDto
                {
                    Image = item.Medicine.Image,
                    MedicineId = item.MedicineId,
                    Name = item.Medicine.Name,
                    Quantity = item.Quantity
                });
            }

            return res;
        }

        // PUT: api/IssueRequest/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutS5IssueRequest(int id, S5IssueRequest s5IssueRequest)
        {
            if (id != s5IssueRequest.IssueRequestId)
            {
                return BadRequest();
            }

            _context.Entry(s5IssueRequest).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!S5IssueRequestExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/IssueRequest
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<S5IssueRequest>> PostS5IssueRequest(List<IssueRequestDto> IssueRequestsDto)
        {
            if (_context.S5IssueRequests == null)
            {
                return Problem("Entity set 'AppDbContext.S5IssueRequests'  is null.");
            }
            foreach (var s5IssueRequest in IssueRequestsDto)
            {
                _context.S5IssueRequests.Add(s5IssueRequest.ToIssueRequestFromDto());
                await _context.SaveChangesAsync();
            }
            return Ok();
        }

        // DELETE: api/IssueRequest/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteS5IssueRequest(int id)
        {
            if (_context.S5IssueRequests == null)
            {
                return NotFound();
            }
            var s5IssueRequest = await _context.S5IssueRequests.FindAsync(id);
            if (s5IssueRequest == null)
            {
                return NotFound();
            }

            _context.S5IssueRequests.Remove(s5IssueRequest);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool S5IssueRequestExists(int id)
        {
            return (_context.S5IssueRequests?.Any(e => e.IssueRequestId == id)).GetValueOrDefault();
        }
    }
}
