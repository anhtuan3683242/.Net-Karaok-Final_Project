using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyKaraoke.Models
{
    public class Viewmodel
    {
        public IEnumerable<Room> Rooms { get; set; }
        public Room Room { get; set; }
    }

}