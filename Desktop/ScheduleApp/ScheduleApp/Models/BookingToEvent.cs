using System;
using System.Collections.Generic;

namespace ScheduleApp.Models;

public partial class BookingToEvent
{
    public int BookingId { get; set; }

    public int DoctorId { get; set; }

    public DateTime EventStartDate { get; set; }

    public DateTime? EventEndDate { get; set; }

    public int? ScheduleMonthId { get; set; }

    public bool IsChanged { get; set; }

    public int CabinetId { get; set; }

    public int EventTypeId { get; set; }

    public int? EventId { get; set; }

    public virtual Cabinet Cabinet { get; set; } = null!;

    public virtual Doctor Doctor { get; set; } = null!;

    public virtual Event? Event { get; set; }

    public virtual EventType EventType { get; set; } = null!;

    public virtual ScheduleMonth? ScheduleMonth { get; set; }

    public virtual ICollection<Patient> Patients { get; set; } = new List<Patient>();
}
