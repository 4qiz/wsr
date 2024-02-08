using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MapApp.Models
{
    public class CurrentUser
    {
        public string Name { get; set; } = null!;

        public string Surname { get; set; } = null!;

        public string Patronymic { get; set; } = null!;

        public string PhoneNumber { get; set; } = null!;

        public byte[] Password { get; set; } = null!;

        public string Email { get; set; } = null!;

    }
}
