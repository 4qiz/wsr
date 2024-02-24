﻿using System;
using System.Collections.Generic;

namespace RegistrationWebApp.Models;

public partial class HospitalizationRoom
{
    public int HospitalizationRoomId { get; set; }

    public int X { get; set; }

    public int Y { get; set; }

    public int RoomNumber { get; set; }

    public string BedCode { get; set; } = null!;

    public virtual ICollection<Hospitalization> Hospitalizations { get; set; } = new List<Hospitalization>();
}