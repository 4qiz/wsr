using System;
using System.Collections.Generic;

namespace MapApp.Models;

public partial class BookingToEvent
{
    public int BookingToEventId { get; set; }

    public DateTime StartTime { get; set; }

    public DateTime EndTime { get; set; }

    public int TypeId { get; set; }

    public int DoctorId { get; set; }

    public int CabinetId { get; set; }

    public int? ApprovedScheduleId { get; set; }

    public virtual ApprovedSchedule? ApprovedSchedule { get; set; }

    public virtual Cabinet Cabinet { get; set; } = null!;

    public virtual Doctor Doctor { get; set; } = null!;

    public virtual EventType Type { get; set; } = null!;

    public virtual ICollection<Patient> MedicalCards { get; set; } = new List<Patient>();
}
