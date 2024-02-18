using System;
using System.Collections.Generic;

namespace ImportPhoto.Models;

public partial class WorkHour
{
    public int WorkHoursId { get; set; }

    public TimeOnly StartTime { get; set; }

    public TimeOnly EndTime { get; set; }

    public int? ScheduleTemplateId { get; set; }

    public virtual ScheduleWorkDayTemplate? ScheduleTemplate { get; set; }
}
