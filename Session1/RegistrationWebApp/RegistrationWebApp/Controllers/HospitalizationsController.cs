using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using RegistrationWebApp.Data;
using RegistrationWebApp.Models;

namespace RegistrationWebApp.Controllers
{
    public class HospitalizationsController : Controller
    {
        private readonly AppDbContext _context;

        public HospitalizationsController(AppDbContext context)
        {
            _context = context;
        }

        // GET: Hospitalizations
        public async Task<IActionResult> Index()
        {
            var appDbContext = _context.Hospitalizations.Include(h => h.HospitalizationRoom).Include(h => h.MedicalCard);
            return View(await appDbContext.ToListAsync());
        }

        [HttpPost]
        public async Task<IActionResult> Index(int id)
        {
            var appDbContext = await _context.Hospitalizations
                .Include(h => h.HospitalizationRoom)
                .Include(h => h.MedicalCard)
                .FirstOrDefaultAsync(h => h.HospitalizationCode == id);
            if (appDbContext != null)
            {
                return RedirectToAction("Details", new { id = id });
            }
            return BadRequest("Не удалось найти госпитализацию");
        }

        // GET: Hospitalizations/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var hospitalization = await _context.Hospitalizations
                .Include(h => h.HospitalizationRoom)
                .Include(h => h.MedicalCard)
                .FirstOrDefaultAsync(m => m.HospitalizationId == id);
            if (hospitalization == null)
            {
                return NotFound();
            }

            return View(hospitalization);
        }

        // GET: Hospitalizations/Create
        public IActionResult Create()
        {
            //ViewData["HospitalizationRoomId"] = new SelectList(_context.HospitalizationRooms, "HospitalizationRoomId", "HospitalizationRoomId");
            ViewData["MedicalCardId"] = new SelectList(_context.Patients, "MedicalCardId", "FullName");
            return View();
        }

        // POST: Hospitalizations/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("HospitalizationId,HospitalizationCode,HospitalizationGoal,DepartmentNumber,Price,StartDate,EndDate,IsCanceled,CancelReason,MedicalCardId,HospitalizationRoomId")] Hospitalization hospitalization)
        {
            //if (ModelState.IsValid)
            try
            {
                _context.Add(hospitalization);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View(hospitalization);
            }
            //ViewData["HospitalizationRoomId"] = new SelectList(_context.HospitalizationRooms, "HospitalizationRoomId", "HospitalizationRoomId", hospitalization.HospitalizationRoomId);
            ViewData["MedicalCardId"] = new SelectList(_context.Patients, "MedicalCardId", "FullName", hospitalization.MedicalCardId);
        }

        // GET: Hospitalizations/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var hospitalization = await _context.Hospitalizations.FindAsync(id);
            if (hospitalization == null)
            {
                return NotFound();
            }
            //ViewData["HospitalizationRoomId"] = new SelectList(_context.HospitalizationRooms, "HospitalizationRoomId", "HospitalizationRoomId", hospitalization.HospitalizationRoomId);
            ViewData["MedicalCardId"] = new SelectList(_context.Patients, "MedicalCardId", "FullName", hospitalization.MedicalCardId);
            return View(hospitalization);
        }

        // POST: Hospitalizations/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("HospitalizationId,HospitalizationCode,HospitalizationGoal,DepartmentNumber,Price,StartDate,EndDate,IsCanceled,CancelReason,MedicalCardId,HospitalizationRoomId")] Hospitalization hospitalization)
        {
            if (id != hospitalization.HospitalizationId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(hospitalization);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!HospitalizationExists(hospitalization.HospitalizationId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            //ViewData["HospitalizationRoomId"] = new SelectList(_context.HospitalizationRooms, "HospitalizationRoomId", "HospitalizationRoomId", hospitalization.HospitalizationRoomId);
            ViewData["MedicalCardId"] = new SelectList(_context.Patients, "MedicalCardId", "Name", hospitalization.MedicalCardId);
            return View(hospitalization);
        }

        // GET: Hospitalizations/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var hospitalization = await _context.Hospitalizations
                .Include(h => h.HospitalizationRoom)
                .Include(h => h.MedicalCard)
                .FirstOrDefaultAsync(m => m.HospitalizationId == id);
            if (hospitalization == null)
            {
                return NotFound();
            }

            return View(hospitalization);
        }

        // POST: Hospitalizations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var hospitalization = await _context.Hospitalizations.FindAsync(id);
            if (hospitalization != null)
            {
                _context.Hospitalizations.Remove(hospitalization);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool HospitalizationExists(int id)
        {
            return _context.Hospitalizations.Any(e => e.HospitalizationId == id);
        }
    }
}
