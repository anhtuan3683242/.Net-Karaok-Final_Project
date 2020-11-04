using QuanLyKaraoke.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security.Cryptography;
using System.Text;

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
        public ActionResult Login2()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string UserName, string PassWord)
        {
            if(ModelState.IsValid)
            {
                var f_password = GetMD5(PassWord);

                var data = db.Accounts.FirstOrDefault(s => s.UserName == UserName && s.PassWord == PassWord);
                if (data != null)
                {
                    //add Session
                    Session["Name"] = data.Name;
                    Session["UserName"] = data.UserName;
                    Session["S_ID"] = data.S_ID;
                    return RedirectToAction("Admin_index");
                }
                else
                {
                    ViewBag.error = "Login Failed";
                    return RedirectToAction("Index");
                }
            }
            return View();
        }
        //Logout
        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return RedirectToAction("Login");
        }

        public ActionResult Not_Found404()
        {
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            if (Session["S_ID"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login");
            }

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
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
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