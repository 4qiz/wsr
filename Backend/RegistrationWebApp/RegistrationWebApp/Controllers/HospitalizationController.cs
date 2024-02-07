using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RegistrationWebApp.Data;
using RegistrationWebApp.DTO;

namespace RegistrationWebApp.Controllers
{
    public class HospitalizationController : Controller
    {
        private readonly ApplicationDbContext _context;

        public HospitalizationController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Detail(int hospitalizationCode)
        {
            var therapy = _context.Therapies.Include(t => t.MedicalCard).ThenInclude(mc=>mc.Patient).ThenInclude(p => p.InsurancePolicy).FirstOrDefault(t=>t.HospitalizationCode == hospitalizationCode);
            var hospitalization = _context.Hospitalizations.FirstOrDefault(h => h.HospitalizationCode == therapy.HospitalizationCode);
            if (therapy == null || hospitalization == null) 
                return BadRequest("Не найден код госпитализации");

            var hospitalizationInfoDto = new HospitalizationInfoDto
            {
                MedicalCardId = therapy.MedicalCard.MedicalCardId,
                Name = therapy.MedicalCard.Patient.Name,
                SurName = therapy.MedicalCard.Patient.SurName,
                Patronymic = therapy.MedicalCard.Patient.Patronymic,
                Passport = therapy.MedicalCard.Patient.Passport,
                DateOfBirth = therapy.MedicalCard.Patient.DateOfBirth,
                IsMale = therapy.MedicalCard.Patient.IsMale,
                Address = therapy.MedicalCard.Patient.Address,
                PhoneNumber = therapy.MedicalCard.Patient.PhoneNumber,
                Email = therapy.MedicalCard.Patient.Email,
                Job = therapy.MedicalCard.Patient.Job,
                PolicyNumber = therapy.MedicalCard.Patient.InsurancePolicy.Number,
                PolicyCompany = therapy.MedicalCard.Patient.InsurancePolicy.Company,
                PolicyEndDate = therapy.MedicalCard.Patient.InsurancePolicy.EndDate,
                Price = hospitalization.Price,
                Goal = hospitalization.Goal,
                HospitalRoom = hospitalization.HospitalRoom,
                BedNumber = hospitalization.Bed,
                StartDate = hospitalization.StartDate,
                EndDate = hospitalization.EndDate,
            };
            return View(hospitalizationInfoDto);
        }
    }
}
