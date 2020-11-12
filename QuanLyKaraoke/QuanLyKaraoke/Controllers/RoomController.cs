using QuanLyKaraoke.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyKaraoke.Controllers
{
    public class RoomController : Controller
    {
        public QuanLyContext db = new QuanLyContext();
        // GET: Room

        public ActionResult Room_Index()
        {
            if (Session["S_ID"] != null && Session["Role"].ToString() != "accountant")
            {
                return View(new RoomDAO().GetList());
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }
        }

        [HttpPost]
        public JsonResult Delete(string id)
        {
            var room = db.Rooms.FirstOrDefault(r => r.RoomID == id);

            if (room == null)
            {
                return Json(new { isvalid = false, msg = "Không tìm thấy đơn đặt phòng này" });
            }
            room.Status = 1;
            db.Rooms.Remove(room);
            db.SaveChanges();
            return Json(new { isvalid = true, msg = "Đã xóa thành công" });
        }

        [HttpGet]
        public ActionResult Add_new_room()
        {
            if (Session["S_ID"] != null && Session["Role"].ToString() != "accountant")
            {
                ViewBag.loai = 0;
                return View(new Room());
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }
        }

        [HttpPost]
        public ActionResult Add_new_room(Room model)
        {
            ViewBag.loai = 0;
            var room = db.Rooms.FirstOrDefault(r => r.RoomID == model.RoomID);

            if (room != null)
            {
                ViewBag.exc = 1;
                return View(model);
            }

            ViewBag.exc = 0;
            if (model.RoomType == "Standard")
            {
                model.R_Price = 100000;
            }
            if (model.RoomType == "Vip")
            {
                model.R_Price = 150000;
            }
            if (model.RoomType == "Luxury")
            {
                model.R_Price = 200000;
            }
            model.Status = 1;
            db.Rooms.Add(model);
            db.SaveChanges();
            return RedirectToAction("Room_Index");
        }

    }
}