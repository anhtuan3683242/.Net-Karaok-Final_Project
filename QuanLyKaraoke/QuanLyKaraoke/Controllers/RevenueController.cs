﻿using QuanLyKaraoke.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyKaraoke.Controllers
{
    public class RevenueController : Controller
    {
        public QuanLyContext db = new QuanLyContext();
        // GET: Revenue
        public ActionResult Revenue()
        {
            if (Session["S_ID"] != null && Session["Role"].ToString() != "Staff")
            {
                var revenueDao = new RevenueDao();

                //var labels = new List<string>() { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Sep", "Oct", "Nov", "Dec" };
                var labels = new List<string>() { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul","Aug", "Sep", "Oct", "Nov", "Dec" };
                var labels1 = new List<string>() { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };

                var labelsPie = new List<string>() { "Standard", "VIP", "Luxury" };
                //test numguest

                //var data = new List<int>() { 500, 320, 132, 346, 567, 621, 712, 811, 818, 902, 985 };

                var data = new List<int>();
                var data1 = new List<int>();

                var dataPie = new List<int>();


                for (int x = 0; x < 12; x++)
                {
                    data1.Add(revenueDao.GetTotal(x + 1));
                }
            
                var doanhthu = new BarChart()
                {
                    Labels = labels,

                    Data = revenueDao.GetNumBook(),
                    max = revenueDao.GetMax(),

                
                };

                var totaldt = new LineChart()
                {
                    Labels1 = labels1,
                    Data1 = data1
                };

                var typeRoom = new PieChart()
                {
                    LabelsPie = labelsPie,
                    DataPie = revenueDao.GetTRoom(),

                };

            ViewBag.TotalYear = revenueDao.GetTotalYear();
                var model = new RevenueModel()
                {
                    DoanhThuChart = doanhthu,
                    TotalDT = totaldt,
                    TypeRoom = typeRoom
                };


                return View(model);
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

    }
}