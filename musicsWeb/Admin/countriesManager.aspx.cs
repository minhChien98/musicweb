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
    public partial class countriesManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnShowPopup_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
        }

        protected void addNewCountry(object sender, EventArgs e)
        {
            string code = txtCode.Value;
            string name = txtName.Value;

            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Web_Music_Conn"].ToString());
            Conn.Open();
            string sqlSELECT = "INSERT INTO countries VALUES (@ma, @ten)";
            SqlCommand Cmd = new SqlCommand(sqlSELECT, Conn);
            Cmd.Parameters.AddWithValue("ma", code);
            Cmd.Parameters.AddWithValue("ten", name);
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
            Conn.Close();
        }

        protected void editCountry(object sender, EventArgs e)
        {
            string code = txtCodeEdit.Value;
            string name = txtNameEdit.Value;

            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Web_Music_Conn"].ToString());
            Conn.Open();
            string sqlSELECT = "UPDATE countries SET tenQuocGia=@ten WHERE maQuocGia=@ma";
            SqlCommand Cmd = new SqlCommand(sqlSELECT, Conn);
            Cmd.Parameters.AddWithValue("ma", code);
            Cmd.Parameters.AddWithValue("ten", name);
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
            Conn.Close();
        }
        protected void RowSelected(object sender, EventArgs e)
        {
            string code = GridView1.SelectedRow.Cells[1].Text;
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Web_Music_Conn"].ToString());
            Conn.Open();
            string sqlSELECT = "SELECT * FROM countries WHERE maQuocGia=@ma";
            SqlCommand Cmd = new SqlCommand(sqlSELECT, Conn);
            Cmd.Parameters.AddWithValue("ma", code);
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            string name = dr["tenQuocGia"].ToString();
            txtCodeEdit.Value = code;
            txtCodeEdit.Disabled = true;
            txtNameEdit.Value = name;
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopupEdit();", true);
            Conn.Close();
        }
    }
}