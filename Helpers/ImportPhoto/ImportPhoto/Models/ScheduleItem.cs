using System;
using System.Collections.Generic;

namespace ImportPhoto.Models;

public partial class ScheduleItem
{
    public int ScheduleId { get; set; }

    public int? DoctorId { get; set; }

    public int? PatientId { get; set; }

    public int? EventId { get; set; }

    public DateTime EventStartDate { get; set; }

    public int? ScheduleMonthId { get; set; }

    public bool IsChanged { get; set; }

    public DateTime EventEndDate { get; set; }

    public int? CabinetId { get; set; }

    public virtual Cabinet? Cabinet { get; set; }

    public virtual Doctor? Doctor { get; set; }

    public virtual Event? Event { get; set; }

    public virtual Patient? Patient { get; set; }

    public virtual ScheduleMonth? ScheduleMonth { get; set; }
}
