using System;
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
        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string Name { get; set; }
        [Required]
        public int Phone { get; set; }
        [Required]
        public string UserName { get; set; }
        [Required]
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,15}$")]
        public string PassWord { get; set; }
        public string Role { get; set; }
    }
}