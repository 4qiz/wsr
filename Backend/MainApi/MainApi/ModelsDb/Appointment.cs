using System;
using System.Collections.Generic;

namespace MainApi.ModelsDb;

public partial class Appointment
{
    public int AppointmentId { get; set; }

    public int DoctorId { get; set; }

    public int ShiftId { get; set; }

    public int TherapyId { get; set; }
}
