using System;
using System.Collections.Generic;

namespace MainApi.ModelsDb;

public partial class Patient
{
    public int PatientId { get; set; }

    public string Name { get; set; } = null!;

    public string SurName { get; set; } = null!;

    public string Patronymic { get; set; } = null!;

    public string Passport { get; set; } = null!;

    public DateOnly DateOfBirth { get; set; }

    public bool IsMale { get; set; }

    public string Address { get; set; } = null!;

    public string PhoneNumber { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string? Job { get; set; }

    public byte[]? Photo { get; set; }

    public int? MedicalCardId { get; set; }

    public int InsurancePolicyId { get; set; }

    public string? PassportIssuedBy { get; set; }

    public virtual InsurancePolicy InsurancePolicy { get; set; } = null!;

    public virtual MedicalCard? MedicalCard { get; set; }
}
