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
            
            return db.Bookings.OrderBy(d => d.DateTime).Where(d => d.DateTime.Month == month).ToList().Sum(item => item.Total);
        }

        public List<int> GetTRoom()
        {
            // chinh dieu kien de loc RoomID
            var std = db.Bookings.OrderBy(i => i.RoomID).Where(r => r.Room.RoomType == "Standard").ToList().Count;
            var vip = db.Bookings.OrderBy(i => i.RoomID).Where(r => r.Room.RoomType == "Vip").ToList().Count;
            var lux = db.Bookings.OrderBy(i => i.RoomID).Where(r => r.Room.RoomType == "Luxury").ToList().Count;
            List<int> list = new List<int>() { std, vip, lux };
            return list;
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

        public int GetTotalYear()
        {
            return db.Bookings.OrderBy(d => d.DateTime).Where(d => d.DateTime.Year == 2020).ToList().Sum(item => item.Total);
        }
    }

}