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
                    return RedirectToAction("About");
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

    }
}