using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyKaraoke.Controllers
{
    public class BookingController : Controller
    {
        // GET: Booking
        public ActionResult Add_new_booking()
        {
            return View();
        }
    }
}