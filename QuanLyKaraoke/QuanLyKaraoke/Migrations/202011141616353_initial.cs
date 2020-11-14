namespace QuanLyKaraoke.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Order_Detail", "Order_ID", "dbo.Order");
            DropForeignKey("dbo.Order_Detail", "Food_ID", "dbo.Menu");
            DropIndex("dbo.Order_Detail", new[] { "Order_ID" });
            DropIndex("dbo.Order_Detail", new[] { "Food_ID" });
            AddColumn("dbo.Order_Detail", "Menu_Food_ID", c => c.Int());
            AddColumn("dbo.Order_Detail", "Order_Order_ID", c => c.Int());
            AlterColumn("dbo.Accounts", "Phone", c => c.Int(nullable: false));
            AlterColumn("dbo.Booking", "Phone_Cus", c => c.Int(nullable: false));
            AlterColumn("dbo.Order_Detail", "Order_ID", c => c.String());
            AlterColumn("dbo.Order_Detail", "Food_ID", c => c.String());
            CreateIndex("dbo.Order_Detail", "Menu_Food_ID");
            CreateIndex("dbo.Order_Detail", "Order_Order_ID");
            AddForeignKey("dbo.Order_Detail", "Order_Order_ID", "dbo.Order", "Order_ID");
            AddForeignKey("dbo.Order_Detail", "Menu_Food_ID", "dbo.Menu", "Food_ID");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Order_Detail", "Menu_Food_ID", "dbo.Menu");
            DropForeignKey("dbo.Order_Detail", "Order_Order_ID", "dbo.Order");
            DropIndex("dbo.Order_Detail", new[] { "Order_Order_ID" });
            DropIndex("dbo.Order_Detail", new[] { "Menu_Food_ID" });
            AlterColumn("dbo.Order_Detail", "Food_ID", c => c.Int(nullable: false));
            AlterColumn("dbo.Order_Detail", "Order_ID", c => c.Int(nullable: false));
            AlterColumn("dbo.Booking", "Phone_Cus", c => c.String());
            AlterColumn("dbo.Accounts", "Phone", c => c.String(nullable: false));
            DropColumn("dbo.Order_Detail", "Order_Order_ID");
            DropColumn("dbo.Order_Detail", "Menu_Food_ID");
            CreateIndex("dbo.Order_Detail", "Food_ID");
            CreateIndex("dbo.Order_Detail", "Order_ID");
            AddForeignKey("dbo.Order_Detail", "Food_ID", "dbo.Menu", "Food_ID", cascadeDelete: true);
            AddForeignKey("dbo.Order_Detail", "Order_ID", "dbo.Order", "Order_ID", cascadeDelete: true);
        }
    }
}
