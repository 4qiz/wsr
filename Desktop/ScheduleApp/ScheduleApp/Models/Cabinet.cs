using System;
using System.Collections.Generic;

namespace ScheduleApp.Models;

public partial class Cabinet
{
    public int CabinetId { get; set; }

    public int Number { get; set; }

    public virtual ICollection<ScheduleItem> ScheduleItems { get; set; } = new List<ScheduleItem>();
}
