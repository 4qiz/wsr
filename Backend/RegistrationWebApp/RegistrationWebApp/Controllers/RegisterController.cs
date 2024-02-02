﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RegistrationWebApp.Data;
using RegistrationWebApp.Models;
using System.Drawing;
using ZXing.QrCode;
using ZXing;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc.ModelBinding;

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
        public IActionResult Index(Patient patient)
        {
            if (!ModelState.IsValid) {
                return View();
            }
            if (_context.Patients.Any(p => p.Passport == patient.Passport))
            {
                return BadRequest("Паспорт уже существует");
            }
            var medicalCard = new MedicalCard() { MedicalCardStartDate = DateTime.Now };
            _context.Add(medicalCard);
            patient.MedicalCard = medicalCard;

            _context.Add(patient);
            _context.SaveChanges();
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

            return View(patient);
        }
    }
}
