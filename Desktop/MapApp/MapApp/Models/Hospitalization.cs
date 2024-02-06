using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MapApp.Models
{
    public class Hospitalization
    {
        public int HospitalizationId { get; set; }
        public string HospitalizationCode { get; set; }
        public int MedicalCardId { get; set; }
        public decimal Price { get; set; }
        public string Goal { get; set; }
        public int HospitalRoom { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public bool IsCanceled { get; set; }
        public string CancelReason { get; set; }
        public char Bed { get; set; }
    }
}
