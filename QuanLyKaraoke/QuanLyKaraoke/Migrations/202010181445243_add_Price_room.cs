namespace QuanLyKaraoke.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class add_Price_room : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Rooms", "R_Price", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Rooms", "R_Price");
        }
    }
}
