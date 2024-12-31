using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        public static PharmacyDataContext db = new PharmacyDataContext();
        public static List<Thuoc> cart = new List<Thuoc>();

        protected void Page_Load(object sender, EventArgs e)
        {
            TaiKhoan tk = (TaiKhoan)Session["User"];
            lblFullName.InnerText = tk.Ten;
            lblFullName1.InnerText = "Xin Chào " + tk.Ten + "!";
            if (!IsPostBack)
            {
                var products = db.Thuocs.Where(t => t.TinhTrang == "Còn hàng").ToList();
                ProductRepeater.DataSource = products;
                ProductRepeater.DataBind();
                decimal tongTien = TinhTongTien();

                chonNhanVien.Items.Add(new ListItem(tk.Ten, tk.MaNV.ToString()));
            }
        }


        public class Thuoc
        {
            public string MaThuoc { get; set; }
            public string TenThuoc { get; set; }
            public decimal DonGia { get; set; }
            public int SoLuong { get; set; }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            string maThuoc = ((System.Web.UI.WebControls.Button)sender).CommandArgument;

            var product = db.Thuocs.FirstOrDefault(t => t.MaThuoc == maThuoc);

            if (product != null)
            {
                if (product.SoLuong <= 0)
                {
                    Response.Write("<script>alert('Thuoc da het');</script>");
                    return;
                }
                var existingItem = cart.FirstOrDefault(t => t.MaThuoc == maThuoc);
                if (existingItem != null)
                {
                    existingItem.SoLuong++;
                }
                else
                {

                    cart.Add(new Thuoc
                    {
                        MaThuoc = product.MaThuoc,
                        TenThuoc = product.TenThuoc,
                        DonGia = (decimal)product.DonGia,
                        SoLuong = 1
                    });
                }

                BindCart();
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            string maThuoc = ((System.Web.UI.WebControls.Button)sender).CommandArgument;

            cart.RemoveAll(t => t.MaThuoc == maThuoc);

            BindCart();
        }

        private void BindCart()
        {
            CartListView.DataSource = cart.Select(t => new
            {
                t.TenThuoc,
                t.SoLuong,
                t.DonGia,
                ThanhTien = t.SoLuong * t.DonGia,
                t.MaThuoc
            }).ToList();
            CartListView.DataBind();
            decimal tongTien = TinhTongTien();
            lblTongTien.Text = string.Format("Tổng tiền: {0:N2} VND", tongTien);

        }
        private decimal TinhTongTien(decimal giamGia = 0)
        {
            decimal tongTien = cart.Sum(t => t.SoLuong * t.DonGia);

            if (giamGia > 0)
            {
                tongTien -= tongTien * (giamGia / 100);
            }

            return tongTien;
        }


        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            if (cart.Count == 0)
            {
                Response.Write("<script>alert('Giỏ hàng rỗng!');</script>");
                return;
            }

            try
            {
                decimal tongsoluong = 0;
                decimal tongtien = 0;
                decimal tongTienGoc = cart.Sum(t => t.SoLuong * t.DonGia); 
                decimal phanTramGiamGia = 0;

                if (!string.IsNullOrEmpty(txtDiscount.Value))
                {
                    phanTramGiamGia = decimal.Parse(txtDiscount.Value);
                    if (phanTramGiamGia < 0 || phanTramGiamGia > 100)
                    {
                        Response.Write("<script>alert('Vua lòng nhập từ 1 đêm 100');</script>");
                        return;
                    }
                }

                decimal tongTienSauGiamGia = TinhTongTien(phanTramGiamGia);

                foreach (var item in cart)
                {
                    tongsoluong += item.SoLuong;
                    tongtien += item.SoLuong * item.DonGia;

                    var thuoc = db.Thuocs.FirstOrDefault(t => t.MaThuoc == item.MaThuoc);
                    if (thuoc != null)
                    {
                        if (thuoc.SoLuong < item.SoLuong)
                        {
                            Response.Write("<script>alert('Số lượng thuốc không đủ!');</script>");
                            return;
                        }

                        thuoc.SoLuong -= item.SoLuong;

                        if (thuoc.SoLuong == 0)
                        {
                            thuoc.TinhTrang = "Hết Hàng";
                        }
                    }
                }
                string maKhachHang;
                tongtien -= tongtien * (phanTramGiamGia / 100);
                decimal soTienGiamGia = tongtien * (phanTramGiamGia / 100);
                var existingCustomer = db.KhachHangs.FirstOrDefault(kh => kh.SDT == SDT.Value || kh.Email == Email.Value);
                if (existingCustomer != null)
                {
                    maKhachHang = existingCustomer.MaKH;
                    HDBan hdban = new HDBan
                    {
                        MaHDBan = CreateKey("HD"),
                        MaNV = chonNhanVien.SelectedValue,
                        MaKH = maKhachHang,
                        NgayBan = DateTime.Now,
                        TongTien = tongtien
                    };
                    db.HDBans.InsertOnSubmit(hdban);

                    foreach (var item in cart)
                    {
                        ChiTietBan ctban = new ChiTietBan
                        {
                            MaHDBan = hdban.MaHDBan,
                            MaThuoc = item.MaThuoc,
                            SoLuong = item.SoLuong,
                            DonGia = item.DonGia,
                            GiamGia = soTienGiamGia,
                            ThanhTien = item.SoLuong * item.DonGia * (1 - phanTramGiamGia / 100)
                        };
                        db.ChiTietBans.InsertOnSubmit(ctban);
                    }
                    db.SubmitChanges();
                    cart.Clear();
                    BindCart();

                    var products = db.Thuocs.ToList();
                    ProductRepeater.DataSource = products;
                    ProductRepeater.DataBind();
                    Response.Write("<script>alert('Mua hàng thành công với giảm giá " + phanTramGiamGia + "%!');</script>");
                    Response.Redirect("inhoadonban.aspx?idhd=" + hdban.MaHDBan);


                }

                KhachHang kh1 = new KhachHang
                {
                    MaKH = CreateKey("KH"),
                    MaCN = "CN001",
                    TenKH = TenKH.Value,
                    SDT = SDT.Value,
                    Email = Email.Value,
                    DiaChi = DiaChi.Value,
                    GioiTinh = GioiTinh.SelectedValue
                };
                db.KhachHangs.InsertOnSubmit(kh1);

                HDBan hdban1 = new HDBan
                {
                    MaKH = CreateKey("KH"),
                    MaHDBan = CreateKey("HD"),
                    MaNV = chonNhanVien.SelectedValue,
                   
                    NgayBan = DateTime.Now,
                    TongTien = tongtien
                };
                db.HDBans.InsertOnSubmit(hdban1);


  
                foreach (var item in cart)
                {
                    ChiTietBan ctban = new ChiTietBan
                    {
                        MaHDBan = hdban1.MaHDBan,
                        MaThuoc = item.MaThuoc,
                        SoLuong = item.SoLuong,
                        DonGia = item.DonGia,
                        GiamGia = soTienGiamGia,
                        ThanhTien = item.SoLuong * item.DonGia * (1 - phanTramGiamGia / 100)
                    };
                    db.ChiTietBans.InsertOnSubmit(ctban);
                }
                db.SubmitChanges();
                cart.Clear();
                BindCart();

                var products1 = db.Thuocs.ToList();
                ProductRepeater.DataSource = products1;
                ProductRepeater.DataBind();
                Response.Write("<script>alert('Mua hàng thành công với giảm giá " + phanTramGiamGia + "%!');</script>");
                Response.Redirect("inhoadonban.aspx?idhd=" + hdban1.MaHDBan);

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Có lỗi xảy ra: " + ex.Message + "');</script>");
            }
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

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            string searchKeyword = txtTimKiem.Text.Trim(); 

            if (!string.IsNullOrEmpty(searchKeyword))
            {
                var filteredProducts = db.Thuocs
                    .Where(t => t.TenThuoc.Contains(searchKeyword)) 
                    .ToList();

                ProductRepeater.DataSource = filteredProducts;
                ProductRepeater.DataBind();
            }
            else
            {
                var allProducts = db.Thuocs.ToList();
                ProductRepeater.DataSource = allProducts;
                ProductRepeater.DataBind();
            }    
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            HttpRuntime.UnloadAppDomain();
            Response.Redirect("login.aspx");
        }

    }
}