namespace QuanLyKaraoke.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Init : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Accounts",
                c => new
                    {
                        S_ID = c.String(nullable: false, maxLength: 128),
                        Name = c.String(),
                        Phone = c.Int(nullable: false),
                        UserName = c.String(),
                        PassWord = c.String(),
                        Role = c.String(),
                    })
                .PrimaryKey(t => t.S_ID);
            
            CreateTable(
                "dbo.Bookings",
                c => new
                    {
                        PayID = c.String(nullable: false, maxLength: 128),
                        Name_Cus = c.String(),
                        Phone_Cus = c.Int(nullable: false),
                        Num_Cus = c.Int(nullable: false),
                        DateTime = c.DateTime(nullable: false),
                        Duration = c.Int(nullable: false),
                        Total = c.Int(nullable: false),
                        Order_Order_ID = c.String(maxLength: 128),
                        Room_RoomID = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => t.PayID)
                .ForeignKey("dbo.Orders", t => t.Order_Order_ID)
                .ForeignKey("dbo.Rooms", t => t.Room_RoomID)
                .Index(t => t.Order_Order_ID)
                .Index(t => t.Room_RoomID);
            
            CreateTable(
                "dbo.Orders",
                c => new
                    {
                        Order_ID = c.String(nullable: false, maxLength: 128),
                        O_Quantity = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Order_ID);
            
            CreateTable(
                "dbo.Menus",
                c => new
                    {
                        Food_ID = c.String(nullable: false, maxLength: 128),
                        Name = c.String(),
                        Price = c.Int(nullable: false),
                        F_Quantity = c.Int(nullable: false),
                        Order_Order_ID = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => t.Food_ID)
                .ForeignKey("dbo.Orders", t => t.Order_Order_ID)
                .Index(t => t.Order_Order_ID);
            
            CreateTable(
                "dbo.Rooms",
                c => new
                    {
                        RoomID = c.String(nullable: false, maxLength: 128),
                        RoomType = c.String(),
                        Status = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.RoomID);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Bookings", "Room_RoomID", "dbo.Rooms");
            DropForeignKey("dbo.Bookings", "Order_Order_ID", "dbo.Orders");
            DropForeignKey("dbo.Menus", "Order_Order_ID", "dbo.Orders");
            DropIndex("dbo.Menus", new[] { "Order_Order_ID" });
            DropIndex("dbo.Bookings", new[] { "Room_RoomID" });
            DropIndex("dbo.Bookings", new[] { "Order_Order_ID" });
            DropTable("dbo.Rooms");
            DropTable("dbo.Menus");
            DropTable("dbo.Orders");
            DropTable("dbo.Bookings");
            DropTable("dbo.Accounts");
        }
    }
}
