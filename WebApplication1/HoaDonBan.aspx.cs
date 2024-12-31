using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class HoaDonBan : System.Web.UI.Page
    {
        public static PharmacyDataContext db = new PharmacyDataContext();
        public static List<HDBan> hdb = new List<HDBan>();
        protected void Page_Load(object sender, EventArgs e)
        {
            string idthuoc = Request.QueryString["idthuoc"];
            TaiKhoan tk = (TaiKhoan)Session["User"];
            lblFullName.InnerText = tk.Ten;
            lblFullName1.InnerText = "Xin Chào " + tk.Ten + "!";
            loadtdata();
            loaddatabd();
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

        void loadtdata()
        {
            var data = from q in db.HDBans
                       select q;
            hdb = data.ToList();
        }        protected void btnTimKiem_Click1(object sender, EventArgs e)
        {
            string maHoaDon = txtTimKiem.Text.Trim();

            if (!string.IsNullOrEmpty(maHoaDon))
            {
                var searchResult = from q in db.HDBans
                                   where q.MaHDBan.Contains(maHoaDon) 
                                   select q;
                hdb = searchResult.ToList();
            }
            else
            {
                 loadtdata();
            }
        }

        protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            FilterData();
        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            FilterData();
        }
        private void FilterData()
        {
            int selectedMonth = Convert.ToInt32(ddlMonth.SelectedValue);
            int selectedYear = Convert.ToInt32(ddlYear.SelectedValue);

            if (selectedMonth == 0 || selectedYear == 0)
            {
                loadtdata();
            }
            else {
                var filteredData = from q in db.HDBans
                                   where q.NgayBan.Month == selectedMonth && q.NgayBan.Year == selectedYear
                                   select q;

                hdb = filteredData.ToList(); 
            
            }
        
        }

    }
}

