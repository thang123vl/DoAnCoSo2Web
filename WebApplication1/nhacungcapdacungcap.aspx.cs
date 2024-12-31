using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class nhacungcapdacungcap : System.Web.UI.Page
    {
 public static PharmacyDataContext db = new PharmacyDataContext();
    public static List<Thuoc> thuocList = new List<Thuoc>();  // Đổi tên biến để rõ ràng hơn

    protected void Page_Load(object sender, EventArgs e)
    {
        string idthuoc = Request.QueryString["idthuoc"];
        TaiKhoan tk = (TaiKhoan)Session["User"];
        lblFullName.InnerText = tk.Ten;
        lblFullName1.InnerText = "Xin Chào " + tk.Ten + "!";
        string idncc = Request.QueryString["idncc"];
        if (!string.IsNullOrEmpty(idncc))
        {
            loeaddata(idncc);
         
        }
    }

    void loeaddata(string idncc)
    {
        // Lấy tất cả các sản phẩm (thuốc) từ nhà cung cấp với idncc
        thuocList = (from q in db.Thuocs
                     where q.MaNCC == idncc
                     select q).ToList();
    }

   
    }
}