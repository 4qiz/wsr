using System;
using System.Collections.Generic;

namespace MapApp.Models;

public partial class WorkHour
{
    public int WorkHoursId { get; set; }

    public TimeOnly WorkStartTime { get; set; }

    public TimeOnly WorkEndTime { get; set; }

    public int ScheduleTemplateId { get; set; }

    public virtual ScheduleTemplate ScheduleTemplate { get; set; } = null!;
}
