using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class TaiKhoan1 : System.Web.UI.Page
    {
        public static PharmacyDataContext db = new PharmacyDataContext();
        public static tklist listtk = new tklist();

        protected void Page_Load(object sender, EventArgs e)
        {
            string idthuoc = Request.QueryString["idthuoc"];
            TaiKhoan tk = (TaiKhoan)Session["User"];
            lblFullName.InnerText = tk.Ten;
            lblFullName1.InnerText = "Xin Chào " + tk.Ten + "!";
            string taikhoanid = Request.QueryString["idtk"];
            if (!string.IsNullOrEmpty(taikhoanid))
            {
                loaddata_hoadon(taikhoanid);
            }
        }

        public class tklist
        {
            public string MaNV { get; set; }
            public string UserRole { get; set; } 
            public string Ten { get; set; }
            public string NgaySinh { get; set; }
            public long Mobile { get; set; }
            public string Email { get; set; }
            public string DiaChi { get; set; }
            public string GioiTinh { get; set; }
            public string Username { get; set; }
            public string SDT { get; set; }
            public string Pass { get; set; }
        }

        void loaddata_hoadon(string idtk)
        {
            listtk = (from tk in db.TaiKhoans
                      join nv in db.NhanViens on tk.MaNV equals nv.MaNV
                      where tk.MaNV == idtk
                      select new tklist
                      {
                          MaNV = tk.MaNV,
                          Username = tk.Username,  
                          Ten = tk.Ten,
                          SDT = nv.SDT,
                          NgaySinh = tk.NgaySinh.ToString(),
                          Mobile = tk.Mobile,
                          Email = tk.Email,
                          DiaChi = nv.DiaChi,
                          GioiTinh = nv.GioiTinh,
                          UserRole = tk.UserRole,  
                          Pass = tk.Pass
                      }).First();
        }
    }
}