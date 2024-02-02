using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Hosting;
using RegistrationWebApp.Data;
using RegistrationWebApp.Models;
using System.Diagnostics;
using System.Drawing;
using ZXing;
using ZXing.QrCode;

namespace RegistrationWebApp.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
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
