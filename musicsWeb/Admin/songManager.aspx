<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/adminLayout.Master" AutoEventWireup="true" CodeBehind="songManager.aspx.cs" Inherits="musicsWeb.Admin.addSong" %>

<asp:Content ID="Content1" ContentPlaceHolderID="adminHead" runat="server">
    Thêm bài hát
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminContent" runat="server">
    <h2>Quản lý bài hát</h2>
    <asp:Button ID="btnShowPopup" runat="server" Text="Thêm mới"
        CssClass="btn btn-info btn-sm" OnClick="btnShowPopup_Click" />

    <div class="tableView">



        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"  OnSelectedIndexChanged="RowSelected" DataKeyNames="id" DataSourceID="SqlDataSource4"  CssClass="table table-bordered mygrdContent" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Mã bài hát" InsertVisible="False" ReadOnly="True" SortExpression="id" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="tenBaiHat" HeaderText="Tên bài hát" SortExpression="tenBaiHat" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="songUrl" HeaderText="Đường dẫn" SortExpression="songUrl" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Ảnh" SortExpression="imgUrl">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" ImageUrl='<%# "/" + Eval("imgUrl") %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:BoundField DataField="moTa" HeaderText="Mô tả" SortExpression="moTa" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="loiBaiHat" HeaderText="Lời" SortExpression="loiBaiHat" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="luotNghe" HeaderText="Lượt nghe" SortExpression="luotNghe" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="luotThich" HeaderText="Lượt thích" SortExpression="luotThich" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="tenCaSi" HeaderText="Ca sĩ" SortExpression="tenCaSi" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="tenQuocGia" HeaderText="Quốc gia" SortExpression="tenQuocGia" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="thoiLuong" HeaderText="Thời lượng" SortExpression="thoiLuong" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="tenTheLoai" HeaderText="Thể loại" SortExpression="tenTheLoai" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:TemplateField ShowHeader="False" HeaderText="Thao tác">
                    <ItemTemplate>
                        <%--<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>--%>
                        <asp:Button ID="btnEdit" runat="server" Text="Sửa" CausesValidation="False" CommandName="Select"
                            CssClass="btn btn-primary btn-sm" />
                        &nbsp;&nbsp;
                        <%--<asp:Button ID="LinkButton2" runat="server" CausesValidation="False" OnClientClick="return confirm('Bạn có muốn xóa không?');" CommandName="Delete" Text="Delete"></asp:Button>--%>
                        <asp:Button ID="LinkButton2" runat="server" Text="Xóa" CausesValidation="False" OnClientClick="return confirm('Bạn có muốn xóa không?');" CommandName="Delete"
                            CssClass="btn btn-danger btn-sm" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
            </Columns>

<HeaderStyle CssClass="header"></HeaderStyle>

<PagerStyle CssClass="pager"></PagerStyle>

<RowStyle CssClass="rows"></RowStyle>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Web_Music_Conn %>"
            DeleteCommand="DELETE FROM [songs] WHERE [id] = @id" InsertCommand="INSERT INTO [songs] ([tenBaiHat], [songUrl], [imgUrl], [moTa], [loiBaiHat], [luotNghe], [luotThich], [maCaSi], [maQuocGia], [thoiLuong], [maTheLoai]) VALUES (@tenBaiHat, @songUrl, @imgUrl, @moTa, @loiBaiHat, @luotNghe, @luotThich, @maCaSi, @maQuocGia, @thoiLuong, @maTheLoai)"
            SelectCommand="SELECT songs.id, songs.tenBaiHat, songs.songUrl, songs.imgUrl, songs.moTa, songs.loiBaiHat, songs.luotNghe, songs.luotThich, singers.tenCaSi, countries.tenQuocGia, songs.thoiLuong, catergories.tenTheLoai
 FROM songs JOIN countries ON songs.maQuocGia = countries.maQuocGia JOIN singers ON songs.maCaSi = singers.id  JOIN catergories ON catergories.maTheLoai = songs.maTheLoai"
            UpdateCommand="UPDATE [songs] SET [tenBaiHat] = @tenBaiHat, [songUrl] = @songUrl, [imgUrl] = @imgUrl, [moTa] = @moTa, [loiBaiHat] = @loiBaiHat, [luotNghe] = @luotNghe, [luotThich] = @luotThich, [maCaSi] = @maCaSi, [maQuocGia] = @maQuocGia, [thoiLuong] = @thoiLuong, [maTheLoai] = @maTheLoai WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="tenBaiHat" Type="String" />
                <asp:Parameter Name="songUrl" Type="String" />
                <asp:Parameter Name="imgUrl" Type="String" />
                <asp:Parameter Name="moTa" Type="String" />
                <asp:Parameter Name="loiBaiHat" Type="String" />
                <asp:Parameter Name="luotNghe" Type="Int32" />
                <asp:Parameter Name="luotThich" Type="Int32" />
                <asp:Parameter Name="maCaSi" Type="Int32" />
                <asp:Parameter Name="maQuocGia" Type="String" />
                <asp:Parameter Name="thoiLuong" Type="String" />
                <asp:Parameter Name="maTheLoai" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="tenBaiHat" Type="String" />
                <asp:Parameter Name="songUrl" Type="String" />
                <asp:Parameter Name="imgUrl" Type="String" />
                <asp:Parameter Name="moTa" Type="String" />
                <asp:Parameter Name="loiBaiHat" Type="String" />
                <asp:Parameter Name="luotNghe" Type="Int32" />
                <asp:Parameter Name="luotThich" Type="Int32" />
                <asp:Parameter Name="maCaSi" Type="Int32" />
                <asp:Parameter Name="maQuocGia" Type="String" />
                <asp:Parameter Name="thoiLuong" Type="String" />
                <asp:Parameter Name="maTheLoai" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>



    </div>



    <%--My modal--%>
    <div id="MyPopup" class="modal fade" role="dialog">
        <%--class="modal fade" role="dialog"--%>
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="width: 100%;">
                    <h4 class="modal-title">Thêm mới&nbsp;<button type="button" class="close" data-dismiss="modal" style="position: absolute; right: 30px;">
                            &times;
                        </button>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="name">Tên bài hát</label>
                        <input type="text" runat="server" class="form-control" id="txtName" aria-describedby="emailHelp" placeholder="Tên bài hát">
                    </div>
                    <div class="form-group">
                        <label for="avatar">Ảnh đại diện</label>
                        <input type="file" accept="image/*" runat="server" class="form-control" id="avatar" aria-describedby="emailHelp" placeholder="Chọn file">
                    </div>
                    <div class="form-group">
                        <label for="mp3File">File bài hát</label>
                        <input type="file" accept="audio/*" runat="server" class="form-control" id="mp3File" aria-describedby="emailHelp" placeholder="Chọn file">
                    </div>
                    <div class="form-group">
                        <label for="cbSinger">
                            Ca sĩ
                        </label>
                        <asp:DropDownList ID="cbSinger" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="tenCaSi" DataValueField="id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Web_Music_Conn %>" SelectCommand="SELECT [id], [tenCaSi] FROM [singers]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <label for="cbCatergory">
                            Thể loại
                        </label>
                        <asp:DropDownList ID="cbCatergory" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="tenTheLoai" DataValueField="maTheLoai">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Web_Music_Conn %>" SelectCommand="SELECT * FROM [catergories]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <label for="cbCountry">
                            Quốc gia
                        </label>
                        <asp:DropDownList ID="cbCountry" class="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="tenQuocGia" DataValueField="maQuocGia">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Web_Music_Conn %>" SelectCommand="SELECT * FROM [countries]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <label for="lyric">Lời bài hát</label>
                        <textarea type="text" runat="server" class="form-control" cols="40" rows="5" id="Textarea1" aria-describedby="emailHelp" placeholder="Lời bài hát"> </textarea>
                    </div>
                    <div class="form-group">
                        <label for="describe">Mô tả</label>
                        <textarea type="text" runat="server" class="form-control" cols="40" rows="5" id="describe" aria-describedby="emailHelp" placeholder="Mô tả"> </textarea>
                    </div>

                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" CssClass="btn btn-primary" ID="btnSubmit1" OnClick="addNewSong" Text="Thêm" />
                    &nbsp;
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Đóng</button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function ShowPopup() {
            $("#MyPopup").modal("show");
        }
        function HidePopup() {
            $("#MyPopup").modal("hide");
        }
        function ShowPopupEdit() {
            $("#MyPopupEdit").modal("show");
        }
        function HidePopupEdit() {
            $("#MyPopupEdit").modal("hide");
        }
    </script>
</asp:Content>
