using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class addthuoc : System.Web.UI.Page
    {
        public static PharmacyDataContext db = new PharmacyDataContext();
        public static List<DanhMuc> danhmuclist = new List<DanhMuc>();
        protected void Page_Load(object sender, EventArgs e)
        {
            TaiKhoan tk = (TaiKhoan)Session["User"];
            lblFullName.InnerText = tk.Ten;
            lblFullName1.InnerText = "Xin Chào " + tk.Ten + "!";
            if (!IsPostBack)  // Kiểm tra nếu đây là lần tải trang đầu tiên
            {
                // Lấy danh mục, nhân viên, nhà cung cấp
                var danhmuclist = db.DanhMucs.ToList();
                var tennhanvien = db.NhanViens.ToList();
                var manhacc = db.NhaCungCaps.ToList();

                // Thiết lập dữ liệu cho dropdown danh mục
                MaDM.DataSource = danhmuclist;
                MaDM.DataTextField = "TenDM";  // Hiển thị tên danh mục
                MaDM.DataValueField = "MaDM"; // Giá trị là mã danh mục
                MaDM.DataBind();


                // Thiết lập dữ liệu cho dropdown nhân viên
                MaNV.DataSource = tennhanvien;
                MaNV.DataTextField = "TenNV"; // Hiển thị tên nhân viên
                MaNV.DataValueField = "MaNV"; // Giá trị là mã nhân viên
                MaNV.DataBind();

                // Thiết lập dữ liệu cho dropdown nhà cung cấp
                MaNCC.DataSource = manhacc;
                MaNCC.DataTextField = "TenNCC"; // Hiển thị tên nhà cung cấp
                MaNCC.DataValueField = "MaNCC"; // Giá trị là mã nhà cung cấp
                MaNCC.DataBind();
            }
        }

        // Tạo mã thuốc ngẫu nhiên theo định dạng thời gian
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

        // Xử lý sự kiện khi bấm nút Thêm Thuốc
        protected void Button1_Click(object sender, EventArgs e)
        {
            Thuoc thuoc = new Thuoc();
            string idmathuoc = CreateKey("IDTHUOC");
            thuoc.MaThuoc = idmathuoc;
            string maDM = MaDM.SelectedValue;
            string maNV = MaNV.SelectedValue;
            string maNCC = MaNCC.SelectedValue;
            thuoc.MaDM = maDM;
            thuoc.MaNV = maNV;
            thuoc.MaNCC = maNCC;
            string tenThuoc = TenThuoc.Value.Trim();
            var existingThuoc = db.Thuocs.FirstOrDefault(t => t.TenThuoc == tenThuoc);
            if (existingThuoc != null)
            {

                Response.Write("<script>alert('Thuốc đã có!');</script>");
                return;
            }
            else
            {
                thuoc.TenThuoc = TenThuoc.Value;
                thuoc.DVT = "Viên";
                thuoc.MoTa = MoTa.Value;
                thuoc.TinhTrang = "Còn Hàng";
                thuoc.DonGia = decimal.Parse(DonGia.Value);
                thuoc.NgayCungCap = DateTime.Now;
                thuoc.NgaySX = DateTime.Parse(NgaySX.Value);
                thuoc.NgayHH = DateTime.Parse(NgayHH.Value);


                db.Thuocs.InsertOnSubmit(thuoc);
                db.SubmitChanges();
                Response.Write("<script>alert('Đã thêm thuốc thành công');</script>");
                Response.Redirect("thuoc.aspx");
            }
           
            
        }
    }
}