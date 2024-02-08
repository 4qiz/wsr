namespace RegistrationWebApp.DTO
{
    public class HospitalizationInfoDto
    {
        public string Name { get; set; } = null!;

        public string SurName { get; set; } = null!;

        public string Patronymic { get; set; } = null!;

        public string Passport { get; set; } = null!;
        public string? PassportIssuedBy { get; set; }

        public DateOnly DateOfBirth { get; set; }

        public bool IsMale { get; set; }

        public string Address { get; set; } = null!;

        public string PhoneNumber { get; set; } = null!;

        public string Email { get; set; } = null!;

        public string? Job { get; set; }

        public byte[]? Photo { get; set; }

        public int? MedicalCardId { get; set; }

        public string PolicyNumber { get; set; } = null!;

        public DateOnly PolicyEndDate { get; set; }

        public string PolicyCompany { get; set; } = null!;

        public int HospitalizationId { get; set; }

        public int HospitalizationCode { get; set; } 

        public decimal Price { get; set; }

        public string? Goal { get; set; }

        public int HospitalRoom { get; set; }
        public string BedNumber { get; set; } = string.Empty;

        public DateTime? StartDate { get; set; }

        public DateTime? EndDate { get; set; }

        public bool IsCanceled { get; set; }

        public string CancelReason { get; set; } = null!;

        public string Diagnosys { get; set; } = null!;

    }
}
