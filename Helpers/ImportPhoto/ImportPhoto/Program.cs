using ImportPhoto.Data;

namespace ImportPhoto
{
    internal class Program
    {
        static void Main(string[] args)
        {
            var files = Directory.GetFiles(@"D:\UCHEBA\MDK\wsr\2024\Faces100");
            using var context = new AppDbContext();
            for (int i = 1; i < 101; i++)
            {
                var bytes = File.ReadAllBytes(files[i-1]);
                var patient = context.Patients.FirstOrDefault(x => x.PatientId == i);
                patient.Photo = bytes;
                context.Update(patient);
                context.SaveChanges();
                Console.WriteLine($"{i} фото загружено");
            }
        }
    }
}
