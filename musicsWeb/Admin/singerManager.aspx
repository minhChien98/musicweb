<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/adminLayout.Master" AutoEventWireup="true" CodeBehind="singerManager.aspx.cs" Inherits="musicsWeb.Admin.singerManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="adminHead" runat="server">
    Quản lý ca sĩ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminContent" runat="server">
    <h2>Quản lý ca sĩ</h2>
    <asp:Button ID="btnShowPopup" runat="server" Text="Thêm mới"
        CssClass="btn btn-info btn-sm" OnClick="btnShowPopup_Click" />
    <div class="tableView">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" CssClass="table table-bordered mygrdContent" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" OnSelectedIndexChanged="RowSelected">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Mã ca sĩ" InsertVisible="False" ReadOnly="True" SortExpression="id">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="tenCaSi" HeaderText="Tên ca sĩ" SortExpression="tenCaSi">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Ảnh" SortExpression="imgUrl">
                    <ItemTemplate>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# Bind("imgUrl") %>'></asp:Label>--%>
                        <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" ImageUrl='<%# "/" + Eval("imgUrl") %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:BoundField DataField="descriptions" HeaderText="Mô tả" SortExpression="descriptions">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="400px" />
                </asp:BoundField>
                <asp:BoundField DataField="ngaySinh" HeaderText="Ngày sinh" SortExpression="ngaySinh">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <%--<asp:TemplateField HeaderText="Mã quốc gia" SortExpression="maQuocGia">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("maQuocGia") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>--%>
                <asp:BoundField ApplyFormatInEditMode="True" DataField="tenQuocGia" HeaderText="Tên quốc gia" SortExpression="tenQuocGia">
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Web_Music_Conn %>" DeleteCommand="DELETE FROM [singers] WHERE [id] = @id"
            InsertCommand="INSERT INTO [singers] ([tenCaSi], [imgUrl], [descriptions], [ngaySinh], [maQuocGia]) VALUES (@tenCaSi, @imgUrl, @descriptions, @ngaySinh, @maQuocGia)"
            SelectCommand="SELECT singers.id, singers.tenCaSi, singers.imgUrl, singers.descriptions, singers.ngaySinh, countries.tenQuocGia FROM [singers] JOIN [countries] on singers.maQuocGia = countries.maQuocGia" UpdateCommand="UPDATE [singers] SET [tenCaSi] = @tenCaSi, [imgUrl] = @imgUrl, [descriptions] = @descriptions, [ngaySinh] = @ngaySinh, [maQuocGia] = @maQuocGia WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="tenCaSi" Type="String" />
                <asp:Parameter Name="imgUrl" Type="String" />
                <asp:Parameter Name="descriptions" Type="String" />
                <asp:Parameter Name="ngaySinh" Type="String" />
                <asp:Parameter Name="maQuocGia" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="tenCaSi" Type="String" />
                <asp:Parameter Name="imgUrl" Type="String" />
                <asp:Parameter Name="descriptions" Type="String" />
                <asp:Parameter Name="ngaySinh" Type="String" />
                <asp:Parameter Name="maQuocGia" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>


    <%--My modal--%>
    <div id="MyPopup" class="modal fade" role="dialog">
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
                        <label for="name">Tên ca sĩ</label>
                        <input type="text" runat="server" class="form-control" id="txtName" aria-describedby="emailHelp" placeholder="Tên thể loại">
                    </div>
                    <div class="form-group">
                        <label for="txtDob">Ngày sinh</label>
                        <input type="date" runat="server" class="form-control" id="txtDob" aria-describedby="emailHelp" placeholder="Ngày sinh">
                    </div>
                    <div class="form-group">
                        <label for="cbCountry">Quốc gia</label>
                        <asp:DropDownList ID="cbCountry" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="tenQuocGia" DataValueField="maQuocGia">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Web_Music_Conn %>" SelectCommand="SELECT * FROM [countries]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <label for="image">Ảnh</label>
                        <input type="file" runat="server" class="form-control" id="image" aria-describedby="emailHelp" placeholder="Chọn file">
                        <%--<asp:RequiredFieldValidator ID="rusername" ControlToValidate="code" CssClass="errMess" ErrorMessage="Bạn không được để trống trường này!" ForeColor="Red" runat="server" />
                            <asp:RegularExpressionValidator ID="expusername" runat="server" ControlToValidate="code" CssClass="errMess" ValidationExpression="[a-z]{2}" ForeColor="Red" ErrorMessage="Gồm 2 kí tự, không chứa kí tự đặc biệt!" />--%>
                    </div>
                    <div class="form-group">
                        <label for="describe">Mô tả</label>
                        <textarea type="text" runat="server" class="form-control" cols="40" rows="5" id="describe" aria-describedby="emailHelp" placeholder="Mô tả"> </textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" CssClass="btn btn-primary" ID="btnSubmit1" OnClick="addNewSinger" Text="Thêm" />
                    &nbsp;
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Đóng</button>
                </div>
            </div>
        </div>
    </div>

    <div id="MyPopupEdit"  class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="width: 100%;">
                    <h4 class="modal-title">Sửa&nbsp;
                        <button type="button" class="close" data-dismiss="modal" style="position: absolute; right: 30px;">
                        &times;
                        </button>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="txtNameEdit">Tên ca sĩ</label>
                        <input type="text" runat="server" class="form-control" id="txtNameEdit" aria-describedby="emailHelp" placeholder="Tên thể loại">
                    </div>
                    <div class="form-group">
                        <label for="txtDobEdit">Ngày sinh</label>
                        <input type="date" runat="server" class="form-control" id="txtDobEdit" aria-describedby="emailHelp" placeholder="Ngày sinh">
                    </div>
                    <div class="form-group">
                        <label for="cbCountryEdit">
                            Quốc gia
                        </label>

                        <asp:DropDownList ID="cbCountryEdit"  class="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="tenQuocGia" DataValueField="maQuocGia">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Web_Music_Conn %>" SelectCommand="SELECT * FROM [countries]"></asp:SqlDataSource>

                    </div>
                    <div class="form-group">
                        <label for="imageEdit">Ảnh</label>
                        <input type="file" accept="image/*" runat="server" class="form-control" id="imageEdit" aria-describedby="emailHelp" placeholder="Chọn file">
                        <%--<asp:RequiredFieldValidator ID="rusername" ControlToValidate="code" CssClass="errMess" ErrorMessage="Bạn không được để trống trường này!" ForeColor="Red" runat="server" />
                            <asp:RegularExpressionValidator ID="expusername" runat="server" ControlToValidate="code" CssClass="errMess" ValidationExpression="[a-z]{2}" ForeColor="Red" ErrorMessage="Gồm 2 kí tự, không chứa kí tự đặc biệt!" />--%>
                    </div>
                    <div class="form-group">
                        <label for="describeEdit">Mô tả</label>
                        <textarea type="text" runat="server" class="form-control" cols="40" rows="5" id="describeEdit" aria-describedby="emailHelp" placeholder="Mô tả"> </textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" CssClass="btn btn-primary" ID="Button1" OnClick="editSinger" Text="Sửa" />
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
