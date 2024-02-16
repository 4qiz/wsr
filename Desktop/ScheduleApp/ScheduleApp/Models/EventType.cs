using System;
using System.Collections.Generic;

namespace ScheduleApp.Models;

public partial class EventType
{
    public int TypeId { get; set; }

    public string Title { get; set; } = null!;

    public virtual ICollection<Event> Events { get; set; } = new List<Event>();
}
