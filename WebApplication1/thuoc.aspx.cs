using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        public static PharmacyDataContext db = new PharmacyDataContext();
        public static List<Thuoc> thuoc = new List<Thuoc>();

        protected void Page_Load(object sender, EventArgs e)
        {
            loadthuoc();
            CapNhatTinhTrangThuoc();

            if (Session["UserRole"] == null || Session["UserRole"].ToString() == "User")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Unauthorized", "alert('Bạn không có quyền truy cập vào trang này.'); window.location='TrangChu.aspx';", true);
                return;
            }
            TaiKhoan tk = (TaiKhoan)Session["User"];

            lblFullName.InnerText = tk.Ten;
            lblFullName1.InnerText = "Xin Chào " + tk.Ten + "!";

            xoathuoc();

        }

        void loadthuoc()
        {
            var data = from q in db.Thuocs
                       select q;

            thuoc = data.ToList();

        }
        void CapNhatTinhTrangThuoc()
        {
            {
                var danhSachThuoc = db.Thuocs.ToList();
                for (int i = 0; i < danhSachThuoc.Count; i++)
                {
                    if (danhSachThuoc[i].SoLuong == 0)
                    {
                        danhSachThuoc[i].TinhTrang = "Hết Hàng";
                    }
                    else
                    {
                        danhSachThuoc[i].TinhTrang = "Còn Hàng";
                    }
                }

                db.SubmitChanges();
            }
        }


        void xoathuoc()
        {
            string action = Request.QueryString["action"];
            string maThuoc = Request.QueryString["maThuoc"];

            if (action == "delete" && !string.IsNullOrEmpty(maThuoc))
            {
                var thuocToDelete = db.Thuocs.FirstOrDefault(t => t.MaThuoc == maThuoc);
                if (thuocToDelete != null)
                {
                    db.Thuocs.DeleteOnSubmit(thuocToDelete);
                    db.SubmitChanges();
                    loadthuoc();
                }
            }
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            string keyword = txtTimKiem.Text.Trim();
            TimKiemThuoc(keyword);
        }

        public void TimKiemThuoc(string keyword)
        {
            var ketQua = db.Thuocs
                .Where(t => t.TenThuoc.Contains(keyword))
                .ToList();
            thuoc = ketQua;
            if (thuoc.Count == 0)
            {
                //lblThongBao.Text = "Không tìm thấy thuốc nào phù hợp.";
            }
            else
            {
                //lblThongBao.Text = "";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            HttpRuntime.UnloadAppDomain();
            Response.Redirect("login.aspx");
        }

        protected void btnThemDanhMuc_Click(object sender, EventArgs e)
        {
            formThemDanhMuc.Style["display"] = "block";
        }


        protected void btnLuuDanhMuc_Click(object sender, EventArgs e)
        {
            var ktra = db.DanhMucs.FirstOrDefault(t => t.TenDM == txtTenDanhMuc.Text);
            if (ktra != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Danh mục này đã tồn tại!');", true);
            }
            else {


                if (txtTenDanhMuc.Text != "")
                {
                
                    DanhMuc dm = new DanhMuc();
                    string mamd = CreateKey("DM");
                    dm.MaDM = mamd;
                    dm.TenDM = txtTenDanhMuc.Text;
                    db.DanhMucs.InsertOnSubmit(dm);
                    db.SubmitChanges();
                    txtTenDanhMuc.Text = string.Empty;
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đã thêm Danh mục!');", true);

                }
                else {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng nhập tên');", true);

                }

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


        }
        }
    