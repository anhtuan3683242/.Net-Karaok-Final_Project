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
        public int Amount_Cus { get; set; }
        public int P_Status { get; set; }// 1: wait for payment; 2: payment success; 3: was cancel
        public DateTime DateTime { get; set; }
        public int Duration { get; set; }
        public int Total { get; set; }
        //Cac lien ket
        public string Order_ID { get; set; }
        public virtual Order Order { get; set; }

        public string RoomID { get; set; }
        public virtual Room Room { get; set; }

    }
}