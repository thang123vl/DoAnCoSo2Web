using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public static PharmacyDataContext db = new PharmacyDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtTKNhap.Text != "" && txtMatKhau.Text != "")
            {
                TaiKhoan tk = (from q in db.TaiKhoans
                               where q.Username == txtTKNhap.Text && q.Pass == txtMatKhau.Text
                               select q).FirstOrDefault();

                if (tk != null)
                {
                    Session["User"] = tk;
                    Session["UserRole"] = tk.UserRole; 
                    Response.Redirect("TrangChu.aspx");
                }
                else
                {
 
                    thongbao.Text = "Sai tài khoản hoặc mật khẩu!";
                    thongbao.ForeColor = System.Drawing.Color.White;
                }
            }
            else
            {
                thongbao.Text = "Vui lòng nhập tài khoản và mật khẩu!";
                thongbao.ForeColor = System.Drawing.Color.White;
            }
        }
    }
}