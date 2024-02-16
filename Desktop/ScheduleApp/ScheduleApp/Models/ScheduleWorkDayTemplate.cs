using System;
using System.Collections.Generic;

namespace ScheduleApp.Models;

public partial class ScheduleWorkDayTemplate
{
    public int ScheduleTemplateId { get; set; }

    public string Title { get; set; } = null!;

    public virtual ICollection<WorkHour> WorkHours { get; set; } = new List<WorkHour>();
}
