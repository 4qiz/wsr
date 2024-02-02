using System;
using System.Collections.Generic;

namespace RegistrationWebApp.Models;

public partial class Doctor
{
    public int DoctorId { get; set; }

    public string Specialization { get; set; } = null!;

    public virtual User DoctorNavigation { get; set; } = null!;

    public virtual ICollection<Therapy> Therapies { get; set; } = new List<Therapy>();
}
