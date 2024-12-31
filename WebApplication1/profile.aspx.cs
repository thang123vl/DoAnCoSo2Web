using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Lấy thông tin người dùng từ session
                TaiKhoan tk = (TaiKhoan)Session["User"];
                    userrole.Text = "Chức Vụ " + tk.UserRole;
                    profilename.Text = tk.Ten;
                    lblName.Text = tk.Ten;
                    lblDob.Text = tk.NgaySinh.ToString();
                    lblPhone.Text = tk.Mobile.ToString();
                    lblEmail.Text = tk.Email;
                    lblUsername.Text = tk.Username;
                    lblPassword.Text = tk.Pass;
                    lblId.Text = tk.MaNV;
                    
                    
                    
            }
        }
    }
}