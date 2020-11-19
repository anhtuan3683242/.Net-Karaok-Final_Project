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
        public int GetNumGuest(int month)
        {
            return db.Bookings.OrderBy(d => d.DateTime).Where(d => d.DateTime.Month == month).ToList().Count;

        }
        public List<int> GetNumBook()
        {
            var list = new List<int>();
            for (int i = 1; i <= 12; i++)
            {
                list.Add(db.Bookings.OrderBy(d => d.DateTime).Where(d => d.DateTime.Month == i).ToList().Count);
            }
            return list;
        }

        public int GetMax()
        {
            var list = new List<int>();
            for (int i = 1; i <= 12; i++)
            {
                list.Add(db.Bookings.OrderBy(d => d.DateTime).Where(d => d.DateTime.Month == i).ToList().Count);
            }
            return list.Max();
        }
    }

}