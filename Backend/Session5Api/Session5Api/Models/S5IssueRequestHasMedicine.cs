using System;
using System.Collections.Generic;

namespace Session5Api.Models;

public partial class S5IssueRequestHasMedicine
{
    public int MedicineId { get; set; }

    public int IssueRequestId { get; set; }

    public int Quantity { get; set; }

    public virtual S5IssueRequest IssueRequest { get; set; } = null!;

    public virtual S5Medicine Medicine { get; set; } = null!;
}
