using QuanLyKaraoke.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyKaraoke.Controllers
{
    public class MenuController : Controller
    {
        public QuanLyContext db = new QuanLyContext();
        // GET: Menu
        public ActionResult Menu_Index()
        {
            if (Session["S_ID"] != null && Session["Role"].ToString() != "Accountant")
            {
                return View(new MenuDAO().getList());
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }
            
        }

        [HttpPost]
        public JsonResult Delete(int id)
        {
            var menu = db.Menus.FirstOrDefault(m => m.Food_ID == id);

            if (menu == null)
            {
                return Json(new { isvalid = false, msg = "Không tìm thấy món ăn này" });
            }

            db.Menus.Remove(menu);
            db.SaveChanges();
            return Json(new { isvalid = true, msg = "Đã xóa thành công" });
        }

        [HttpGet]
        public ActionResult Add_new_menu()
        {
            if (Session["S_ID"] != null && Session["Role"].ToString() != "Accountant")
            {
                ViewBag.Loai = 0;
                return View(new Menu());
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }
        }

        [HttpPost]
        public ActionResult Add_new_menu(Menu model)
        {
            ViewBag.Loai = 0;

            var menu = db.Menus.Where(f => f.Name == model.Name).FirstOrDefault();
            if (menu != null)
            {
                ViewBag.exc = 1;
                return View(model);
            }

            db.Menus.Add(model);
            db.SaveChanges();
            return RedirectToAction("Menu_index");
        }

        //----------------------------
        [HttpGet]
        public ActionResult EditInfo(int id)
        {
            if (Session["S_ID"] != null && Session["Role"].ToString() != "Accountant")
            {
                ViewBag.Loai = 1;

                var menu = db.Menus.FirstOrDefault(m => m.Food_ID == id);
                if (menu == null)
                {
                    return RedirectToAction("Menu_index");
                }
                return View("Add_new_menu", menu);
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }

        }
        [HttpPost]
        public ActionResult EditInfo(Menu model)
        {
            ViewBag.Loai = 1;
            if (ModelState.IsValid)
            {
                //lưu ý bắt lỗi ở đây
                //lấy data cũ

                var menu = db.Menus.FirstOrDefault(m => m.Name == model.Name);
                //gán các thông tin mới vào đối tượng lấy từ CSDL
                menu.Price = model.Price;
                menu.Stock = model.Stock;
                db.SaveChanges();
                return RedirectToAction("Menu_index");
            }
            return View(model);
        }


    }
}