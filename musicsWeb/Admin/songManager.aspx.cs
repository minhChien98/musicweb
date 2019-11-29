using NAudio.Wave;
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
    public partial class addSong : System.Web.UI.Page
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
        protected void addNewSong(object sender, EventArgs e)
        {
            string name = txtName.Value;
            string country = cbCountry.SelectedValue;
            string des = describe.Value;
            string lyric = describe.Value;
            string caSi = cbSinger.SelectedValue;
            string cater = cbCatergory.SelectedValue;
            string avatarUrl = "";
            TimeSpan duration = new TimeSpan();
            //double duration = 0;
            if ((avatar.PostedFile != null) && (avatar.PostedFile.ContentLength > 0))
            {
                string fn = System.IO.Path.GetFileName(avatar.PostedFile.FileName);
                string SaveLocation = Server.MapPath("../image") + "/" + fn;
                avatarUrl = "image/" + fn;
                try
                {
                    avatar.PostedFile.SaveAs(SaveLocation);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Không thể thêm ảnh')", true);
                }
            }
            string mp3Url = "";
            if ((mp3File.PostedFile != null) && (mp3File.PostedFile.ContentLength > 0))
            {
                string fn = System.IO.Path.GetFileName(mp3File.PostedFile.FileName);
                string SaveLocation = Server.MapPath("../songs") + "/" + fn;
                mp3Url = "songs/" + fn;
                try
                {
                    mp3File.PostedFile.SaveAs(SaveLocation);
                    Mp3FileReader reader = new Mp3FileReader(Server.MapPath("../songs") + "/" + fn);
                    duration = reader.TotalTime;
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Không thể thêm nhạc')", true);
                }
            }
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Web_Music_Conn"].ToString());
            Conn.Open();
            string sqlSELECT = "INSERT INTO [songs] (tenBaiHat, songUrl, imgUrl, moTa, loiBaiHat, luotNghe, luotThich, maCaSi, maQuocGia, thoiLuong, maTheLoai) VALUES (@ten, @song, @img, @descrip, @loi, 0, 0, @maCaSi, @maQuocGia, @thoiLuong, @maTheLoai)";
            SqlCommand Cmd = new SqlCommand(sqlSELECT, Conn);
            Cmd.Parameters.AddWithValue("ten", name);
            Cmd.Parameters.AddWithValue("song", mp3Url);
            Cmd.Parameters.AddWithValue("img", avatarUrl);
            Cmd.Parameters.AddWithValue("descrip", des);
            Cmd.Parameters.AddWithValue("loi", lyric);
            Cmd.Parameters.AddWithValue("maCaSi", caSi);
            Cmd.Parameters.AddWithValue("maQuocGia", country);
            Cmd.Parameters.AddWithValue("thoiLuong", duration.ToString());
            Cmd.Parameters.AddWithValue("maTheLoai", cater);
            try
            {
                int dr = Cmd.ExecuteNonQuery();
                if (dr == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "HidePopup();", true);
                    //GridView1.DataBind();
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
        protected void RowSelected(object sender, EventArgs e)
        {
            code = GridView1.SelectedRow.Cells[0].Text;
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Web_Music_Conn"].ToString());
            Conn.Open();
            string sqlSELECT = "SELECT * FROM songs WHERE id=@ma";
            SqlCommand Cmd = new SqlCommand(sqlSELECT, Conn);
            Cmd.Parameters.AddWithValue("ma", code);
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopupEdit();", true);
            Conn.Close();
        }
    }
}