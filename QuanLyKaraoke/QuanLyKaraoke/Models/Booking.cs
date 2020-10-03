using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace QuanLyKaraoke.Models
{
    public class Booking
    {
        [Key]
        public string PayID { get; set; }
        public string Name_Cus { get; set; }
        public int Phone_Cus { get; set; }
        public int Num_Cus { get; set; }
        public DateTime Date { get; set; }
        public DateTime Time { get; set; }
        public DateTime Duration { get; set; }
        public int Total { get; set; }
        //Cac lien ket
        public virtual Order Order { get; set; }
        public virtual Room Room { get; set; }

    }
}