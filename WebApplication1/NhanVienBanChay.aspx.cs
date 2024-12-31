using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class NhanVienBanChay : System.Web.UI.Page
    {
        public static PharmacyDataContext db = new PharmacyDataContext();
        public List<NhanVien> nv = new List<NhanVien>();
        public List<NhanVienDoanhSo> danhSachNhanVien { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            string idthuoc = Request.QueryString["idthuoc"];
            TaiKhoan tk = (TaiKhoan)Session["User"];
            lblFullName.InnerText = tk.Ten;
            lblFullName1.InnerText = "Xin Chào " + tk.Ten + "!";
            if (!IsPostBack)
            {
                danhSachNhanVien = GetDanhSachNhanVien();
            }
        }

        public class NhanVienDoanhSo
        {
            public string TenNhanVien { get; set; }
            public decimal TongDoanhSo { get; set; }
        }

        private List<NhanVienDoanhSo> GetDanhSachNhanVien()
        {
            var query = db.HDBans
                .Join(db.ChiTietBans, hdb => hdb.MaHDBan, ctb => ctb.MaHDBan, (hdb, ctb) => new { hdb, ctb })
                .Join(db.NhanViens, temp => temp.hdb.MaNV, nv => nv.MaNV, (temp, nv) => new
                {
                    nv.TenNV,
                    DoanhSo = temp.hdb.TongTien
                })
                .GroupBy(x => x.TenNV)
                .Select(g => new NhanVienDoanhSo
                {
                    TenNhanVien = g.Key,
                    TongDoanhSo = g.Sum(x => x.DoanhSo)
                })
                .OrderByDescending(x => x.TongDoanhSo)
                .ToList();

            return query;
        }

        public void timkiemnhanvien(string keyword)
        {
            var ketQua = db.NhanViens
                .Where(t => t.TenNV.Contains(keyword))
                .ToList();
            nv = ketQua;
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            string keyword = txtTimKiem.Text.Trim();
            timkiemnhanvien(keyword);
        }

    }
}