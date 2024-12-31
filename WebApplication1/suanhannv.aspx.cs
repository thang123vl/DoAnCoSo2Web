using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class suanhanvn : System.Web.UI.Page
    {
        public static PharmacyDataContext db = new PharmacyDataContext();
        public static NhanVien nv = new NhanVien();
        public static List<ChiNhanh> cn = new List<ChiNhanh>();
        public static TaiKhoan tknv = new TaiKhoan();
        protected void Page_Load(object sender, EventArgs e)
        {
            string idthuoc = Request.QueryString["idthuoc"];
            TaiKhoan tk = (TaiKhoan)Session["User"];
            lblFullName.InnerText = tk.Ten;
            lblFullName1.InnerText = "Xin Chào " + tk.Ten + "!";
            if (!IsPostBack)
            {

                string idNhanVien = Request.QueryString["idnv"];

                if (!string.IsNullOrEmpty(idNhanVien))
                {
                    LoadNhanVienInfo(idNhanVien);
                }
            }


            var nv = db.ChiNhanhs.ToList();

            MaCN.DataSource = nv;
            MaCN.DataTextField = "TenCN";
            MaCN.DataValueField = "MaCN";
            MaCN.DataBind();
        }
        void LoadNhanVienInfo(string idNhanVien)
        {
            nv = (from q in db.NhanViens
                  where q.MaNV == idNhanVien
                  select q).First();
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            string idNhanVien = Request.QueryString["idnv"];
            string maCN = MaCN.SelectedValue;
            nv = (from q in db.NhanViens
                where q.MaNV == idNhanVien
                select q).First();
            tknv = (from q in db.TaiKhoans
                    where q.MaNV == idNhanVien
                  select q).First();
                nv.TenNV = TenNV.Value;
                tknv.UserRole = userrole.SelectedValue;
                nv.DiaChi = DiaChi.Value;
                nv.SDT = SDT.Value;
                nv.GioiTinh = GioiTinh.SelectedValue;
                db.SubmitChanges();
                Response.Redirect("nhanvien.aspx");
                Response.Write("<script>alert('Cập Nhật Thành Công!');</script>");
               



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
   
