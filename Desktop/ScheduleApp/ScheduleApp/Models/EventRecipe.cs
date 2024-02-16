using System;
using System.Collections.Generic;

namespace ScheduleApp.Models;

public partial class EventRecipe
{
    public int TherapyRecipeId { get; set; }

    public string Title { get; set; } = null!;

    public string? Description { get; set; }

    public int? TherapyId { get; set; }

    public string? Dosage { get; set; }

    public virtual Event? Therapy { get; set; }
}
