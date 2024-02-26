using ImportPhoto.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportPhoto
{
    [Serializable]
    public class PatientXml
    {
        public int PatientId { get; set; }

        public string Passport { get; set; } = null!;

        public DateOnly DateOfBirth { get; set; }

        public bool IsMale { get; set; }

        public string Address { get; set; } = null!;

        public string PhoneNumber { get; set; } = null!;

        public string Email { get; set; } = null!;

    }
}
