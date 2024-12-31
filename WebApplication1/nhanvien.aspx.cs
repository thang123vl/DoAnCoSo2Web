using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class nhanvien : System.Web.UI.Page
    {
        // Khởi tạo đối tượng DbContext và danh sách nhân viên
        public static PharmacyDataContext db = new PharmacyDataContext();
        public static List<NhanVien> nv = new List<NhanVien>();

        // Hàm Load dữ liệu
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
            if (!IsPostBack)
            {
                var data = from q in db.NhanViens
                           select q;
                nv = data.ToList();
            }

            string action = Request.QueryString["action"];
            string maNV = Request.QueryString["maNV"];

            if (action == "delete" && !string.IsNullOrEmpty(maNV))
            {
                xoaNhanVien(maNV);  
            }
        }

        // Hàm xóa nhân viên
        private void xoaNhanVien(string maNV)
        {
            var nhanVienToDelete = db.NhanViens.FirstOrDefault(nv => nv.MaNV == maNV);

            if (nhanVienToDelete != null)
            {
                db.NhanViens.DeleteOnSubmit(nhanVienToDelete);
                db.SubmitChanges();
                Response.Write("<script>alert('Xóa Thành Công');</script>");
                Response.Redirect("nhanvien.aspx"); 
            }
            else
            {
                Response.Write("<script>alert('Khách hàng đã tồn tại!');</script>");
            }
        }
        public void timkiemnhanvien(string keyword)
        {
            var ketQua = db.NhanViens
                .Where(t => t.TenNV.Contains(keyword))
                .ToList();
            nv = ketQua;
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            string keyword = txtTimKiem.Text.Trim();
            timkiemnhanvien(keyword);
        }
    }
}