using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QuanLyKaraoke.Models
{
    public class Order_Detail
    {
        [Key]
        public string OD_ID { get; set; }
        public int Quantity { get; set; }
        
        //các liên kết

        public string Order_ID { get; set; }
        public virtual Order Order { get; set; }

        public string Food_ID { get; set; }
        public virtual Menu Menu { get; set; }
    }
}