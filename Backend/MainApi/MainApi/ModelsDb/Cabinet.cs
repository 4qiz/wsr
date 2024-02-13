using System;
using System.Collections.Generic;

namespace MainApi.ModelsDb;

public partial class Cabinet
{
    public int CabinetId { get; set; }

    public string Number { get; set; } = null!;
}
