using System;
using System.Collections.Generic;

namespace ScheduleApp.Models;

public partial class Hospitalization
{
    public int HospitalizationCode { get; set; }

    public int PatientId { get; set; }

    public decimal Price { get; set; }

    public string? Goal { get; set; }

    public string? Department { get; set; }

    public DateTime StartDate { get; set; }

    public DateTime? EndDate { get; set; }

    public bool IsCanceled { get; set; }

    public string CancelReason { get; set; } = null!;

    public int? HospitalizationRoomId { get; set; }

    public virtual EventHasHospitalization? EventHasHospitalization { get; set; }

    public virtual HospitalizationRoom? HospitalizationRoom { get; set; }

    public virtual Patient Patient { get; set; } = null!;
}
