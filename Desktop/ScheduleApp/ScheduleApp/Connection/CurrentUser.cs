﻿
using ScheduleApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScheduleApp.Connection
{
    public static class CurrentUser
    {
        public static User User { get; set; } = null!;
        public static string Role { get; set; } = null!;
    }
}
