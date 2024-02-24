using System;
using System.Collections.Generic;

namespace RegistrationWebApp.Models;

public partial class Cabinet
{
    public int CabinetId { get; set; }

    public int Number { get; set; }

    public virtual ICollection<BookingToEvent> BookingToEvents { get; set; } = new List<BookingToEvent>();
}
