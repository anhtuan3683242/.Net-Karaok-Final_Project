﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace QuanLyKaraoke.Models
{
    public class QuanLyContext:DbContext
    {
        public QuanLyContext() : base("Data Source =.; Initial Catalog = QuanLyKaraoke; Integrated Security = True")
        {

        }

        public DbSet<Booking> Bookings { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<Room> Rooms { get; set; }
        public DbSet<Menu> Menus { get; set; }
        public DbSet<Account> Accounts { get; set; }
    }
}