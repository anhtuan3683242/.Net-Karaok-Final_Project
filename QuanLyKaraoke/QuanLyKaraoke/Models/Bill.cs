using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyKaraoke.Models
{
    public class Bill
    {
        public IEnumerable<Order_Detail> Order_Details { get; set; }
        public Booking Booking { get; set; }

    }
}