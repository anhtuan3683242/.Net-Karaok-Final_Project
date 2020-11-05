﻿namespace QuanLyKaraoke.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Accounts",
                c => new
                    {
                        S_ID = c.String(nullable: false, maxLength: 128),
                        Name = c.String(nullable: false, maxLength: 50),
                        Phone = c.Int(nullable: false),
                        UserName = c.String(nullable: false),
                        PassWord = c.String(nullable: false),
                        Role = c.String(),
                    })
                .PrimaryKey(t => t.S_ID);
            
            CreateTable(
                "dbo.Booking",
                c => new
                    {
                        PayID = c.Int(nullable: false, identity: true),
                        Name_Cus = c.String(),
                        Phone_Cus = c.Int(nullable: false),
                        Amount_Cus = c.Int(nullable: false),
                        P_Status = c.Int(nullable: false),
                        DateTime = c.DateTime(nullable: false),
                        Duration = c.Int(nullable: false),
                        Total = c.Int(nullable: false),
                        Order_ID = c.String(),
                        RoomID = c.String(maxLength: 128),
                        Order_Order_ID = c.Int(),
                    })
                .PrimaryKey(t => t.PayID)
                .ForeignKey("dbo.Order", t => t.Order_Order_ID)
                .ForeignKey("dbo.Room", t => t.RoomID)
                .Index(t => t.RoomID)
                .Index(t => t.Order_Order_ID);
            
            CreateTable(
                "dbo.Order",
                c => new
                    {
                        Order_ID = c.Int(nullable: false, identity: true),
                        O_Quantity = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Order_ID);
            
            CreateTable(
                "dbo.Order_Detail",
                c => new
                    {
                        OD_ID = c.Int(nullable: false, identity: true),
                        Quantity = c.Int(nullable: false),
                        Order_ID = c.String(),
                        Food_ID = c.String(),
                        Menu_Food_ID = c.Int(),
                        Order_Order_ID = c.Int(),
                    })
                .PrimaryKey(t => t.OD_ID)
                .ForeignKey("dbo.Menu", t => t.Menu_Food_ID)
                .ForeignKey("dbo.Order", t => t.Order_Order_ID)
                .Index(t => t.Menu_Food_ID)
                .Index(t => t.Order_Order_ID);
            
            CreateTable(
                "dbo.Menu",
                c => new
                    {
                        Food_ID = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                        Price = c.Int(nullable: false),
                        Stock = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Food_ID);
            
            CreateTable(
                "dbo.Room",
                c => new
                    {
                        RoomID = c.String(nullable: false, maxLength: 128),
                        RoomType = c.String(),
                        R_Price = c.Int(nullable: false),
                        Status = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.RoomID);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Booking", "RoomID", "dbo.Room");
            DropForeignKey("dbo.Booking", "Order_Order_ID", "dbo.Order");
            DropForeignKey("dbo.Order_Detail", "Order_Order_ID", "dbo.Order");
            DropForeignKey("dbo.Order_Detail", "Menu_Food_ID", "dbo.Menu");
            DropIndex("dbo.Order_Detail", new[] { "Order_Order_ID" });
            DropIndex("dbo.Order_Detail", new[] { "Menu_Food_ID" });
            DropIndex("dbo.Booking", new[] { "Order_Order_ID" });
            DropIndex("dbo.Booking", new[] { "RoomID" });
            DropTable("dbo.Room");
            DropTable("dbo.Menu");
            DropTable("dbo.Order_Detail");
            DropTable("dbo.Order");
            DropTable("dbo.Booking");
            DropTable("dbo.Accounts");
        }
    }
}