using System;
using System.Collections.Generic;

namespace ScheduleApp.Models;

public partial class UserHasPatient
{
    public int UserId { get; set; }

    public int PatientId { get; set; }

    public virtual Patient Patient { get; set; } = null!;

    public virtual User User { get; set; } = null!;
}
