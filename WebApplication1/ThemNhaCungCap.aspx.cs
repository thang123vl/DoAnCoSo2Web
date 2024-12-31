using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class ThemNhaCungCap : System.Web.UI.Page
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
            NhaCungCap ncc = new NhaCungCap();
            string mancc = CreateKey("NCC");
            ncc.MaNCC = mancc;
            ncc.MaCN = "CN001";
            ncc.TenNCC = txttennhacc.Text;
            ncc.MST = txtmst.Text;
            ncc.DiaChiNCC = txtdiachinhacc.Text;

 
            var existingNCC = (from q in db.NhaCungCaps
                               where q.Email == txtemail.Text || q.SDT == txtDienThoai.Text
                               select q).FirstOrDefault();

            if (existingNCC != null)
            {
                if (existingNCC.Email == txtemail.Text)
                {
                    Response.Write("<script>alert('Email đã tồn tại! Vui lòng nhập email khác.');</script>");
                }
                else if (existingNCC.SDT == txtDienThoai.Text)
                {
                    Response.Write("<script>alert('Số điện thoại đã tồn tại! Vui lòng nhập số điện thoại khác.');</script>");
                }
                return;
            }

            ncc.Email = txtemail.Text;
            ncc.SDT = txtDienThoai.Text;
            db.NhaCungCaps.InsertOnSubmit(ncc);
            db.SubmitChanges();

            Response.Write("<script>alert('Thêm nhà cung cấp thành công!');</script>");

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