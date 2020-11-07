using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyKaraoke.Models
{
    public class AccountDAO
    {
        public QuanLyContext db = new QuanLyContext();
        public List<Account> GetList()
        {
            return db.Accounts.OrderBy(a => a.S_ID).ToList();
        }
    }
}