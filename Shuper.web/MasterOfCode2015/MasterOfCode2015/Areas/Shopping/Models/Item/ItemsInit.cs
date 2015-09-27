using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Shopping.Models
{
    public class ItemsInit : DropCreateDatabaseIfModelChanges<ShoppingContext>
    {
        protected override void Seed(ShoppingContext context)
        {
            var items = new List<Item>
            {
                //new Item(0, "Orage Juice", 2.12, 0.99),
                //new Item(1, "2% Milk", 4.44, 5.97),
                //new Item(2, "Eggs 12pc", 2.7, 3.93),
                //new Item(3, "Cereal", 5, 4.93),
                //new Item(4, "Peanuts", 7.6, 7.65),
                //new Item(5, "Milk Chocolate Bar", 0.89, 3.05),
                //new Item(6, "Yogurt", 1.89, 2)

                new Item(063348100047, "Bear Paws", 45, 1.99),
                new Item(066721005786, "Honey Cookies", 30, 1.39),
                new Item(074780000703, "Perrier", 500, 3.50)
            };

            foreach (var temp in items)
            {
                context.Items.Add(temp);
            }

            context.SaveChanges();
        }
    }
}