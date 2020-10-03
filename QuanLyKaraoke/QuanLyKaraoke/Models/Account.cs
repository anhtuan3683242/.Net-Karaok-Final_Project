﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QuanLyKaraoke.Models
{
    public class Account
    {
        [Key]
        public string S_ID { get; set; }
        public string Name { get; set; }
        public int Phone { get; set; }
        public string UserName { get; set; }
        public string PassWord { get; set; }
        public string Role { get; set; }
    }
}