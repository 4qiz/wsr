using System;
using System.Collections.Generic;

namespace MainApi.Models;

public partial class TherapyResult
{
    public int TherapyResultId { get; set; }

    public string Title { get; set; } = null!;

    public string? Description { get; set; }

    public int TherapyId { get; set; }

    public virtual Therapy Therapy { get; set; } = null!;
}
