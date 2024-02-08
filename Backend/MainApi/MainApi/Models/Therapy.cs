using System;
using System.Collections.Generic;

namespace MainApi.Models;

public partial class Therapy
{
    public int TherapyId { get; set; }

    public string Title { get; set; } = null!;

    public string Diagnosis { get; set; } = null!;

    public decimal Price { get; set; }

    public int? HospitalizationCode { get; set; }

    public string? Recomendations { get; set; }

    public int TypeId { get; set; }

    public int MedicalCardId { get; set; }

    public int DoctorId { get; set; }

    public string? Direction { get; set; }

    public DateTime? Date { get; set; }

    public virtual Doctor Doctor { get; set; } = null!;

    public virtual MedicalCard MedicalCard { get; set; } = null!;

    public virtual ICollection<TherapyRecipe> TherapyRecipes { get; set; } = new List<TherapyRecipe>();

    public virtual ICollection<TherapyResult> TherapyResults { get; set; } = new List<TherapyResult>();

    public virtual TherapyType Type { get; set; } = null!;
}
