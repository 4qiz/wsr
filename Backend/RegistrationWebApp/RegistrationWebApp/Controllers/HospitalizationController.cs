using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RegistrationWebApp.Data;
using RegistrationWebApp.DTO;
using RegistrationWebApp.Models;

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

        public IActionResult CreateHospitalization()
        {
            return View();
        }

        [HttpPost]
        public IActionResult CreateHospitalization(Hospitalization hospitalization)
        {
            try
            {
                hospitalization.IsCanceled = false;
                hospitalization.CancelReason = " ";

                _context.Add(hospitalization);
                _context.SaveChanges();
                ViewBag.Message = "registred";

                return View();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        public IActionResult Detail(int hospitalizationCode)
        {
            try
            {
                var therapy = _context.Therapies
                    .Include(t => t.MedicalCard)
                    .ThenInclude(mc => mc.Patient)
                    .ThenInclude(p => p.InsurancePolicy)
                    .FirstOrDefault(t => t.HospitalizationCode == hospitalizationCode);
                var hospitalization = _context.Hospitalizations
                    .FirstOrDefault(h => h.HospitalizationCode == hospitalizationCode);

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
                    Diagnosys = therapy.Diagnosis,
                    HospitalizationId = hospitalization.HospitalizationId
                };
                return View(hospitalizationInfoDto);
            }
            catch (Exception)
            {
                return BadRequest("Нет такого кода на госпитализацию");
            }
        }

        public IActionResult Edit(int id)
        {
            try
            {
                var hospitalization = _context.Hospitalizations
                    .FirstOrDefault(h => h.HospitalizationId == id);
                if (hospitalization == null)
                    return BadRequest("не найдена госпитализация");
                return View(hospitalization);
            }
            catch (Exception)
            {
                return BadRequest("Нет такого кода на госпитализацию");
            }
        }

        [HttpPost]
        public IActionResult Edit(int id, Hospitalization hospitalization)
        {
            try
            {
                var userHospitalization = _context.Hospitalizations
                    .FirstOrDefault(h => h.HospitalizationId == id);
                if (hospitalization == null)
                {
                    return View(hospitalization);
                }
                var updatedHospitalization = new Hospitalization
                {
                    HospitalizationId = id,
                    Bed = hospitalization.Bed,
                    CancelReason = hospitalization.CancelReason,
                    Goal = hospitalization.Goal,
                    EndDate = hospitalization.EndDate,
                    StartDate = hospitalization.StartDate,
                    HospitalizationCode = hospitalization.HospitalizationCode,
                    HospitalRoom = hospitalization.HospitalizationCode,
                    IsCanceled = hospitalization.IsCanceled,
                    MedicalCardId = hospitalization.MedicalCardId,
                    Price = hospitalization.Price,
                };
                _context.Update(updatedHospitalization);
                _context.SaveChanges();
                ViewBag.Message = "edited";
                return View(updatedHospitalization);
            }
            catch (Exception)
            {
                return BadRequest("Нет такого кода на госпитализацию");
            }
        }
    }
}
