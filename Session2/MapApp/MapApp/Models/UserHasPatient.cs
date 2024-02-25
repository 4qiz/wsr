using System;
using System.Collections.Generic;

namespace MapApp.Models;

public partial class UserHasPatient
{
    public int UserId { get; set; }

    public int MedicalCardId { get; set; }

    public virtual Patient MedicalCard { get; set; } = null!;

    public virtual User User { get; set; } = null!;
}
