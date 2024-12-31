using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class chinhsuathuoc : System.Web.UI.Page
    {
        public static PharmacyDataContext db = new PharmacyDataContext();
        public static List<DanhMuc> danhmuclist = new List<DanhMuc>();
        public static Thuoc suathuoc = new Thuoc();

        protected void Page_Load(object sender, EventArgs e)
        {
            string idthuoc = Request.QueryString["idthuoc"];
            TaiKhoan tk = (TaiKhoan)Session["User"];
            lblFullName.InnerText = tk.Ten;
            lblFullName1.InnerText = "Xin Chào " + tk.Ten + "!";
            if (string.IsNullOrEmpty(idthuoc))
            {
          
                Response.Redirect("thuoc.aspx"); 
                return;
            }

         
            string maThuoc = idthuoc;

        
            var data = from q in db.Thuocs
                       where q.MaThuoc == maThuoc 
                       select q;

                suathuoc = data.First();


            if (!IsPostBack)
            {
   
                danhmuclist = db.DanhMucs.ToList();
                var tennhanvien = db.NhanViens.ToList();
                var manhacc = db.NhaCungCaps.ToList();

                MaDM.DataSource = danhmuclist;
                MaDM.DataTextField = "TenDM";
                MaDM.DataValueField = "MaDM";
                MaDM.DataBind();

    
                MaNV.DataSource = tennhanvien;
                MaNV.DataTextField = "TenNV";
                MaNV.DataValueField = "MaNV";
                MaNV.DataBind();

                MaNCC.DataSource = manhacc;
                MaNCC.DataTextField = "TenNCC";
                MaNCC.DataValueField = "MaNCC";
                MaNCC.DataBind();


                MaDM.SelectedValue = suathuoc.MaDM.ToString();
                MaNV.SelectedValue = suathuoc.MaNV.ToString();
                MaNCC.SelectedValue = suathuoc.MaNCC.ToString();
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

        void dataload(string idthuoc)
        {
            var data = from q in db.Thuocs
                       where q.MaThuoc == idthuoc
                       select q;

            suathuoc = data.First();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string maDM = MaDM.SelectedValue;  
            string maNV = MaNV.SelectedValue;  
            string maNCC = MaNCC.SelectedValue; 
            string idthuoc = Request.QueryString["idthuoc"];  

            
            suathuoc = (from q in db.Thuocs
                        where q.MaThuoc == idthuoc
                        select q).First();
                suathuoc.MaDM = maDM;
                suathuoc.MaNV = maNV;
                suathuoc.MaNCC = maNCC;
                suathuoc.TenThuoc = TenThuoc.Value;
                suathuoc.DVT = DonViDropDownList.SelectedValue;
                suathuoc.MoTa = MoTa.Value;
                suathuoc.TinhTrang = DropDownList1.SelectedValue;
                suathuoc.DonGia = decimal.Parse(DonGia.Value); // Không kiểm tra lỗi
                suathuoc.NgayCungCap = DateTime.Now;  // Ngày cung cấp là hiện tại
                suathuoc.NgaySX = DateTime.Parse(NgaySX.Value);  // Không kiểm tra lỗi
                suathuoc.NgayHH = DateTime.Parse(NgayHH.Value);     


                db.SubmitChanges();
                Response.Write("<script>alert('Cập Nhật Thành Công!');</script>");
                Response.Redirect("thuoc.aspx");


        }
    }
}