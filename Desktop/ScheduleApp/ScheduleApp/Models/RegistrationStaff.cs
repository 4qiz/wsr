﻿using System;
using System.Collections.Generic;

namespace ScheduleApp.Models;

public partial class RegistrationStaff
{
    public int UserId { get; set; }

    public string? Title { get; set; }

    public virtual User User { get; set; } = null!;
}