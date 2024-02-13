using System;
using System.Collections.Generic;

namespace MainApi.ModelsDb;

public partial class Specialization
{
    public int SpecializationId { get; set; }

    public string Title { get; set; } = null!;

    public virtual ICollection<Doctor> Doctors { get; set; } = new List<Doctor>();
}
