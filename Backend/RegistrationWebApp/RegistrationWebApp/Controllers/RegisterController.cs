﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RegistrationWebApp.Data;
using RegistrationWebApp.Models;
using System.Drawing;
using System.Reflection.Metadata;
using ZXing;
using ZXing.QrCode;

namespace RegistrationWebApp.Controllers
{
    public class RegisterController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IWebHostEnvironment _hostEnvironment;

        public RegisterController(ApplicationDbContext context, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            _hostEnvironment = hostEnvironment;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Index(
            Patient patient,
            IFormFile Image)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            if (PatientExist(patient))
            {
                return BadRequest("Пациент уже существует");
            }

            // adding image 

            if (Image.Length > 0 && Image.Length < 1000000)
            {
            //Convert Image to byte and save to database
                byte[] imageBytes = null;
                using (var fs1 = Image.OpenReadStream())
                using (var ms1 = new MemoryStream())
                {
                    fs1.CopyTo(ms1);
                    imageBytes = ms1.ToArray();
                }
                patient.Photo = imageBytes;
            }

            // adding med card to patient 
            var medicalCard = new MedicalCard() { MedicalCardStartDate = DateTime.Now };
            _context.Add(medicalCard);
            patient.MedicalCard = medicalCard;

            _context.Add(patient);
            _context.SaveChanges();
            /////
            var newPatient = _context.Patients.FirstOrDefault(p => p.Passport == patient.Passport);

            var writer = new QRCodeWriter();
            var resBit = writer.encode(newPatient.MedicalCardId.ToString(), BarcodeFormat.QR_CODE, 200, 200);
            var matrix = resBit;
            Bitmap result = new Bitmap(matrix.Width, matrix.Height);
            for (int x = 0; x < matrix.Height; x++)
            {
                for (int y = 0; y < matrix.Width; y++)
                {
                    Color pixel = matrix[x, y] ? Color.Black : Color.White;
                    result.SetPixel(x, y, pixel);
                }
            }
            string webRootPath = _hostEnvironment.WebRootPath;
            result.Save(webRootPath + "\\Images\\Qrcode.png");
            ViewBag.URL = "\\Images\\Qrcode.png";

            ////


            return View(patient);
        }

        public async Task<IActionResult> Detail(MedicalCard medicalCard)
        {
            if (medicalCard is null)
            {
                return BadRequest("не найден пациент по qr коду");
            }
            //костыль, тк иклуд теряется при передаче
            var patientWithPolicy = await _context.Patients.Include(i => i.InsurancePolicy).Include(m => m.MedicalCard).FirstOrDefaultAsync(p => p.MedicalCardId == medicalCard.MedicalCardId);
            return View(patientWithPolicy);
        }

        private bool PatientExist(Patient patient)
        {
            return _context.Patients.Any(p => p.Passport == patient.Passport);
        }
    }
}