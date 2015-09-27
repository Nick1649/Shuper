using System.Web.Mvc;

namespace MasterOfCode2015.Areas.Shopping
{
    public class ShoppingAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Shopping";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
             context.MapRoute(
                "getItems",
                "Shopping/{controller}/{action}/{sku}",
                new { controller = "Items", action = "GetItem"}
            );

            context.MapRoute(
                "payment",
                "Shopping/{controller}/{action}/{id}",
                new { controller = "Pay", action = "Index", id = UrlParameter.Optional }
            );

            context.MapRoute(
                "Shopping_default",
                "Shopping/{controller}/{action}/{id}",
                new { controller = "Items", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}