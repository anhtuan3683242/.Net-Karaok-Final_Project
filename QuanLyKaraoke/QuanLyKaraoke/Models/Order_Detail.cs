using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace QuanLyKaraoke.Models
{
    public class Order_Detail
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int OD_ID { get; set; }
        public int Quantity { get; set; }
        
        //các liên kết

        public int Order_ID { get; set; }
        public virtual Order Order { get; set; }

        public int Food_ID { get; set; }
        public virtual Menu Menu { get; set; }
    }
}