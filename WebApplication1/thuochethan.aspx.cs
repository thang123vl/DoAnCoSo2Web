using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        public static PharmacyDataContext db = new PharmacyDataContext();
        public static List<Thuoc> thuocHetHan = new List<Thuoc>();
        protected void Page_Load(object sender, EventArgs e)
        {
            string idthuoc = Request.QueryString["idthuoc"];
            TaiKhoan tk = (TaiKhoan)Session["User"];
            lblFullName.InnerText = tk.Ten;
            lblFullName1.InnerText = "Xin Chào " + tk.Ten + "!";
            TimThuocSapHetHan();
            loadthuoc();
        }
        void loadthuoc()
        {
            thuocHetHan = db.Thuocs.Where(t => t.NgayHH <= DateTime.Now.AddDays(10)).ToList();
        }

        void TimThuocSapHetHan()
        {
            DateTime currentDate = DateTime.Now;
            DateTime thresholdDate = currentDate.AddDays(10); 

           
            var thuocSapHetHan = db.Thuocs
                .Where(t => t.NgayHH <= thresholdDate) 
                .OrderBy(t => t.NgayHH) 
                .ToList();

            if (thuocSapHetHan.Any())
            {
                lblThuocSapHetHan.Text = "<ul>"; 
                foreach (var t in thuocSapHetHan)
                {
                    if (t.NgayHH < currentDate)
                    {
                        lblThuocSapHetHan.Text += "<li>Thuốc " + t.TenThuoc + " đã hết hạn vào ngày " + t.NgayHH.ToShortDateString() + ".</li>";
                    }
                    else
                    {
             
                        lblThuocSapHetHan.Text += "<li>Thuốc " + t.TenThuoc + " sẽ hết hạn vào ngày " + t.NgayHH.ToShortDateString() + ".</li>";
                    }
                    lblThuocSapHetHan.ForeColor = System.Drawing.Color.Black;
                }
                lblThuocSapHetHan.Text += "</ul>"; 
            }
            else
            {
                lblThuocSapHetHan.Text = "Không có thuốc nào hết hạn hoặc sắp hết hạn.";
                lblThuocSapHetHan.ForeColor = System.Drawing.Color.Black;
            }
        }
    }
}