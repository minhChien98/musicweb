using musicsWeb.Object;
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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Remove("User");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            User objUser = new User();
            string usernameRaw = username.Text.Trim();
            string passwordRaw = password.Text.Trim();

            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Web_Music_Conn"].ToString());
            Conn.Open();
            string sqlSELECT = "SELECT * FROM users WHERE username=@usernameCmd";
            SqlCommand Cmd = new SqlCommand(sqlSELECT, Conn);
            Cmd.Parameters.AddWithValue("usernameCmd", usernameRaw);
            try
            {
                SqlDataReader dr = Cmd.ExecuteReader();
                dr.Read();
                try
                {
                    string pass = dr["pass"].ToString();
                    if (pass.Equals(passwordRaw))
                    {
                        objUser.name = dr["ten"].ToString();
                        objUser.username = dr["username"].ToString();
                        objUser.roles = dr["maQuyen"].ToString();
                        objUser.code = dr["maND"].ToString();
                        Session.Add("User", objUser);
                        if (dr["maQuyen"].ToString().Equals("admin"))
                        {
                            Response.Redirect("~/Admin/songManager.aspx");
                        }
                        if (dr["maQuyen"].ToString().Equals("user"))
                        {
                            Response.Redirect("homePage.aspx");
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Bạn nhập sai mật khẩu')", true);
                    }
                }
                catch (Exception exp)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Bạn nhập sai tài khoản')", true);
                }
            } catch(Exception exp)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Không thể lấy dữ liệu')", true);
            }
            
        }
    }
}