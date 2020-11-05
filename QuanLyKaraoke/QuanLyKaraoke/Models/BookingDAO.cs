using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyKaraoke.Models
{
    public class BookingDAO
    {
        public QuanLyContext db = new QuanLyContext();
        public List<Booking> GetList()
        {
            return db.Bookings.OrderBy(b => b.PayID).ToList();
        }
    }
}