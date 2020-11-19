using QuanLyKaraoke.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyKaraoke.Controllers
{
    public class AccountController : Controller
    {
        public QuanLyContext db = new QuanLyContext();
        // GET: Account
        public ActionResult Account_index()
        {
            if (Session["S_ID"] != null && Session["Role"].ToString() == "Admin")
            {
                return View(new AccountDAO().GetList());
            }
            else if (Session["S_ID"] != null)
            {
                TempData["ErrorMessage"] = "You are not authorized to access this page";
                return RedirectToAction("Admin_index", "Home");
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }
        }

        [HttpPost]
        public JsonResult Delete(int id)
        {
            var account = db.Accounts.FirstOrDefault(a => a.S_ID == id);

            if (account == null)
            {
                return Json(new { isvalid = false, msg = "Không tìm thấy tài khoản này" });
            }

            db.Accounts.Remove(account);
            db.SaveChanges();
            return Json(new { isvalid = true, msg = "Đã xóa thành công" });
        }
        //Add
        [HttpGet]
        public ActionResult Add_new_account()
        {
            if (Session["S_ID"] != null && Session["Role"].ToString() == "Admin")
            {
                ViewBag.Loai = 0;
                return View(new Account());
            }
            else if (Session["S_ID"] != null)
            {
                TempData["ErrorMessage"] = "You are not authorized to access this page";
                return RedirectToAction("Admin_index", "Home");
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }
        }

        [HttpPost]
        public ActionResult Add_new_account(Account model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ViewBag.Loai = 0;

                    var Account = db.Accounts.Where(a => a.Name == model.Name).FirstOrDefault();
                    if (Account != null)
                    {
                        ViewBag.exc = 1;
                        return View(model);
                    }

                    db.Accounts.Add(model);
                    db.SaveChanges();
                    return RedirectToAction("Account_index");
                }
                ViewBag.Loai = 0;
                return View(model);
            }
            catch
            {
                ViewBag.Loai = 0;
                return View();
            }
        }
            //Edit
            //----------------------------
         [HttpGet]
        public ActionResult EditInfo(int id)
        {
            if (Session["S_ID"] != null && Session["Role"].ToString() == "Admin")
            {
                ViewBag.Loai = 1;

                var Account = db.Accounts.FirstOrDefault(a => a.S_ID == id);
                if (Account == null)
                {
                    return RedirectToAction("Account_index");
                }
                return View("Add_new_account", Account);
            }
            else if (Session["S_ID"] != null)
            {
                TempData["ErrorMessage"] = "You are not authorized to access this page";
                return RedirectToAction("Admin_index", "Home");
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }
        }
        [HttpPost]
        public ActionResult EditInfo(Account model)
        {
            ViewBag.Loai = 1;
            try
            {
                if (ModelState.IsValid)
                {
                    //lưu ý bắt lỗi ở đây
                    //lấy data cũ

                    var Account = db.Accounts.FirstOrDefault(a => a.S_ID == model.S_ID);
                    //gán các thông tin mới vào đối tượng lấy từ CSDL
                    Account.Name = model.Name;
                    Account.Phone = model.Phone;
                    Account.Role = model.Role;
                    Account.UserName = model.UserName;
                    //Xy ly bat loi~ PassWord
                    Account.PassWord = model.PassWord;
                    db.SaveChanges();
                    return RedirectToAction("Account_index");
                }
                return View(model);
            }
            catch
            {
                return View();
            }
        }
    }
}