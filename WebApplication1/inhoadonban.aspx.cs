using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class inhoadonban : System.Web.UI.Page
    {
        public static PharmacyDataContext db = new PharmacyDataContext();
        public static List<ChitietHoaDon> chitiethoadonList = new List<ChitietHoaDon>();

        protected void Page_Load(object sender, EventArgs e)
        {
            string maHoaDon = Request.QueryString["idhd"];
            if (!string.IsNullOrEmpty(maHoaDon))
            {
                loaddata_hoadon(maHoaDon);
            }
        }

        public class ChitietHoaDon
        {
            public string MaNV {  get; set; }
            public DateTime NgayBan { get; set; }
            public string MaHDBan { get; set; }
            public string TenThuoc { get; set; }
            public int SoLuong { get; set; }
            public decimal DonGia { get; set; }  
            public decimal GiamGia { get; set; } 
            public decimal ThanhTien { get; set; }  

        }

        void loaddata_hoadon(string idhd)
        {
            chitiethoadonList = (from ctb in db.ChiTietBans
                                 join sp in db.Thuocs on ctb.MaThuoc equals sp.MaThuoc 
                                 join hdb in db.HDBans on ctb.MaHDBan equals hdb.MaHDBan
                                 where ctb.MaHDBan == idhd 
                                 select new ChitietHoaDon
                                 {
                                     MaNV = hdb.MaNV,
                                     NgayBan = hdb.NgayBan,
                                     MaHDBan = ctb.MaHDBan,
                                     TenThuoc = sp.TenThuoc,                
                                     SoLuong = ctb.SoLuong,                
                                     DonGia = ctb.DonGia ,
                                     GiamGia = ctb.GiamGia ?? 0,              
                                    ThanhTien = ctb.ThanhTien,
                                 }).ToList();
        }
    }
}