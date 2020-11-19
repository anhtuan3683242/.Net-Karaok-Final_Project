using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyKaraoke.Models
{

    public class RevenueDao
    {
        public QuanLyContext db = new QuanLyContext();

        public int GetTotal(int month)
        {
            var list = db.Bookings.OrderBy(d => d.DateTime).Where(d => d.DateTime.Month == month).ToList().Sum(item => item.Total);
            return list;
        }

        public int GetTRoom(int month)
        {
            // chinh dieu kien de loc RoomID
            return db.Bookings.OrderBy(d => d.DateTime).Where(d => d.DateTime.Month == month).ToList().Sum(item => item.Total);
        }
    }

}