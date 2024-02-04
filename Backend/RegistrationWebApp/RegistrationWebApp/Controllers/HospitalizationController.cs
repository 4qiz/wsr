using Microsoft.AspNetCore.Mvc;

namespace RegistrationWebApp.Controllers
{
    public class HospitalizationController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
