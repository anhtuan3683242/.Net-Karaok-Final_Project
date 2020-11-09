using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyKaraoke.Models
{
    public class Viewmodel
    {
        public IEnumerable<Order_Detail> Order_Details { get; set; }
        public Order_Detail Order_Detail { get; set; }

        public Order Order { get; set; }
    }

}