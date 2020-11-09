using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyKaraoke.Models
{
    public class OrderDAO
    {
        public QuanLyContext db = new QuanLyContext();
        //Đưa vào id của Order và tìm tất cả các Order_detail của nó
        public Order GetOrderByID(int id)
        {
            return db.Orders.Where(o => o.Order_ID == id).FirstOrDefault();
        }
    }
}