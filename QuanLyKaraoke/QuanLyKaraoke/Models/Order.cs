using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QuanLyKaraoke.Models
{
    public class Order
    {
        [Key]
        public string Order_ID { get; set; }
        public int O_Quantity { get; set; }
        //cac lien ket
        
        public virtual ICollection<Menu> Menus { get; set; }
    }
}