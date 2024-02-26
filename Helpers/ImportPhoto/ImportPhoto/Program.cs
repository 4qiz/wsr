using ImportPhoto.Data;
using System.Xml.Serialization;

namespace ImportPhoto
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //var files = Directory.GetFiles(@"D:\UCHEBA\MDK\wsr\2024\Faces100");
            //using var context = new AppDbContext();
            //for (int i = 1; i < 101; i++)
            //{
            //    var bytes = File.ReadAllBytes(files[i-1]);
            //    var patient = context.Patients.FirstOrDefault(x => x.PatientId == i);
            //    patient.Photo = bytes;
            //    context.Update(patient);
            //    context.SaveChanges();
            //    Console.WriteLine($"{i} фото загружено");
            //}

            MakeXml();
        }

        private static void MakeXml()
        {
            var context = new AppDbContext();
            var patient = context.Patients.First();
            var patientsXml = new List<PatientXml>
            {
                new PatientXml{
                Address = patient.Address,
                DateOfBirth = patient.DateOfBirth,
                Email = patient.Email,
                IsMale = patient.IsMale,
                Passport = patient.Passport,
                PatientId = patient.PatientId,
                PhoneNumber = patient.PhoneNumber,
            },
                new PatientXml{
                Address = patient.Address,
                DateOfBirth = patient.DateOfBirth,
                Email = patient.Email,
                IsMale = patient.IsMale,
                Passport = patient.Passport,
                PatientId = patient.PatientId,
                PhoneNumber = patient.PhoneNumber,
            }
            }
            ;
            var xml = new XmlSerializer(typeof(List<PatientXml>));
            using (var fs = new FileStream("D:\\Downloads\\xml.xml", FileMode.OpenOrCreate))
            {
                xml.Serialize(fs, patientsXml);

            }
        }
    }
}
