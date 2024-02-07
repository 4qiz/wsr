using System;
using System.Collections.Generic;

namespace RegistrationWebApp.Models;

public partial class InsurancePolicy
{
    public int InsurancePolicyId { get; set; }

    public string Number { get; set; } = null!;

    public DateOnly EndDate { get; set; }

    public string Company { get; set; } = null!;

    public virtual ICollection<Patient> Patients { get; set; } = new List<Patient>();
}
