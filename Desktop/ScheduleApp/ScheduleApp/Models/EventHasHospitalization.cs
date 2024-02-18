using System;
using System.Collections.Generic;

namespace ScheduleApp.Models;

public partial class EventHasHospitalization
{
    public int EventId { get; set; }

    public int HospitalizationCode { get; set; }

    public virtual Event Event { get; set; } = null!;

    public virtual Hospitalization HospitalizationCodeNavigation { get; set; } = null!;
}
