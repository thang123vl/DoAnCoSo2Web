using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class thuochethang : System.Web.UI.Page
    {
        public static PharmacyDataContext db = new PharmacyDataContext();
        public static List<Thuoc> thuocHetHan = new List<Thuoc>();
        protected void Page_Load(object sender, EventArgs e)
        {
            string idthuoc = Request.QueryString["idthuoc"];
            TaiKhoan tk = (TaiKhoan)Session["User"];
            lblFullName.InnerText = tk.Ten;
            lblFullName1.InnerText = "Xin Chào " + tk.Ten + "!";
            var data = from q in db.Thuocs
                       where q.TinhTrang == "Hết Hàng" && q.SoLuong < 1
                       select q;
            thuocHetHan = data.ToList();
        }
        
    }
}