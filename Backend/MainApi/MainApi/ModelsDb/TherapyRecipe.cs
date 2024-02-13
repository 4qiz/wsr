using System;
using System.Collections.Generic;

namespace MainApi.ModelsDb;

public partial class TherapyRecipe
{
    public int TherapyRecipeId { get; set; }

    public string Title { get; set; } = null!;

    public string? Description { get; set; }

    public int? TherapyId { get; set; }

    public string? Dosage { get; set; }

    public virtual Therapy? Therapy { get; set; }
}
