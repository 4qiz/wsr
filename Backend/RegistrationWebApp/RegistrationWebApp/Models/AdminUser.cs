using System;
using System.Collections.Generic;

namespace RegistrationWebApp.Models;

public partial class AdminUser
{
    public int UserId { get; set; }

    public virtual User User { get; set; } = null!;
}
