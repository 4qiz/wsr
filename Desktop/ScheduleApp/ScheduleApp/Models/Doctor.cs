using System;
using System.Collections.Generic;

namespace ScheduleApp.Models;

public partial class Doctor
{
    public int DoctorId { get; set; }

    public string Specialization { get; set; } = null!;

    public virtual ICollection<BookingToEvent> BookingToEvents { get; set; } = new List<BookingToEvent>();

    public virtual User DoctorNavigation { get; set; } = null!;
}
