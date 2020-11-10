using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyKaraoke.Models
{
    public class Order_DetailDAO
    {
        public QuanLyContext db = new QuanLyContext();
        //Đưa vào id của Order và tìm tất cả các Order_detail của nó
        public List<Order_Detail> GetListOrder(int id)
        {
            return db.Order_Details.Where(od => od.Order_ID == id).ToList();
        }
    }
}