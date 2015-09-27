using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Shopping.Models;
using Newtonsoft.Json;

namespace MasterOfCode2015.Areas.Shopping.Controllers
{
    public class ItemsController : Controller
    {
        private ShoppingContext db = new ShoppingContext();

        // GET: Shopping/Items
        public ActionResult Index()
        {
            return View(db.Items.ToList());
        }

        public ActionResult GetItem(long sku)
        {
            var results = from a in db.Items
                          where a.sku == sku
                          select a;

            return Content(JsonConvert.SerializeObject(results));
        }
    }
}
