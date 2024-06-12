using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using RegistrationWebApp.Models;
using System.Diagnostics;
using System.Text.Json.Serialization;

namespace RegistrationWebApp.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            var json = @"[
  {
    ""applicantPersonId"": 1,
    ""firstName"": ""hjoioi"",
    ""surName"": ""oijoj"",
    ""patronymic"": ""oijoij"",
    ""jobTitle"": ""00000""
  },
  {
    ""applicantPersonId"": 2,
    ""firstName"": ""qqqqqqqq"",
    ""surName"": ""qqqqq"",
    ""patronymic"": ""qqqqq"",
    ""jobTitle"": ""zzzzz""
  },
  {
    ""applicantPersonId"": 3,
    ""firstName"": ""222"",
    ""surName"": ""3333"",
    ""patronymic"": ""4444"",
    ""jobTitle"": ""1111""
  }
]";
            List<Class1> applicants = JsonConvert.DeserializeObject<List<Class1>>(json);

            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
