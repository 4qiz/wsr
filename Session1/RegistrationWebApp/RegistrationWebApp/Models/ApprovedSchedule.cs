using System;
using System.Collections.Generic;

namespace RegistrationWebApp.Models;

public partial class ApprovedSchedule
{
    public int ApprovedScheduleId { get; set; }

    public int Year { get; set; }

    public int Month { get; set; }

    public bool IsApproved { get; set; }

    public virtual ICollection<BookingToEvent> BookingToEvents { get; set; } = new List<BookingToEvent>();
}
