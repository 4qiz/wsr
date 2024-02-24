using System;
using System.Collections.Generic;

namespace RegistrationWebApp.Models;

public partial class Event
{
    public int EventId { get; set; }

    public string Title { get; set; } = null!;

    public DateTime Date { get; set; }

    public int TypeId { get; set; }

    public string? Recomendations { get; set; }

    public int MedicalCardId { get; set; }

    public byte[]? VoiceMessage { get; set; }

    public int DoctorId { get; set; }

    public virtual Doctor Doctor { get; set; } = null!;

    public virtual Patient MedicalCard { get; set; } = null!;

    public virtual ICollection<Recipe> Recipes { get; set; } = new List<Recipe>();

    public virtual ICollection<Result> Results { get; set; } = new List<Result>();

    public virtual EventType Type { get; set; } = null!;
}
