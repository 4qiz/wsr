using System;
using System.Collections.Generic;

namespace Session5Api.Models;

public partial class S5IssueRequest
{
    public int IssueRequestId { get; set; }

    public DateTime CreatedTime { get; set; }

    public string Purpose { get; set; } = null!;

    public virtual ICollection<S5IssueRequestHasMedicine> S5IssueRequestHasMedicines { get; set; } = new List<S5IssueRequestHasMedicine>();
}
