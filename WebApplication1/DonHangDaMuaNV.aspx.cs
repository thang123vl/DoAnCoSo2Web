using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class DonHangDaMuaNV : System.Web.UI.Page
    {
        public static PharmacyDataContext db = new PharmacyDataContext();
        public static List<listhoadonban> listhdb = new List<listhoadonban>();
        protected void Page_Load(object sender, EventArgs e)
        {
            string makh = Request.QueryString["idkh"];
            if (!string.IsNullOrEmpty(makh))
            {
                loaddata(makh);
            }
      
        }

        public class listhoadonban
        {
            public string MaHDBan { get; set; }
            public string TenKH { get; set; }
            public DateTime NgayBan { get; set; }
     
            public decimal TongTien { get; set; }


        }
        void loaddata(string idkh)
        {
            listhdb = (from hdban in db.HDBans
                           join kh in db.KhachHangs on hdban.MaKH equals kh.MaKH
                           where hdban.MaKH == idkh
                           select new listhoadonban
                           {
                               MaHDBan = hdban.MaHDBan,
                               TenKH = kh.TenKH,
                               NgayBan = hdban.NgayBan,
                               TongTien = hdban.TongTien,
                           }).ToList();
       
        }
    }
}
