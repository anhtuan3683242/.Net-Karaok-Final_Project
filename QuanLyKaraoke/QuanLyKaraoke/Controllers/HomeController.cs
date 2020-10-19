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

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

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

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Admin_index()
        {
            return View(new BookingDAO().getList());
        }

        [HttpPost]
        public JsonResult Delete(string id)
        {
            var book = db.Bookings.FirstOrDefault(l => l.PayID == id);

            if (book == null)
            {
                return Json(new { isvalid = false, msg = "không tìm thấy thông tin máy" });
            }
            db.Bookings.Remove(book);
            db.SaveChanges();
            return Json(new { isvalid = true, msg = "Đã xóa thành công" });
        }
    }
}