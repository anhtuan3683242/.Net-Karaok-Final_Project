using QuanLyKaraoke.Models;
using System;
using System.Collections.Generic;
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
            return View(new RoomDAO().getList());
        }
    }
}