using System;
using System.Collections.Generic;

namespace ScheduleApp.Models;

public partial class ScheduleMonth
{
    public int ScheduleMonthId { get; set; }

    public short Year { get; set; }

    public byte Month { get; set; }

    public bool IsApproved { get; set; }

    public virtual ICollection<BookingToEvent> BookingToEvents { get; set; } = new List<BookingToEvent>();
}
