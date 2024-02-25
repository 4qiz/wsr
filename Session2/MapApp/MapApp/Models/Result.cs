using System;
using System.Collections.Generic;

namespace MapApp.Models;

public partial class Result
{
    public int ResultId { get; set; }

    public string Title { get; set; } = null!;

    public string? Description { get; set; }

    public int EventId { get; set; }

    public virtual Event Event { get; set; } = null!;
}
