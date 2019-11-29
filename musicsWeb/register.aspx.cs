using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace musicsWeb
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string usernameRaw = username.Text.Trim();
            string passwordRaw = password.Text.Trim();
            string nameRaw = name.Text.Trim();

            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Web_Music_Conn"].ToString());
            Conn.Open();
            string sqlSELECT = "INSERT INTO users (ten, username, pass, maQuyen) VALUES (@nameCmd, @usernameCmd, @passCmd, @quyen)";
            SqlCommand Cmd = new SqlCommand(sqlSELECT, Conn);
            Cmd.Parameters.AddWithValue("usernameCmd", usernameRaw);
            Cmd.Parameters.AddWithValue("nameCmd", nameRaw);
            Cmd.Parameters.AddWithValue("passCmd", passwordRaw);
            Cmd.Parameters.AddWithValue("quyen", "user");
            try
            {
                int dr = Cmd.ExecuteNonQuery();
                if (dr == 1)
                {
                    Response.Redirect("login.aspx");
                } else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Đăng kí thất bại!')", true);
                }
            }
            catch (Exception exp)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Tài khoản đã tồn tại!')", true);
            }
            
        }
    }
}