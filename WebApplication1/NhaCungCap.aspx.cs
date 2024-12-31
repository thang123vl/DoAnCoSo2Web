using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class NhaCungCap1 : System.Web.UI.Page
    {
        public static PharmacyDataContext db = new PharmacyDataContext();
        public static List<NhaCungCap> ncc = new List<NhaCungCap>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null || Session["UserRole"].ToString() == "User")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Unauthorized", "alert('Bạn không có quyền truy cập vào trang này.'); window.location='TrangChu.aspx';", true);
                return;
            }
            TaiKhoan tk = (TaiKhoan)Session["User"];
            lblFullName.InnerText = tk.Ten;
            lblFullName1.InnerText = "Xin Chào " + tk.Ten + "!";
            var loaddata = from q in db.NhaCungCaps
                       select q;
            ncc = loaddata.ToList();
            string action = Request.QueryString["action"];
            string MaNCC = Request.QueryString["MaNCC"];

            if (action == "delete" && !string.IsNullOrEmpty(MaNCC))
            {
                xoaNhaCungCap(MaNCC);  // Gọi hàm xóa nếu action là delete
            }
        }
        private void xoaNhaCungCap(string MaNCC)
        {
            var nhanVienToDelete = db.NhaCungCaps.FirstOrDefault(ncc => ncc.MaNCC == MaNCC);

            if (nhanVienToDelete != null)
            {
                db.NhaCungCaps.DeleteOnSubmit(nhanVienToDelete);
                db.SubmitChanges();
                Response.Write("<script>alert('Xóa Thành Công');</script>");
                Response.Redirect("NhaCungCap.aspx");
            }
            else
            {
                Response.Write("<script>alert('Nhà Cung Cấp đã Tồn tại!');</script>");
            }
        }
        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
        
        }

        public void TimKiemThuoc(string keyword)
        {
            var ketQua = db.NhaCungCaps
                .Where(t => t.TenNCC.Contains(keyword))
                .ToList();
            ncc = ketQua;
            if (ncc.Count == 0)
            {
                Response.Write("<script>alert('Không tìm thấy nhà Cung cấp nào');</script>");
            }
            else
            {
            }
        }

        protected void btnTimKiem_Click1(object sender, EventArgs e)
        {
            string keyword = txtTimKiem.Text.Trim();
            TimKiemThuoc(keyword);
        }
    }
}