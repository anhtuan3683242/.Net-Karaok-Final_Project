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
            return View (new MenuDAO().getList());
        }


    }
}