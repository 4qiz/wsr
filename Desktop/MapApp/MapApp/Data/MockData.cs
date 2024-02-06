using MapApp.Models;

namespace MapApp.Data
{
    public class MockData
    {
        public static List<Hospitalization> GetHospitalizations()
        {
            return new List<Hospitalization>
            {
                new Hospitalization
                {
                    HospitalizationId = 1,
                    HospitalizationCode = "103",
                    MedicalCardId = 12345,
                    Price = 1500.00m,
                    Goal = "Recovery from surgery",
                    HospitalRoom = 103,
                    StartDate = new DateTime(2021, 01, 01),
                    EndDate = new DateTime(2021, 01, 10),
                    IsCanceled = false,
                    CancelReason = "None",
                    Bed = 'А'
                },
                // Add more Hospitalization objects here
                new Hospitalization
                {
                    HospitalizationId = 2,
                    HospitalizationCode = "103",
                    MedicalCardId = 12346,
                    Price = 2000.00m,
                    Goal = "Rehabilitation after stroke",
                    HospitalRoom = 103,
                    StartDate = new DateTime(2021, 01, 15),
                    EndDate = new DateTime(2021, 01, 25),
                    IsCanceled = false,
                    CancelReason = "None",
                    Bed = 'Б'
                },
                // ... Add more rows here ...
                new Hospitalization
                {
                    HospitalizationId = 10,
                    HospitalizationCode = "103",
                    MedicalCardId = 12356,
                    Price = 3500.00m,
                    Goal = "Treatment of chronic illness",
                    HospitalRoom = 102,
                    StartDate = new DateTime(2021, 02, 01),
                    EndDate = new DateTime(2024, 02, 10),
                    IsCanceled = true,
                    CancelReason = "Patient's condition worsened",
                    Bed = 'В'
                }
            };
        }

    }
}
