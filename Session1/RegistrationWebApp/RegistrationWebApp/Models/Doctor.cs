using System;
using System.Collections.Generic;

namespace RegistrationWebApp.Models;

public partial class Doctor
{
    public int UserId { get; set; }

    public string Name { get; set; } = null!;

    public string SurName { get; set; } = null!;

    public string Patronymic { get; set; } = null!;

    public string Specialization { get; set; } = null!;

    public virtual ICollection<BookingToEvent> BookingToEvents { get; set; } = new List<BookingToEvent>();

    public virtual ICollection<Event> Events { get; set; } = new List<Event>();

    public virtual User User { get; set; } = null!;
}
