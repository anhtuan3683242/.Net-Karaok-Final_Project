﻿using QuanLyKaraoke.Models;
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

        public ActionResult Order()
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
            
            return View(new BookingDAO().GetList());
        }
        //----------Delete
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

        //-----------CheckIn
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
        //------------Add
        [HttpGet]
        public ActionResult Add_new_booking()
        {
            ViewBag.Loai = 0;

            var RoomList = db.Rooms.Where(r => r.Status == 1).ToList();
            ViewBag.RoomList = new SelectList(RoomList, "RoomID", "RoomID");
            return View(new Booking());
        }

        [HttpPost]
        public ActionResult Add_new_booking(Booking model)
        {
            ViewBag.Loai = 0;
            model.Total = 0;
            model.P_Status = 1;
            model.Duration = 0;

            var room = db.Rooms.Where(r => r.RoomID == model.RoomID).FirstOrDefault();
            room.Status = 2;

            Order order = new Order();
            order.O_total = 0;
            var entity = db.Orders.Add(order);
            model.Order_ID = entity.Order_ID;

            db.Bookings.Add(model);
            db.SaveChanges();
            return RedirectToAction("Admin_index");
        }



        //-------------Edit
        [HttpGet]
        public ActionResult EditInfo(int id)
        {
            ViewBag.Loai = 1;

            var RoomList = db.Rooms.Where(r => r.Status == 1).ToList();
            ViewBag.RoomList = new SelectList(RoomList, "RoomID", "RoomID");

            var booking = db.Bookings.FirstOrDefault(b => b.PayID == id);
            if (booking == null)
            {
                return RedirectToAction("Admin_index");
            }
            return View("Add_new_booking", booking);
        }
        [HttpPost]
        public ActionResult EditInfo(Booking model)
        {
            ViewBag.Loai = 1;
            if (ModelState.IsValid)
            {
                //lưu ý bắt lỗi ở đây
                //lấy data cũ
                
                var book = db.Bookings.FirstOrDefault(b => b.PayID == model.PayID);
                //gán các thông tin mới vào đối tượng lấy từ CSDL
                book.Name_Cus = model.Name_Cus;
                book.Phone_Cus = model.Phone_Cus;
                book.Amount_Cus = model.Amount_Cus;
                book.RoomID = model.RoomID;
                book.DateTime = model.DateTime;
                db.SaveChanges();
                return RedirectToAction("Admin_index");
            }
            return View(model);
        }

        //---------Order
        [HttpGet]
        public ActionResult Order(int id)
        {
            var Menu = db.Menus.ToList();
            ViewBag.MenuList = new SelectList(Menu, "Food_ID", "Name");
            ViewBag.OrderID = id;

            Viewmodel viewmodel = new Viewmodel();
            viewmodel.Order_Details = new Order_DetailDAO().GetListOrder(id);
            viewmodel.Order_Detail = new Order_Detail();

            return View("Order", viewmodel);
        }

        [HttpPost]
        public ActionResult Order(Viewmodel model)
        {
            var Food = db.Order_Details
                         .Where(f => f.Order_ID == model.Order_Detail.Order_ID && f.Food_ID == model.Order_Detail.Food_ID)
                         .FirstOrDefault();
            // nếu đã có món ăn này rồi
            if (Food != null)
            {
                Food.Quantity += model.Order_Detail.Quantity;
                db.SaveChanges();
                return RedirectToAction("Order");
                
            }
            // nếu chưa có món ăn này
            Order_Detail od = new Order_Detail();
            od.Order_ID = model.Order_Detail.Order_ID;
            od.Food_ID = model.Order_Detail.Food_ID;
            od.Quantity = model.Order_Detail.Quantity;

            db.Order_Details.Add(od);
            db.SaveChanges();

            return RedirectToAction("Order");
            
        }
    }
}