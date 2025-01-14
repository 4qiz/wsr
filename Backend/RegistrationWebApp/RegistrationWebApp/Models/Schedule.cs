﻿using System;
using System.Collections.Generic;

namespace RegistrationWebApp.Models;

public partial class Schedule
{
    public int ScheduleId { get; set; }

    public int DoctorId { get; set; }

    public int MedicalCardId { get; set; }

    public int TherapyId { get; set; }

    public int? Date { get; set; }
}
