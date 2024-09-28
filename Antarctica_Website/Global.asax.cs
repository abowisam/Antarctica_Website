using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Antarctica_Website
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
        void Session_Start(Object sender, EventArgs e)
        {
            Session["uName"] = "Guest";
            Session["fName"] = "Guest";
            Session["admin"] = "no";
        }
        void Session_End(Object sender, EventArgs e)
        {
            Session["uName"] = "Guest";
            Session["fName"] = "Guest";
            Session["admin"] = "no";
        }
    }
}