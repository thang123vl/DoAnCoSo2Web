using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class DanhMuc1 : System.Web.UI.Page
    {
      
        public static PharmacyDataContext db = new PharmacyDataContext();
        public static List<DanhMuc> DM = new List<DanhMuc>();
        protected void Page_Load(object sender, EventArgs e)
        {
            loaddata();
            xoathuoc();
            if (Session["UserRole"] == null || Session["UserRole"].ToString() == "User")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Unauthorized", "alert('Bạn không có quyền truy cập vào trang này.'); window.location='TrangChu.aspx';", true);
                return;
            }
            TaiKhoan tk = (TaiKhoan)Session["User"];

            lblFullName.InnerText = tk.Ten;
            lblFullName1.InnerText = "Xin Chào " + tk.Ten + "!";
        }
        void loaddata()
        {
            var data = from q in db.DanhMucs
                       select q;
            DM = data.ToList();
        }
        void xoathuoc()
        {
            string action = Request.QueryString["action"];
            string maThuoc = Request.QueryString["MaNCC"];

            if (action == "delete" && !string.IsNullOrEmpty(maThuoc))
            {
                var thuocToDelete = db.DanhMucs.FirstOrDefault(t => t.MaDM == maThuoc);
                if (thuocToDelete != null)
                {
                    db.DanhMucs.DeleteOnSubmit(thuocToDelete);
                    db.SubmitChanges();
                    loaddata();
                }
            }
        }
        protected void btnTimKiem_Click1(object sender, EventArgs e)
        {
            string keyword = txtTimKiem.Text.Trim();
            TimKiemThuoc(keyword);
        }

        public void TimKiemThuoc(string keyword)
        {
            var ketQua = db.DanhMucs
                .Where(t => t.TenDM.Contains(keyword))
                .ToList();
            DM = ketQua;
            if (DM.Count == 0)
            {
                //lblThongBao.Text = "Không tìm thấy thuốc nào phù hợp.";
            }
            else
            {
            }
        }

    }
}