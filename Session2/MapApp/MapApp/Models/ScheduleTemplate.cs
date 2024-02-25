using System;
using System.Collections.Generic;

namespace MapApp.Models;

public partial class ScheduleTemplate
{
    public int ScheduleTemplateId { get; set; }

    public string Title { get; set; } = null!;

    public virtual ICollection<WorkHour> WorkHours { get; set; } = new List<WorkHour>();
}
