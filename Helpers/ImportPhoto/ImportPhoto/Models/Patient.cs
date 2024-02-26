namespace ImportPhoto.Models;

[Serializable]
public partial class Patient
{
    public int PatientId { get; set; }

    public string Passport { get; set; } = null!;

    public DateOnly DateOfBirth { get; set; }

    public bool IsMale { get; set; }

    public string Address { get; set; } = null!;

    public string PhoneNumber { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string? Job { get; set; }

    public byte[]? Photo { get; set; }

    public int? MedicalCardNumber { get; set; }

    public string InsurancePolicyNumber { get; set; } = null!;

    public DateOnly? InsurancePolicyEndDate { get; set; }

    public string InsuranceCompany { get; set; } = null!;

    public string PassportIssuedBy { get; set; } = null!;

    public virtual User PatientNavigation { get; set; } = null!;

    public virtual ICollection<ScheduleItem> ScheduleItems { get; set; } = new List<ScheduleItem>();
}
