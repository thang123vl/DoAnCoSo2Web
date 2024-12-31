using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class chitietnhap : System.Web.UI.Page
    {
        public static PharmacyDataContext db = new PharmacyDataContext();
        public static List<ChitietHoaDon> chitiethoadonList = new List<ChitietHoaDon>();

        protected void Page_Load(object sender, EventArgs e)
        {

            string maHoaDon = Request.QueryString["mahoadon"];
            if (!string.IsNullOrEmpty(maHoaDon))
            {
                loaddata_hoadon(maHoaDon);
            }
        }

        public class ChitietHoaDon
        {
            public string MaHDNhapHang { get; set; }
            public string TenThuoc { get; set; }
            public int SoLuong { get; set; }
            public decimal DonGia { get; set; }  // Kiểu decimal cho đơn giá nhập
            public decimal ChietKhau { get; set; }  // Kiểu decimal cho chiết khấu
            public decimal VAT { get; set; }  // Kiểu decimal cho VAT
            public decimal ThanhTien { get; set; }  // Kiểu decimal cho thành tiền
            public string DonViTinh { get; set; }
        }

        void loaddata_hoadon(string idhd)
        {
            chitiethoadonList = (from ctnh in db.ChiTietNhaps
                                 join sp in db.Thuocs on ctnh.MaThuoc equals sp.MaThuoc // Gộp với bảng Thuoc
                                 where ctnh.MaHDNhapHang == idhd // Lọc theo MaHDNhapHang
                                 select new ChitietHoaDon
                                 {
                                     MaHDNhapHang = ctnh.MaHDNhapHang,
                                     TenThuoc = sp.TenThuoc,               
                                     SoLuong = ctnh.SoLuong,         
                                     DonGia = sp.DonGia ?? 0,             
                                     ChietKhau = ctnh.ChietKhau ?? 0,     
                                     VAT = ctnh.VAT ?? 0,                
                                     DonViTinh = ctnh.DonViTinh,          
                                     ThanhTien = ctnh.ThanhTien,
                                 }).ToList();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("nhaphang.aspx");
        }
    }
}
