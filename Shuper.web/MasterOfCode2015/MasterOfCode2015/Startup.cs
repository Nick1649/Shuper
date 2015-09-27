using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MasterOfCode2015.Startup))]
namespace MasterOfCode2015
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
