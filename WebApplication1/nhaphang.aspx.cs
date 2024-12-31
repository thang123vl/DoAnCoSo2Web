using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        private static List<Thuoc> gioHang = new List<Thuoc>();
        public static PharmacyDataContext db = new PharmacyDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            string idthuoc = Request.QueryString["idthuoc"];


            if (Session["UserRole"] == null || Session["UserRole"].ToString() == "User")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Unauthorized", "alert('Bạn không có quyền truy cập vào trang này.'); window.location='TrangChu.aspx';", true);
                return;
            }
            TaiKhoan tk = (TaiKhoan)Session["User"];

            lblFullName.InnerText = tk.Ten;
            lblFullName1.InnerText = "Xin Chào " + tk.Ten + "!";
            if (!IsPostBack)
            {
                List<Thuoc> dsthuoc = (from t in db.Thuocs
                                       select new Thuoc
                                       {
                                           TenThuoc = t.TenThuoc,
                                           SoLuong = t.SoLuong,
                                           MaThuoc = t.MaThuoc  
                                       }).ToList();

                List<NhanVien> dsnhanvien = db.NhanViens.ToList();
                List<string> dsTenNV = (from q in db.NhanViens
                                        select q.TenNV).ToList();

                
                chonSP.DataSource = dsthuoc;
                chonSP.DataTextField = "TenThuoc"; 
                chonSP.DataValueField = "MaThuoc"; 
                chonSP.DataBind();

                chonNhanVien.Items.Add(new ListItem(tk.Ten, tk.MaNV.ToString()));
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            string tenSP = chonSP.SelectedItem.Text;
            string maThuoc = chonSP.SelectedValue; 

            int soLuong;
            decimal donGia;
            string maNV = chonNhanVien.SelectedValue;
            if (int.TryParse(txtSoLuong.Text, out soLuong) && soLuong > 0 && decimal.TryParse(txtDonGia.Text, out donGia) && donGia > 0)
            {
                // Tìm thuốc trong giỏ hàng
                Thuoc thuoc = gioHang.Find(t => t.MaThuoc == maThuoc); // Tìm theo MaThuoc

                if (thuoc != null)
                {
                    thuoc.DonGia = donGia;   // Cập nhật đơn giá nếu thuốc đã có trong giỏ hàng
                    thuoc.SoLuong += soLuong; // Cập nhật số lượng
                }
                else
                {
                    // Thêm mới thuốc vào giỏ hàng với MaThuoc
                    gioHang.Add(new Thuoc { TenThuoc = tenSP, SoLuong = soLuong, DonGia = donGia, MaNV = maNV, MaThuoc = maThuoc });
                }

                // Cập nhật giỏ hàng vào ListView
                ListView1.DataSource = gioHang;
                ListView1.DataBind();

                lblThongBao.Text = "Thêm sản phẩm thành công!";
                lblThongBao.ForeColor = System.Drawing.Color.White;
            }
            else
            {
                lblThongBao.Text = "Vui lòng nhập số lượng và đơn giá hợp lệ!";
                lblThongBao.ForeColor = System.Drawing.Color.White;
            }
        }

        protected void btnXacNhan_Click(object sender, EventArgs e)
        {
            if (gioHang.Count > 0)
            {
                try
                {
                    decimal tongtien = 0;
                    int tongsoluong = 0;

                    // Tạo hóa đơn nhập mới
                    string idhdnhap = CreateKey("HDNhap");
                    HDNhap hdnhap = new HDNhap
                    {
                        MaHDNhap = idhdnhap,
                        MaNV = chonNhanVien.SelectedValue,
                        MaNCC = "01", 
                        TongTien = 0, 
                        NgayDat = DateTime.Now
                    };

                    db.HDNhaps.InsertOnSubmit(hdnhap);

                    foreach (var item in gioHang)
                    {
                        decimal thanhTien = item.SoLuong * item.DonGia;
                        tongsoluong += item.SoLuong;
                        tongtien += thanhTien;

                       
                        var thuocTrongCSDL = db.Thuocs.FirstOrDefault(t => t.MaThuoc == item.MaThuoc); 
                        if (thuocTrongCSDL != null)
                        {
                            thuocTrongCSDL.SoLuong += item.SoLuong;
                            thuocTrongCSDL.DonGia = item.DonGia;
                            thuocTrongCSDL.NgayCungCap = DateTime.Now;

                            db.SubmitChanges();
                        }

                      
                        decimal vat = thanhTien * 0.1m; 
                        ChiTietNhap ctnhap = new ChiTietNhap();
                        ctnhap.MaHDNhapHang = idhdnhap;
                        ctnhap.MaThuoc = item.MaThuoc;
                        ctnhap.SoLuong = item.SoLuong;
                        ctnhap.ThanhTien = thanhTien;
                        ctnhap.VAT = decimal.Parse("10".ToString());
                        ctnhap.DonViTinh = "vnd";

                        db.ChiTietNhaps.InsertOnSubmit(ctnhap);
                    }


                    hdnhap.TongTien = tongtien;

                    db.SubmitChanges();
           
                    
                    gioHang.Clear();
                    ListView1.DataSource = null;
                    ListView1.DataBind();
                    Response.Redirect("chitietnhap.aspx?mahoadon=" + hdnhap.MaHDNhap);
                }
                catch (Exception ex)
                {
                    lblThongBao.Text = "Có lỗi xảy ra: " + ex.Message;
                    lblThongBao.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblThongBao.Text = "Giỏ hàng rỗng, vui lòng thêm sản phẩm!";
                lblThongBao.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
          
            string tenSP = ((Button)sender).CommandArgument;

          
            var thuoc = gioHang.FirstOrDefault(t => t.TenThuoc == tenSP);
            if (thuoc != null)
            {
                gioHang.Remove(thuoc);
            }

            ListView1.DataSource = gioHang;
            ListView1.DataBind();

            lblThongBao.Text = "Sản phẩm đã được xóa!";
            lblThongBao.ForeColor = System.Drawing.Color.White;
        }

        public class Thuoc
        {
            public string TenThuoc { get; set; }
            public int SoLuong { get; set; }
            public decimal DonGia { get; set; }
            public string MaNV { get; set; }
            public string NhanVien { get; set; }

            public string MaThuoc { get; set; }
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

        protected void btnThemTatCa_Click(object sender, EventArgs e)
        {
            try
            {
                // Lấy danh sách tất cả thuốc từ cơ sở dữ liệu
                var danhSachThuoc = (from t in db.Thuocs
                                     select new Thuoc
                                     {
                                         TenThuoc = t.TenThuoc,
                                         SoLuong = int.Parse(txtSoLuong.Text),
                                         DonGia = int.Parse(txtSoLuong.Text),
                                         MaThuoc = t.MaThuoc,
                                         MaNV = chonNhanVien.SelectedValue // Nhân viên xử lý
                                     }).ToList();

                // Duyệt qua danh sách và thêm vào giỏ hàng
                foreach (var thuoc in danhSachThuoc)
                {
                    // Kiểm tra nếu thuốc đã tồn tại trong giỏ hàng
                    var thuocTrongGio = gioHang.FirstOrDefault(t => t.MaThuoc == thuoc.MaThuoc);
                    if (thuocTrongGio != null)
                    {
                        thuocTrongGio.SoLuong += thuoc.SoLuong; // Cộng dồn số lượng nếu đã tồn tại
                    }
                    else
                    {
                        gioHang.Add(thuoc); // Thêm mới thuốc vào giỏ hàng
                    }
                }

                // Cập nhật giỏ hàng vào ListView
                ListView1.DataSource = gioHang;
                ListView1.DataBind();
                    
                lblThongBao.Text = "Đã thêm tất cả thuốc vào giỏ hàng!";
                lblThongBao.ForeColor = System.Drawing.Color.White;
            }
            catch (Exception ex)
            {
                lblThongBao.Text = "Có lỗi xảy ra: " + ex.Message;
                lblThongBao.ForeColor = System.Drawing.Color.Red;
            }
        }



    }
}