using System;
using System.Collections.Generic;

namespace MapApp.Models;

public partial class User
{
    public int UserId { get; set; }

    public string Login { get; set; } = null!;

    public byte[]? Password { get; set; }

    public bool? IsAdmin { get; set; }

    public virtual Doctor? Doctor { get; set; }

    public virtual RegistrationStaff? RegistrationStaff { get; set; }

    public virtual UserHasPatient? UserHasPatient { get; set; }
}
