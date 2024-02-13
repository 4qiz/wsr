using System;
using System.Collections.Generic;

namespace MainApi.ModelsDb;

public partial class ScheduleTemplate
{
    public int ShiftId { get; set; }

    public TimeOnly StartTime { get; set; }

    public TimeOnly EndTime { get; set; }
}
