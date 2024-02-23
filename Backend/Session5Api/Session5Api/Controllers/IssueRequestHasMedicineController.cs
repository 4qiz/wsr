using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Session5Api.Data;
using Session5Api.Models;

namespace Session5Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class IssueRequestHasMedicineController : ControllerBase
    {
        private readonly AppDbContext _context;

        public IssueRequestHasMedicineController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/IssueRequestHasMedicine
        [HttpGet]
        public async Task<ActionResult<IEnumerable<S5IssueRequestHasMedicine>>> GetS5IssueRequestHasMedicines()
        {
            if (_context.S5IssueRequestHasMedicines == null)
            {
                return NotFound();
            }
            return await _context.S5IssueRequestHasMedicines.ToListAsync();
        }

        // GET: api/IssueRequestHasMedicine/5
        [HttpGet("{id}")]
        public async Task<ActionResult<S5IssueRequestHasMedicine>> GetS5IssueRequestHasMedicine(int id)
        {
            if (_context.S5IssueRequestHasMedicines == null)
            {
                return NotFound();
            }
            var s5IssueRequestHasMedicine = await _context.S5IssueRequestHasMedicines.FindAsync(id);

            if (s5IssueRequestHasMedicine == null)
            {
                return NotFound();
            }

            return s5IssueRequestHasMedicine;
        }

        // PUT: api/IssueRequestHasMedicine/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutS5IssueRequestHasMedicine(int id, S5IssueRequestHasMedicine s5IssueRequestHasMedicine)
        {
            if (id != s5IssueRequestHasMedicine.MedicineId)
            {
                return BadRequest();
            }

            _context.Entry(s5IssueRequestHasMedicine).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!S5IssueRequestHasMedicineExists(id))
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

        // POST: api/IssueRequestHasMedicine
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<S5IssueRequestHasMedicine>> PostS5IssueRequestHasMedicine(S5IssueRequestHasMedicine s5IssueRequestHasMedicine)
        {
            if (_context.S5IssueRequestHasMedicines == null)
            {
                return Problem("Entity set 'AppDbContext.S5IssueRequestHasMedicines'  is null.");
            }
            _context.S5IssueRequestHasMedicines.Add(s5IssueRequestHasMedicine);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (S5IssueRequestHasMedicineExists(s5IssueRequestHasMedicine.MedicineId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetS5IssueRequestHasMedicine", new { id = s5IssueRequestHasMedicine.MedicineId }, s5IssueRequestHasMedicine);
        }

        // DELETE: api/IssueRequestHasMedicine/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteS5IssueRequestHasMedicine(int id)
        {
            if (_context.S5IssueRequestHasMedicines == null)
            {
                return NotFound();
            }
            var s5IssueRequestHasMedicine = await _context.S5IssueRequestHasMedicines.FindAsync(id);
            if (s5IssueRequestHasMedicine == null)
            {
                return NotFound();
            }

            _context.S5IssueRequestHasMedicines.Remove(s5IssueRequestHasMedicine);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool S5IssueRequestHasMedicineExists(int id)
        {
            return (_context.S5IssueRequestHasMedicines?.Any(e => e.MedicineId == id)).GetValueOrDefault();
        }
    }
}
