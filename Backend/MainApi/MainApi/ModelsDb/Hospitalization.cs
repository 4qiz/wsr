using System;
using System.Collections.Generic;

namespace MainApi.ModelsDb;

public partial class Hospitalization
{
    public int HospitalizationId { get; set; }

    public int HospitalizationCode { get; set; }

    public int MedicalCardId { get; set; }

    public decimal Price { get; set; }

    public string? Goal { get; set; }

    public DateTime? StartDate { get; set; }

    public DateTime? EndDate { get; set; }

    public bool IsCanceled { get; set; }

    public string CancelReason { get; set; } = null!;

    public int HospitalizationRoomId { get; set; }

    public virtual HospitalizationRoom HospitalizationRoom { get; set; } = null!;

    public virtual MedicalCard MedicalCard { get; set; } = null!;
}
