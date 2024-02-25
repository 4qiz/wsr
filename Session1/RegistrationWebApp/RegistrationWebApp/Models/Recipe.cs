using System;
using System.Collections.Generic;

namespace RegistrationWebApp.Models;

public partial class Recipe
{
    public int RecipeId { get; set; }

    public string Title { get; set; } = null!;

    public string Dosage { get; set; } = null!;

    public string Description { get; set; } = null!;

    public int EventId { get; set; }

    public virtual Event Event { get; set; } = null!;
}
