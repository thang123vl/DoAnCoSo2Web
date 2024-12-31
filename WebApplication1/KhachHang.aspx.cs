using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class KhachHang1 : System.Web.UI.Page
    {
        public static PharmacyDataContext db = new PharmacyDataContext();
        public static List<KhachHang> kh = new List<KhachHang>();
        protected void Page_Load(object sender, EventArgs e)
        {
            loaddata();
            TaiKhoan tk = (TaiKhoan)Session["User"];
            lblFullName.InnerText = tk.Ten;
            lblFullName1.InnerText = "Xin Chào " + tk.Ten + "!";
        }
        void loaddata()
        {
            var data = from q in db.KhachHangs
                     select q;
            kh = data.ToList();
        }
                public void timkiemkh(string keyword)
        {
            var ketQua = db.KhachHangs
                .Where(t => t.TenKH.Contains(keyword))
                .ToList();
            kh = ketQua;
            if (kh.Count == 0)
            {
                Response.Write("<script>alert('Không tìm thấy khách hàng nào');</script>");
            }
        }


        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            string keyword = txtTimKiem.Text.Trim();
            timkiemkh(keyword);
        }
    }
}