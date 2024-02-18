using System;
using System.Collections.Generic;

namespace ScheduleApp.Models;

public partial class EventType
{
    public int TypeId { get; set; }

    public string Title { get; set; } = null!;

    public virtual ICollection<BookingToEvent> BookingToEvents { get; set; } = new List<BookingToEvent>();
}
