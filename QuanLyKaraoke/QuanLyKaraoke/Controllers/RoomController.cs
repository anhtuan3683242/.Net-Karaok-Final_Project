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
            Viewmodel viewmodel = new Viewmodel();
            viewmodel.Rooms = new RoomDAO().getList();

            return View(viewmodel);
            //return View(new RoomDAO().getList());
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

            return View(new Room());
        }
        [HttpPost]
        public ActionResult Add_new_room(Room model)
        {

            var room = db.Rooms.Where(r => r.RoomID == model.RoomID).FirstOrDefault();
            //if (room != null)
            //{
            //    return View(model);
            //}
            if (room.RoomType == "Std")
            {
                room.R_Price = 100000;
            }
            if (room.RoomType == "Vip")
            {
                room.R_Price = 150000;
            }
            if (room.RoomType == "Luxury")
            {
                room.R_Price = 200000;
            }
            room.Status = 1;
            db.Rooms.Add(model);
            db.SaveChanges();
            return RedirectToAction("Room_Index");
        }
    }
}