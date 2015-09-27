using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Shopping.Models
{
    public class Item
    {
        public Item()
        {

        }

        public Item(long sku, string description, double weight, double price)
        {
            this.sku = sku;
            this.description = description;
            this.weight = weight;
            this.price = price;
        }
        
        public long itemId { get; set; }

        public long sku { get; set; }

        public string description { get; set; }

        public double weight { get; set; }

        public double price { get; set; }
    }
}