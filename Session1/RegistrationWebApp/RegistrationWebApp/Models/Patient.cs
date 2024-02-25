using System;
using System.Collections.Generic;

namespace RegistrationWebApp.Models;

public partial class Patient
{
    public int MedicalCardId { get; set; }

    public string Name { get; set; } = null!;

    public string SurName { get; set; } = null!;

    public string? Patronymic { get; set; }

    public string? FullName
    {
        get
        {
            return SurName + " " + Name + " " + Patronymic;
        }
    }

    public DateTime? RegistrationDate { get; set; }

    public string Passport { get; set; } = null!;

    public string? PassportIssuedBy { get; set; }

    public string InsurancyPolicy { get; set; } = null!;

    public string InsurancyPolicyCompany { get; set; } = null!;

    public DateTime InsurancyPolicyEndDate { get; set; }

    public DateTime DateOfBirth { get; set; }

    public bool IsMale { get; set; }

    public string Address { get; set; } = null!;

    public string PhoneNumber { get; set; } = null!;

    public string Email { get; set; } = null!;

    public byte[]? Photo { get; set; }

    public string WorkPlace { get; set; } = null!;

    public byte[]? Qrcode { get; set; }

    public virtual ICollection<Event> Events { get; set; } = new List<Event>();

    public virtual ICollection<Hospitalization> Hospitalizations { get; set; } = new List<Hospitalization>();

    public virtual UserHasPatient? UserHasPatient { get; set; }

    public virtual ICollection<BookingToEvent> BookingToEvents { get; set; } = new List<BookingToEvent>();
}
