﻿using System;
using System.Collections.Generic;

namespace MapApp.ModelsDb;

public partial class TherapyType
{
    public int TypeId { get; set; }

    public string Title { get; set; } = null!;

    public virtual ICollection<Therapy> Therapies { get; set; } = new List<Therapy>();
}
