using System;
using System.Collections.Generic;

namespace MapApp.Models;

public partial class Hospitalization
{
    public int HospitalizationId { get; set; }

    public int? HospitalizationCode { get; set; }

    public string? HospitalizationGoal { get; set; }

    public int DepartmentNumber { get; set; }

    public decimal? Price { get; set; }

    public DateTime StartDate { get; set; }

    public DateTime EndDate { get; set; }

    public bool? IsCanceled { get; set; }

    public string? CancelReason { get; set; }

    public int MedicalCardId { get; set; }

    public int? HospitalizationRoomId { get; set; }

    public virtual HospitalizationRoom? HospitalizationRoom { get; set; }

    public virtual Patient MedicalCard { get; set; } = null!;
}
