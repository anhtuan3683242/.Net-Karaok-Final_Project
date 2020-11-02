using QuanLyKaraoke.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyKaraoke.Controllers
{
    public class HomeController : Controller
    {
        public QuanLyContext db = new QuanLyContext();
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Not_Found404()
        {
            return View();
        }
        public ActionResult Admin_index()
        {
            
            return View(new BookingDAO().getList());
        }

        [HttpPost]
        public JsonResult Delete(int id)
        {
            var book = db.Bookings.FirstOrDefault(b => b.PayID == id);
            var room = db.Rooms.FirstOrDefault(r => r.RoomID == book.RoomID);

            if (book == null)
            {
                return Json(new { isvalid = false, msg = "Không tìm thấy đơn đặt phòng này" });
            }
            room.Status = 1;
            db.Bookings.Remove(book);
            db.SaveChanges();
            return Json(new { isvalid = true, msg = "Đã xóa thành công" });
        }

        [HttpPost]
        public JsonResult CheckIn(int id)
        {
            var book = db.Bookings.FirstOrDefault(b => b.PayID == id);
            var room = db.Rooms.FirstOrDefault(r => r.RoomID == book.RoomID);

            if (book == null)
            {
                return Json(new { isvalid = false, msg = "Không tìm thấy phòng này" });
            }

            if (room.Status == 3)
            {
                return Json(new { isvalid = false, msg = "Bạn đã nhận phòng rồi" });
            }
            room.Status = 3;
            db.SaveChanges();
            return Json(new { isvalid = true, msg = "Đã nhận phòng thành công" });
        }

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
            model.Total = 0;
            model.P_Status = 1;
            model.Duration = 0;

            var room = db.Rooms.Where(r => r.RoomID == model.RoomID).FirstOrDefault();
            room.Status = 2;

            db.Bookings.Add(model);
            db.SaveChanges();
            return RedirectToAction("Admin_index");
        }
    }
}