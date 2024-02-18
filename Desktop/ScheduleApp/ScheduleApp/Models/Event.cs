using System;
using System.Collections.Generic;

namespace ScheduleApp.Models;

public partial class Event
{
    public int EventId { get; set; }

    public string Title { get; set; } = null!;

    public string Diagnosis { get; set; } = null!;

    public decimal Price { get; set; }

    public string? Recomendations { get; set; }

    public int TypeId { get; set; }

    public byte[]? VoiceMessage { get; set; }

    public int PatientId { get; set; }

    public virtual ICollection<BookingToEvent> BookingToEvents { get; set; } = new List<BookingToEvent>();

    public virtual EventHasHospitalization? EventHasHospitalization { get; set; }

    public virtual ICollection<EventRecipe> EventRecipes { get; set; } = new List<EventRecipe>();

    public virtual ICollection<EventResult> EventResults { get; set; } = new List<EventResult>();

    public virtual Patient Patient { get; set; } = null!;
}
