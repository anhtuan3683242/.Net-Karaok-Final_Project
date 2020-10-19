using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyKaraoke.Models
{
    public class MenuDAO
    {
        public QuanLyContext db = new QuanLyContext();
        public List<Menu> getList()
        {
            return db.Menus.OrderBy(m => m.Food_ID).ToList();
        }
    }
}