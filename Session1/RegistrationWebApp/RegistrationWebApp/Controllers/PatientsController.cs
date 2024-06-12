using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RegistrationWebApp.Data;
using RegistrationWebApp.Models;
using System.Drawing;
using ZXing;
using ZXing.QrCode;
using ZXing.Windows.Compatibility;

namespace RegistrationWebApp.Controllers
{
    public class PatientsController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _hostEnvironment;

        public PatientsController(AppDbContext context, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            _hostEnvironment = hostEnvironment;
        }

        // GET: Patients
        public async Task<IActionResult> Index()
        {
            return View(await _context.Patients.ToListAsync());
        }

        [HttpPost]
        public async Task<IActionResult> Index(IFormFile file)
        {
            if (file != null)
            {
                var path = _hostEnvironment.WebRootPath + "\\Images\\qrcode.png";
                using (var filestream = new FileStream(path, FileMode.Create))
                {
                    file.CopyToAsync(filestream).Wait();
                }
                var bitmapFromFile = (Bitmap)Image.FromFile(path);
                using (bitmapFromFile)
                {
                    var reader = new BarcodeReaderGeneric();
                    var qrcode = new BitmapLuminanceSource(bitmapFromFile);
                    var decodedId = reader.Decode(qrcode);
                    if (int.TryParse(decodedId.Text, out int id))
                    {
                        if (await _context.Patients.AnyAsync(p => p.MedicalCardId == id))
                        {
                            return RedirectToAction("Details", new { id = id });
                        }
                    }
                }

            }
            return BadRequest("Не удалось распознать номер пациента");
        }

        // GET: Patients/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var patient = await _context.Patients
                .FirstOrDefaultAsync(m => m.MedicalCardId == id);
            if (patient == null)
            {
                return NotFound();
            }
            if (patient.Qrcode == null)
            {
                GenerateQRCode(patient.Passport);
            }
            return View(patient);
        }

        private void GenerateQRCode(string passport)
        {

            var createdPatient = _context.Patients.FirstOrDefault(p => p.Passport == passport);

            if (createdPatient == null)
            {
                return;
            }

            BarcodeWriter writer = new BarcodeWriter();
            writer.Options = new QrCodeEncodingOptions
            {
                Width = 200,
                Height = 200
            };
            writer.Format = ZXing.BarcodeFormat.QR_CODE;
            Bitmap qrcode = writer.Write(createdPatient.MedicalCardId.ToString());
            qrcode.Save(_hostEnvironment.WebRootPath + "\\Images\\qrcode.png");

            createdPatient.Qrcode = System.IO.File.ReadAllBytes(_hostEnvironment.WebRootPath + "\\Images\\qrcode.png");
            _context.Update(createdPatient);
            _context.SaveChanges();
        }

        // GET: Patients/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Patients/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(
            [Bind("MedicalCardId,Name,SurName,Patronymic,RegistrationDate,Passport,PassportIssuedBy,InsurancyPolicy,InsurancyPolicyCompany,InsurancyPolicyEndDate,DateOfBirth,IsMale,Address,PhoneNumber,Email,Photo,WorkPlace")] Patient patient,
            IFormFile image)
        {
            if (ModelState.IsValid)
            {
                if (image != null)
                {
                    byte[] imageBytes = null;
                    using (var binaryReader = new BinaryReader(image.OpenReadStream()))
                    {
                        imageBytes = binaryReader.ReadBytes((int)image.Length);
                    }
                    patient.Photo = imageBytes;
                }

                _context.Add(patient);
                await _context.SaveChangesAsync();

                var createdPatient = await _context.Patients.FirstOrDefaultAsync(p => p.Passport == patient.Passport);

                if (createdPatient == null)
                {
                    return BadRequest("Не удалось создать пациента");
                }

                BarcodeWriter writer = new BarcodeWriter();
                writer.Options = new QrCodeEncodingOptions
                {
                    Width = 200,
                    Height = 200
                };
                writer.Format = ZXing.BarcodeFormat.QR_CODE;
                Bitmap qrcode = writer.Write(createdPatient.MedicalCardId.ToString());
                qrcode.Save(_hostEnvironment.WebRootPath + "\\Images\\qrcode.png");

                createdPatient.Qrcode = System.IO.File.ReadAllBytes(_hostEnvironment.WebRootPath + "\\Images\\qrcode.png");
                _context.Update(createdPatient);
                _context.SaveChanges();
                return RedirectToAction("Details", new { id = createdPatient.MedicalCardId });
            }
            return View(patient);
        }


        // GET: Patients/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var patient = await _context.Patients.FindAsync(id);
            if (patient == null)
            {
                return NotFound();
            }
            return View(patient);
        }

        // POST: Patients/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("MedicalCardId,Name,SurName,Patronymic,RegistrationDate,Passport,PassportIssuedBy,InsurancyPolicy,InsurancyPolicyCompany,InsurancyPolicyEndDate,DateOfBirth,IsMale,Address,PhoneNumber,Email,Photo,WorkPlace")] Patient patient)
        {
            if (id != patient.MedicalCardId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(patient);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PatientExists(patient.MedicalCardId))
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
            return View(patient);
        }

        private bool PatientExists(int id)
        {
            return _context.Patients.Any(e => e.MedicalCardId == id);
        }

        private bool PatientExistsByPassport(string passport)
        {
            return _context.Patients.Any(e => e.Passport == passport);
        }
    }
}
