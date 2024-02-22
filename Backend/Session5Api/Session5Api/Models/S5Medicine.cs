using System;
using System.Collections.Generic;

namespace Session5Api.Models;

public partial class S5Medicine
{
    public int MedicineId { get; set; }

    public string Name { get; set; } = null!;

    public string TradeName { get; set; } = null!;

    public string Manufacturer { get; set; } = null!;

    public string Image { get; set; } = null!;

    public decimal Price { get; set; }

    public int StockQuantity { get; set; }

    public int WarehouseId { get; set; }

    public virtual ICollection<S5IssueRequestHasMedicine> S5IssueRequestHasMedicines { get; set; } = new List<S5IssueRequestHasMedicine>();

    public virtual Warehouse Warehouse { get; set; } = null!;
}
