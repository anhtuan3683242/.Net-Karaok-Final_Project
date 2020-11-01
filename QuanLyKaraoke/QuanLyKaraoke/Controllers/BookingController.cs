using QuanLyKaraoke.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyKaraoke.Controllers
{
    
    public class BookingController : Controller
    {
        QuanLyContext db = new QuanLyContext();
        // GET: Booking
        [HttpGet]
        public ActionResult Add_new_booking()
        {
            var RoomList = db.Rooms.Where(r => r.Status == 1).ToList();
            ViewBag.RoomList = new SelectList(RoomList, "RoomID", "RoomID");
            return View(new Booking());
        }

        [HttpPost]
        public ActionResult Add_new_booking(Booking model)
        {
            model.PayID = "Test";
            model.Total = 0;
            model.P_Status = 1;
            model.Duration = 0;
            db.Bookings.Add(model);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}