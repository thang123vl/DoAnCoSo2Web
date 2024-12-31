using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class hoadon : System.Web.UI.Page
    {
        public static PharmacyDataContext db = new PharmacyDataContext();
        public static List<HDNhap> hdnhap = new List<HDNhap>();

        protected void Page_Load(object sender, EventArgs e)
        {
            TaiKhoan tk = (TaiKhoan)Session["User"];
            lblFullName.InnerText = tk.Ten;
            lblFullName1.InnerText = "Xin Chào " + tk.Ten + "!";
            if (!IsPostBack) 
            {
                dataload();
                loaddatabd();
            }
        }
        void loaddatabd()
        {

            int currentYear = DateTime.Now.Year;
            decimal[] totalMonths = new decimal[12];

            for (int month = 1; month <= 12; month++)
            {
                var data = from q in db.HDNhaps
                           where q.NgayDat.Month == month && q.NgayDat.Year == currentYear
                           select q;


                totalMonths[month - 1] = data.Any() ? data.Sum(q => q.TongTien) : 0;
            }
            ViewState["TotalMonths"] = totalMonths;
        }

        void dataload()
        {
   
            var data = from q in db.HDNhaps
                       select q;
            hdnhap = data.ToList();
        }


        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            string maHoaDon = txtTimKiem.Text.Trim();

            if (!string.IsNullOrEmpty(maHoaDon))
            {
         
                var searchResult = from q in db.HDNhaps
                                   where q.MaHDNhap.Contains(maHoaDon) 
                                   select q;
                hdnhap = searchResult.ToList();
            }
            else
            {
                dataload();
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
                dataload();
            }
            else {
                var filteredData = from q in db.HDNhaps
                                   where q.NgayDat.Month == selectedMonth && q.NgayDat.Year == selectedYear
                                   select q;

                hdnhap = filteredData.ToList(); 
            
            }
        
        }

    }
}
