﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyKaraoke.Models
{
    
    public class RoomDAO
    {
        public QuanLyContext db = new QuanLyContext();
        public string getID(Room room)
        {
            return db.Rooms.FirstOrDefault(r=>r.RoomID==room.RoomID).RoomID;
        }
        public List<Room> getList()
        {
            return db.Rooms.OrderBy(r => r.RoomID).ToList();
        }
    }
}