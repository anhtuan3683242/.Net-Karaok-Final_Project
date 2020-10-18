using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QuanLyKaraoke.Models
{
    public class Room
    {
        [Key]
        public string RoomID { get; set; }
        public string RoomType { get; set; }
        public int R_Price { get; set; }
        public int Status { get; set; }//1: available, 2: booking, 3:Using
        //Cac lien ket 

    }
}