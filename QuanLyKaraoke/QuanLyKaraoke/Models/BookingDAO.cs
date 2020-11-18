using Syncfusion.EJ2.Navigations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebGrease;

namespace QuanLyKaraoke.Models
{
    public class BookingDAO
    {
        public QuanLyContext db = new QuanLyContext();
        public List<Booking> GetList()
        {
            return db.Bookings.OrderBy(b => b.PayID).ToList();
        }

        public int GetNumGuest(int month)
        {
            return db.Bookings.OrderBy(d=>d.DateTime).Where(d => d.DateTime.Month == month).ToList().Sum(item => item.Amount_Cus);
            

        }

    }
}