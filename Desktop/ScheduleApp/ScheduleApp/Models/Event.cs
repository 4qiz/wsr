using System;
using System.Collections.Generic;

namespace ScheduleApp.Models;

public partial class Event
{
    public int EventId { get; set; }

    public string Title { get; set; } = null!;

    public string Diagnosis { get; set; } = null!;

    public decimal Price { get; set; }

    public int? HospitalizationCode { get; set; }

    public string? Recomendations { get; set; }

    public int TypeId { get; set; }

    public int MedicalCardId { get; set; }

    public int DoctorId { get; set; }

    public int? DirectionToEvent { get; set; }

    public byte[]? VoiceMessage { get; set; }

    public virtual Event? DirectionToEventNavigation { get; set; }

    public virtual ICollection<EventRecipe> EventRecipes { get; set; } = new List<EventRecipe>();

    public virtual ICollection<EventResult> EventResults { get; set; } = new List<EventResult>();

    public virtual Hospitalization? HospitalizationCodeNavigation { get; set; }

    public virtual ICollection<Event> InverseDirectionToEventNavigation { get; set; } = new List<Event>();

    public virtual ICollection<ScheduleItem> ScheduleItems { get; set; } = new List<ScheduleItem>();

    public virtual EventType Type { get; set; } = null!;
}
