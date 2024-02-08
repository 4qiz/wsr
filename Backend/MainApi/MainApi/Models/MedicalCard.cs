using System;
using System.Collections.Generic;

namespace MainApi.Models;

public partial class MedicalCard
{
    public int MedicalCardId { get; set; }

    public DateTime MedicalCardStartDate { get; set; }

    public DateTime? NextVisitDate { get; set; }

    public virtual ICollection<Hospitalization> Hospitalizations { get; set; } = new List<Hospitalization>();

    public virtual Patient? Patient { get; set; }

    public virtual ICollection<Therapy> Therapies { get; set; } = new List<Therapy>();
}
