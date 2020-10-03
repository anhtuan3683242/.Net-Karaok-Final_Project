using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QuanLyKaraoke.Models
{
    public class Menu
    {
        [Key]
        public string Food_ID { get; set; }
        public string Name { get; set; }
        public int Price { get; set; }
        public int F_Quantity { get; set; }
        // cac lien ket
        public virtual Order Order { get; set; }
    }
}