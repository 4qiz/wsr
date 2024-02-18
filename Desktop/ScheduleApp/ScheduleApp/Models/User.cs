using System;
using System.Collections.Generic;

namespace ScheduleApp.Models;

public partial class User
{
    public int UserId { get; set; }

    public byte[]? Password { get; set; }

    public string Login { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string SurName { get; set; } = null!;

    public string? Patronymic { get; set; }

    public DateTime? RegistrationDate { get; set; }

    public bool IsAdmin { get; set; }

    public virtual Doctor? Doctor { get; set; }

    public virtual Patient? Patient { get; set; }

    public virtual RegistrationStaff? RegistrationStaff { get; set; }
}
