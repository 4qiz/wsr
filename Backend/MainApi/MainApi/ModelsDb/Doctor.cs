using System;
using System.Collections.Generic;

namespace MainApi.ModelsDb;

public partial class Doctor
{
    public int DoctorId { get; set; }

    public int SpecializationId { get; set; }

    public virtual User DoctorNavigation { get; set; } = null!;

    public virtual Specialization Specialization { get; set; } = null!;

    public virtual ICollection<Therapy> Therapies { get; set; } = new List<Therapy>();
}
