using System;
using System.Collections.Generic;

namespace ScheduleApp.Models;

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

    public int InsurancePolicyNumber { get; set; }

    public DateOnly? InsurancePolicyEndDate { get; set; }

    public string InsuranceCompany { get; set; } = null!;

    public string PassportIssuedBy { get; set; } = null!;

    public virtual ICollection<ScheduleItem> ScheduleItems { get; set; } = new List<ScheduleItem>();

    public virtual UserHasPatient? UserHasPatient { get; set; }
}
