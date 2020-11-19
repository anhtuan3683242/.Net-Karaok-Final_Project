using QuanLyKaraoke.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyKaraoke.Controllers
{
    public class RevenueController : Controller
    {
        public QuanLyContext db = new QuanLyContext();
        // GET: Revenue
        public ActionResult Revenue()
        {
            var bookingDao = new BookingDAO();
            var revenueDao = new RevenueDao();

            //var labels = new List<string>() { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Sep", "Oct", "Nov", "Dec" };
            var labels = new List<string>() { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul","Aug", "Sep", "Oct", "Nov", "Dec" };

            //test numguest

            //var data = new List<int>() { 500, 320, 132, 346, 567, 621, 712, 811, 818, 902, 985 };
            //var data = new List<int>();

            //for (int i = 0; i < 12; i++)
            //{
            //    data.Add(bookingDao.GetNumGuest(i+1));
            //}

            
            var doanhthu = new BarChart()
            {
                Labels = labels,
                Data = bookingDao.GetNumBook(),
                max = bookingDao.GetMax(),
            };

            var model = new RevenueModel()
            {
                DoanhThuChart = doanhthu
            };

            return View(model);
        }
    }
}