using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Hosting;
using System.Drawing;
using System.IO;
using ZXing.Windows.Compatibility;
using ZXing;
using Microsoft.EntityFrameworkCore;
using RegistrationWebApp.Data;

namespace RegistrationWebApp.Controllers
{
    public class FindPatientController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IWebHostEnvironment _hostEnvironment;

        public FindPatientController(ApplicationDbContext context, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            _hostEnvironment = hostEnvironment;
        }

        // GET: FindPatientController
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(IFormFile file)
        {
            if (file == null)
            {
                return BadRequest("No file provided.");
            }

            string filePath = _hostEnvironment.WebRootPath + "\\Images\\Qrcode.png";

            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                file.CopyToAsync(stream).Wait();
            }
            string qrCodeMedCard;
            var reader = new BarcodeReaderGeneric();
            Bitmap image = (Bitmap)Image.FromFile(filePath);
            using (image)
            {
                var source = new BitmapLuminanceSource(image);
                Result res = reader.Decode(source);
                if (res == null)
                {
                    ViewBag.Text = "Не удалось считать QR code";
                    return View();
                }
                ViewBag.Text = qrCodeMedCard =  res?.Text ?? "Не удалось считать QR code";
            }
            var medicalCard = _context.MedicalCards.FirstOrDefault(p => p.MedicalCardId.ToString() == qrCodeMedCard);
            if (medicalCard == null)
            {
                ViewBag.Text = $"Не удалось найти пациента с номером мед карты: {qrCodeMedCard}";
                return View();
            }

            return RedirectToAction("Detail", "Register", medicalCard);
        }
    }
}
