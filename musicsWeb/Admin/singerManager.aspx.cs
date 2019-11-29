using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace musicsWeb.Admin
{
    public partial class singerManager : System.Web.UI.Page
    {
        public static string code = "";
        public static string urlImg = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnShowPopup_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
        }

        protected void addNewSinger(object sender, EventArgs e)
        {
            string name = txtName.Value;
            string dob = txtDob.Value.ToString();
            string country = cbCountry.SelectedValue;
            string des = describe.Value;
            string imgUrl = "";
            if ((image.PostedFile != null) && (image.PostedFile.ContentLength > 0))
            {
                string fn = System.IO.Path.GetFileName(image.PostedFile.FileName);
                string SaveLocation = Server.MapPath("../image") + "/" + fn;
                imgUrl = "image/" + fn;
                try
                {
                    image.PostedFile.SaveAs(SaveLocation);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Không thể thêm ảnh')", true);
                }
            }
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Web_Music_Conn"].ToString());
            Conn.Open();
            string sqlSELECT = "INSERT INTO [singers] (tenCaSi, imgUrl, descriptions, ngaySinh, maQuocGia) VALUES (@ten, @img, @descrip, @ngaySinh, @maQuocGia)";
            SqlCommand Cmd = new SqlCommand(sqlSELECT, Conn);
            Cmd.Parameters.AddWithValue("ten", name);
            Cmd.Parameters.AddWithValue("img", imgUrl);
            Cmd.Parameters.AddWithValue("descrip", des);
            Cmd.Parameters.AddWithValue("ngaySinh", dob);
            Cmd.Parameters.AddWithValue("maQuocGia", country);
            try
            {
                int dr = Cmd.ExecuteNonQuery();
                if (dr == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "HidePopup();", true);
                    GridView1.DataBind();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
                }
            }
            catch (Exception exp)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thêm mới thất bại')", true);
            }
        }

        protected void editSinger(object sender, EventArgs e)
        {
            string name = txtNameEdit.Value;
            string dob = txtDobEdit.Value.ToString();
            string country = cbCountryEdit.SelectedValue;
            string des = describeEdit.Value;
            string imgUrl = "";
            if ((imageEdit.PostedFile != null) && (imageEdit.PostedFile.ContentLength > 0))
            {
                string fn = System.IO.Path.GetFileName(imageEdit.PostedFile.FileName);
                string SaveLocation = Server.MapPath("../image") + "/" + fn;
                imgUrl = "image/" + fn;
                try
                {
                    imageEdit.PostedFile.SaveAs(SaveLocation);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Không thể thêm ảnh')", true);
                }
            }
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Web_Music_Conn"].ToString());
            Conn.Open();
            string sqlSELECT = "UPDATE [singers] SET tenCaSi=@ten, imgUrl=@img, descriptions=@descrip, ngaySinh=@ngaySinh, maQuocGia=@maQuocGia where id=@code";
            SqlCommand Cmd = new SqlCommand(sqlSELECT, Conn);
            Cmd.Parameters.AddWithValue("ten", name);
            System.Diagnostics.Debug.WriteLine(urlImg);
            if (!imgUrl.Equals(""))
            {
                Cmd.Parameters.AddWithValue("img", imgUrl);
            } else
            {
                Cmd.Parameters.AddWithValue("img", urlImg);
            }
            Cmd.Parameters.AddWithValue("code", code);
            Cmd.Parameters.AddWithValue("descrip", des);
            Cmd.Parameters.AddWithValue("ngaySinh", dob);
            Cmd.Parameters.AddWithValue("maQuocGia", country);
            try
            {
                int dr = Cmd.ExecuteNonQuery();
                if (dr == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "HidePopup();", true);
                    GridView1.DataBind();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
                }
            }
            catch (Exception exp)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sửa thất bại')", true);
            }
        }
        protected void RowSelected(object sender, EventArgs e)
        {
            code = GridView1.SelectedRow.Cells[0].Text;
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Web_Music_Conn"].ToString());
            Conn.Open();
            string sqlSELECT = "SELECT * FROM singers WHERE id=@ma";
            SqlCommand Cmd = new SqlCommand(sqlSELECT, Conn);
            Cmd.Parameters.AddWithValue("ma", code);
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            string name = dr["tenCaSi"].ToString();
            string dob = dr["ngaySinh"].ToString();
            string des = dr["descriptions"].ToString();
            urlImg = dr["imgUrl"].ToString();
            string maQuocGia = dr["maQuocGia"].ToString();
            txtNameEdit.Value = name;
            txtDobEdit.Value = dob;
            describeEdit.Value = des;
            cbCountryEdit.SelectedValue = maQuocGia;
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopupEdit();", true);
            Conn.Close();
        }
    }
}