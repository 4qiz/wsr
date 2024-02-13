using Microsoft.AspNetCore.Mvc;
using System.Collections.Concurrent;
using Web.Models;

namespace Web.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class HospitalSchemeController : ControllerBase
    {
        private readonly ILogger<HospitalSchemeController> _logger;

        public HospitalSchemeController(ILogger<HospitalSchemeController> logger)
        {
            _logger = logger;
        }

        /// <summary>
        /// Метод получения персоны
        /// </summary>
        /// <param name="count"></param>
        /// <returns></returns>
        [HttpGet("persons")]
        public async Task<List<Person>> GetPersons(int count = 10)
        {
            var date = DateTime.Now;
            List<Person> persons = new();

            int cores = count / 4;
            for(int j = 0; j < 4; j++)
            {
                await Task.Run(() =>
                {
                    for (int i = 0; i < cores; i++)
                    {
                        persons.Add(new Person());
                    }
                });
            };

            return persons;
        }

        /// <summary>
        /// Метод получения персоны
        /// </summary>
        /// <param name="count"></param>
        /// <returns></returns>
        [HttpGet("personsTwo")]
        public async Task<List<Person>> GetPersonsTwo(int count = 10)
        {
            var date = DateTime.Now;
            List<Person> persons = new();

            for (int i = 0; i < count; i++)
            {
                persons.Add(new Person());
            }

            return persons;
        }
    }
}
