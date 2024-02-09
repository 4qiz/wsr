using System;
using System.Collections.Generic;

namespace MapApp.ModelsDb;

public partial class HospitalizationRoom
{
    public int HospitalizationRoomId { get; set; }

    public int X { get; set; }

    public int Y { get; set; }

    public int Number { get; set; }

    public string Bed { get; set; } = null!;

    public virtual Hospitalization? Hospitalization { get; set; }
}
