using QuanLyKaraoke.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security.Cryptography;
using System.Text;
using Rotativa;

namespace QuanLyKaraoke.Controllers
{
    public class HomeController : Controller
    {
        public QuanLyContext db = new QuanLyContext();
        public ActionResult Index()
        {
            if (Session["S_ID"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login");
            }
        }
        public ActionResult About()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }


        public ActionResult Revenue()
        {
            var labels = new List<string>();
            labels.Add("Tháng 1");
            labels.Add("Tháng 2");
            labels.Add("Tháng 4");

            var data = new List<int>();
            data.Add(3);
            data.Add(5);
            data.Add(7);

            var doanhthu = new BarChart()
            {
                Labels = labels,
                Data = data
            };

            var model = new RevenueModel()
            {
                DoanhThuChart = doanhthu
            };

            return View(model);
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
                    Session["Role"] = data.Role;
                    return RedirectToAction("Admin_index");
                }
                else
                {
                    ViewBag.exc = 1;
                    return View();
                }
            }
            ViewBag.exc = 1;
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
            if (Session["S_ID"] != null && Session["Role"].ToString() != "Accountant")
            {
                return View(new BookingDAO().GetList());
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }
        }
        //----------Delete
        [HttpPost]
        public JsonResult Delete(int id)
        {
            var book = db.Bookings.FirstOrDefault(b => b.PayID == id);
            var room = db.Rooms.FirstOrDefault(r => r.RoomID == book.RoomID);
            var order = db.Orders.FirstOrDefault(o => o.Order_ID == book.Order_ID);

            if (book == null)
            {
                return Json(new { isvalid = false, msg = "Không tìm thấy đơn đặt phòng này" });
            }
            //Đặt lại status phòng
            room.Status = 1;
            //Xóa đơn đặt và xóa giỏ hàng phòng đó
            db.Orders.Remove(order);
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
            if (Session["S_ID"] != null && Session["Role"].ToString() != "Accountant")
            {
                ViewBag.Loai = 0;

                var RoomList = db.Rooms.Where(r => r.Status == 1).ToList();
                ViewBag.RoomList = new SelectList(RoomList, "RoomID", "RoomID");
                return View(new Booking());
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }
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
            if (Session["S_ID"] != null && Session["Role"].ToString() != "Accountant")
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
            else
            {
                return RedirectToAction("Login", "Home");
            }

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
                book.RoomID = model.RoomID == null ? book.RoomID : model.RoomID;
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
            if (Session["S_ID"] != null && Session["Role"].ToString() != "Accountant")
            {
                var Menu = db.Menus.Where(m => m.Stock > 0).ToList();
                ViewBag.MenuList = new SelectList(Menu, "Food_ID", "Name");
                ViewBag.OrderID = id;

                Viewmodel viewmodel = new Viewmodel();
                viewmodel.Order_Details = new Order_DetailDAO().GetListOrder(id);
                viewmodel.Order_Detail = new Order_Detail();
                viewmodel.Order = new OrderDAO().GetOrderByID(id);

                return View("Order", viewmodel);
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }

        }

        [HttpPost]
        public ActionResult Order(Viewmodel model)
        {
            var Order = db.Orders.Where(o => o.Order_ID == model.Order_Detail.Order_ID).FirstOrDefault();
            var Food = db.Order_Details
                         .Where(f => f.Order_ID == model.Order_Detail.Order_ID && f.Food_ID == model.Order_Detail.Food_ID)
                         .FirstOrDefault();
            var Stock = db.Menus.Where(s => s.Food_ID == model.Order_Detail.Food_ID).FirstOrDefault();
            if (Stock.Stock < model.Order_Detail.Quantity)
            {
                //ViewBag.err = "The amount of food you ordered is out of stock";
                TempData["Message"] = "The amount of food you ordered is out of stock";
                return RedirectToAction("Order");
            }
            
            Stock.Stock -= model.Order_Detail.Quantity;
            // nếu đã có món ăn này trong giỏ hàng rồi
            if (Food != null)
            {
                // update lại tổng tiền giỏ hàng
                Order.O_total = model.Order.O_total + model.Order_Detail.Quantity * Stock.Price;
                // update số lượng của món đó
                Food.Quantity += model.Order_Detail.Quantity;
                db.SaveChanges();
                return RedirectToAction("Order");
                
            }
            // nếu chưa có món ăn này khởi tạo liên kết và số lượng món đó
            Order_Detail od = new Order_Detail();
            od.Order_ID = model.Order_Detail.Order_ID;
            od.Food_ID = model.Order_Detail.Food_ID;
            od.Quantity = model.Order_Detail.Quantity;

            // update lại tổng tiền giỏ hàng
            Order.O_total = model.Order.O_total + model.Order_Detail.Quantity * Stock.Price;

            //save món mới
            db.Order_Details.Add(od);
            db.SaveChanges();

            return RedirectToAction("Order");
            
        }
        //convert pdf

        [HttpGet]
        public ActionResult Bill(int id, string staff)
        {
            var booking = db.Bookings.Where(b => b.PayID == id).FirstOrDefault();
            if (booking == null)
            {
                return RedirectToAction("Admin_index");
            }

            Bill bill = new Bill();
            bill.Booking = booking;
            bill.Order_Details = new Order_DetailDAO().GetListOrder(booking.Order_ID);
            bill.AccountName = staff == null ? Session["Name"].ToString() : staff;


            return View("Bill",bill);
        }
        [HttpPost]
        public ActionResult Bill(Bill model)
        {
            var booking = db.Bookings.Where(b => b.PayID == model.Booking.PayID).FirstOrDefault();
            if(booking == null)
            {
                return RedirectToAction("Admin_index");
            }
            booking.Duration = model.Booking.Duration;
            booking.Total = model.Booking.Total;
            booking.P_Status = 2;

            var room = db.Rooms.Where(r => r.RoomID == model.Booking.Room.RoomID).FirstOrDefault();
            room.Status = 1;

            db.SaveChanges();
            return new ActionAsPdf("Bill", new { id = model.Booking.PayID, staff = Session["Name"].ToString() });
            //return new ViewAsPdf(model);

            //{
            //    FileName = Server.MapPath("~/Content/PDF.pdf")
            //};
        }
    }
}