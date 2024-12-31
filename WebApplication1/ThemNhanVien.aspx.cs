using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
   
    public partial class WebForm6 : System.Web.UI.Page
    {
        public static PharmacyDataContext db = new PharmacyDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            string idthuoc = Request.QueryString["idthuoc"];
            TaiKhoan tk = (TaiKhoan)Session["User"];
            lblFullName.InnerText = tk.Ten;
            lblFullName1.InnerText = "Xin Chào " + tk.Ten + "!";
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            
            var existingEmail = db.NhanViens.FirstOrDefault(nv => nv.Email == txtemail.Text);
            if (existingEmail != null)
            {
                Response.Write("<script>alert('Email đã có! vui lòng nhập lại');</script>");
                return; 
            }
            var ktrasdt = (from q in db.NhanViens
                           where q.SDT == txtDienThoai.Text
                           select q).FirstOrDefault();
            if (ktrasdt != null) {
                Response.Write("<script>alert('SDT đã có');</script>");
                return; 
                    
            }

            // Kiểm tra xem Username đã tồn tại chưa
            var existingUsername = db.TaiKhoans.FirstOrDefault(tk => tk.Username == txtUsername.Text);
            if (existingUsername != null)
            {
                Response.Write("<script>alert('Username đã tồn tại! Vui lòng chọn tên đăng nhập khác');</script>");
                return; 
            }

            NhanVien nv1 = new NhanVien();
            string manv = CreateKey("NV");
            nv1.MaNV = manv;
            nv1.MaCN = "CN001";
            nv1.TenNV = txtHoTen.Text;

            DateTime ngaySinh;
            if (!DateTime.TryParse(txtNgaySinh.Text, out ngaySinh))
            {
                lblThongBao.Text = "Ngày sinh không hợp lệ!";
                lblThongBao.CssClass = "error";
                return;
            }
            nv1.NgaySinh = ngaySinh;

            nv1.Email = txtemail.Text;
            nv1.DiaChi = txtDiaChi.Text;
            nv1.SDT = txtDienThoai.Text;
            nv1.GioiTinh = ddlGioiTinh.SelectedValue;

            db.NhanViens.InsertOnSubmit(nv1);
            db.SubmitChanges();

            // Tạo tài khoản cho nhân viên
            TaiKhoan tk1 = new TaiKhoan();
            tk1.UserRole = ddluserrole.SelectedValue;
            tk1.Ten = nv1.TenNV;
            tk1.NgaySinh = nv1.NgaySinh;
            tk1.Mobile = long.Parse(nv1.SDT);
            tk1.Email = nv1.Email;
            tk1.Username = txtUsername.Text;
            tk1.Pass = txtPassword.Text; 
            tk1.MaNV = nv1.MaNV;

            db.TaiKhoans.InsertOnSubmit(tk1);
            db.SubmitChanges();

            Response.Write("<script>alert('Thêm nhân viên thành công!!');</script>");


        }
        public static string CreateKey(string tiento)
        {
            string key = tiento;
            string[] partsDay = DateTime.Now.ToString("dd/MM/yyyy").Split('/');
            string d = String.Format("{0}{1}{2}", partsDay[0], partsDay[1], partsDay[2]);
            key = key + d;

            DateTime now = DateTime.Now;
            string[] partsTime = now.ToString("HH:mm:ss").Split(':');
            string t = String.Format("_{0}{1}{2}", partsTime[0], partsTime[1], partsTime[2]);
            key = key + t;

            return key;
        }



    }
}