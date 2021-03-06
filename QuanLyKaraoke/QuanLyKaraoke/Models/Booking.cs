﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace QuanLyKaraoke.Models
{
    public class Booking
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int PayID { get; set; }
        [Required]
        public string Name_Cus { get; set; }
        [Required]
        public string Phone_Cus { get; set; }
        [Required]
        public int Amount_Cus { get; set; }
        public int P_Status { get; set; }// 1: wait for payment; 2: payment success; 3: was cancel
        [Required(ErrorMessage = "StartTime is Required. It cannot be empty")]
        public DateTime DateTime { get; set; }
        [Required]
        public DateTime EndTime { get; set; }
        public float Duration { get; set; }
        public int Total { get; set; }
        //Cac lien ket
        public int Order_ID { get; set; }
        public virtual Order Order { get; set; }

        public string RoomID { get; set; }
        public virtual Room Room { get; set; }

    }
}