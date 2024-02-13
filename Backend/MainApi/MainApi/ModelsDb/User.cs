using System;
using System.Collections.Generic;

namespace MainApi.ModelsDb;

public partial class User
{
    public int UserId { get; set; }

    public string Name { get; set; } = null!;

    public string Surname { get; set; } = null!;

    public string Patronymic { get; set; } = null!;

    public string PhoneNumber { get; set; } = null!;

    public byte[] Password { get; set; } = null!;

    public string Email { get; set; } = null!;

    public virtual AdminUser? AdminUser { get; set; }

    public virtual Doctor? Doctor { get; set; }

    public virtual RegistrationStaff? RegistrationStaff { get; set; }
}
