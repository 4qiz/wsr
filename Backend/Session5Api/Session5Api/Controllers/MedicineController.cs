using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Session5Api.Data;
using Session5Api.Models;

namespace Session5Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MedicineController : ControllerBase
    {
        private readonly AppDbContext _context;

        public MedicineController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Medicine
        [HttpGet]
        public async Task<ActionResult<IEnumerable<MedicineDto>>> GetS5Medicines()
        {
            if (_context.S5Medicines == null)
            {
                return NotFound();
            }
            var res = await _context.S5Medicines.ToListAsync();
            var mapped = new List<MedicineDto>();
            foreach (var item in res)
            {
                mapped.Add(item.ToMedicineFromDto());
            }
            return mapped;
        }

        // GET: api/Medicine/5
        [HttpGet("{id}")]
        public async Task<ActionResult<MedicineDto>> GetS5Medicine(int id)
        {
            if (_context.S5Medicines == null)
            {
                return NotFound();
            }
            var s5Medicine = await _context.S5Medicines.FindAsync(id);

            if (s5Medicine == null)
            {
                return NotFound();
            }

            return s5Medicine.ToMedicineFromDto();
        }

        // PUT: api/Medicine/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutS5Medicine(int id, S5Medicine s5Medicine)
        {
            if (id != s5Medicine.MedicineId)
            {
                return BadRequest();
            }

            _context.Entry(s5Medicine).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!S5MedicineExists(id))
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

        // POST: api/Medicine
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<S5Medicine>> PostS5Medicine(MedicineDto medicineDto)
        {
            if (_context.S5Medicines == null)
            {
                return Problem("Entity set 'AppDbContext.S5Medicines'  is null.");
            }
            var s5Medicine = medicineDto.ToMedicineFromDto();
            _context.S5Medicines.Add(s5Medicine);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetS5Medicine", new { id = s5Medicine.MedicineId }, s5Medicine);
        }

        // DELETE: api/Medicine/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteS5Medicine(int id)
        {
            if (_context.S5Medicines == null)
            {
                return NotFound();
            }
            var s5Medicine = await _context.S5Medicines.FindAsync(id);
            if (s5Medicine == null)
            {
                return NotFound();
            }

            _context.S5Medicines.Remove(s5Medicine);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool S5MedicineExists(int id)
        {
            return (_context.S5Medicines?.Any(e => e.MedicineId == id)).GetValueOrDefault();
        }
    }
}
