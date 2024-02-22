using System;
using System.Collections.Generic;

namespace Session5Api.Models;

public partial class Warehouse
{
    public int WarehouseId { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<S5Medicine> S5Medicines { get; set; } = new List<S5Medicine>();
}
