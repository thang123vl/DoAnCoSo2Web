using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class lol : System.Web.UI.Page
    {
        public static PharmacyDataContext db = new PharmacyDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}