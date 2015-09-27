namespace MasterOfCode2015.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Item",
                c => new
                    {
                        itemId = c.Long(nullable: false, identity: true),
                        sku = c.Long(nullable: false),
                        description = c.String(),
                        weight = c.Double(nullable: false),
                        price = c.Double(nullable: false),
                    })
                .PrimaryKey(t => t.itemId);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Item");
        }
    }
}
