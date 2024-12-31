﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        public static PharmacyDataContext db = new PharmacyDataContext();
        public static List<HDBan> hdb = new List<HDBan>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loaddatabd();
            }
        }

        void loaddatabd()
        {

            int currentYear = DateTime.Now.Year;
            decimal[] totalMonths = new decimal[12];

            for (int month = 1; month <= 12; month++)
            {
                var data = from q in db.HDBans
                           where q.NgayBan.Month == month && q.NgayBan.Year == currentYear
                           select q;

   
                totalMonths[month - 1] = data.Any() ? data.Sum(q => q.TongTien) : 0;
            }
            ViewState["TotalMonths"] = totalMonths;
        }
    }
}