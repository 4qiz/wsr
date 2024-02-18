using System;
using System.Collections.Generic;

namespace ImportPhoto.Models;

public partial class EventResult
{
    public int TherapyResultId { get; set; }

    public string Title { get; set; } = null!;

    public string? Description { get; set; }

    public int TherapyId { get; set; }

    public virtual Event Therapy { get; set; } = null!;
}
