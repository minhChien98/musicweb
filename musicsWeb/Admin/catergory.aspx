<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/adminLayout.Master" AutoEventWireup="true" CodeBehind="catergory.aspx.cs" Inherits="musicsWeb.Admin.catergory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="adminHead" runat="server">
    Quản lý thể loại
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminContent" runat="server">
    <h2>Quản lý thể loại</h2>
    <asp:Button ID="btnShowPopup" runat="server" Text="Thêm mới"
        CssClass="btn btn-info btn-sm" OnClick="btnShowPopup_Click" />
    <div class="tableView">
        <asp:GridView ID="grw1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="maTheLoai" DataSourceID="SqlDataSource1" CssClass="table table-bordered mygrdContent" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" OnSelectedIndexChanged="RowSelected">
            <Columns>
                <asp:BoundField DataField="maTheLoai" HeaderText="Mã thể loại" ReadOnly="True" SortExpression="maTheLoai">
                    <ItemStyle CssClass="countryName" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="tenTheLoai" HeaderText="Tên thể loại" SortExpression="tenTheLoai">
                    <ItemStyle CssClass="countryCode" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Thao tác" ShowHeader="False">
                    <ItemTemplate>
                        <%--<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>--%>
                        <asp:Button ID="btnEdit" runat="server" Text="Sửa" CausesValidation="False" CommandName="Select"
                            CssClass="btn btn-primary btn-sm" />
                        &nbsp;&nbsp;
                        <%--<asp:Button ID="LinkButton2" runat="server" CausesValidation="False" OnClientClick="return confirm('Bạn có muốn xóa không?');" CommandName="Delete" Text="Delete"></asp:Button>--%>
                        <asp:Button ID="LinkButton2" runat="server" Text="Xóa" CausesValidation="False" OnClientClick="return confirm('Bạn có muốn xóa không?');" CommandName="Delete"
                            CssClass="btn btn-danger btn-sm" />
                    </ItemTemplate>
                    <ItemStyle CssClass="countryAction" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Web_Music_Conn %>" DeleteCommand="DELETE FROM [catergories] WHERE [maTheLoai] = @maTheLoai" InsertCommand="INSERT INTO [catergories] ([maTheLoai], [tenTheLoai]) VALUES (@maTheLoai, @tenTheLoai)" SelectCommand="SELECT * FROM [catergories]" UpdateCommand="UPDATE [catergories] SET [tenTheLoai] = @tenTheLoai WHERE [maTheLoai] = @maTheLoai">
            <DeleteParameters>
                <asp:Parameter Name="maTheLoai" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="maTheLoai" Type="String" />
                <asp:Parameter Name="tenTheLoai" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="tenTheLoai" Type="String" />
                <asp:Parameter Name="maTheLoai" Type="String" />
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
                    &times;</button>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="code">Mã thể loại</label>
                        <input type="text" runat="server" class="form-control" id="txtCode" aria-describedby="emailHelp" placeholder="Mã thể loại">
                        <%--<asp:RequiredFieldValidator ID="rusername" ControlToValidate="code" CssClass="errMess" ErrorMessage="Bạn không được để trống trường này!" ForeColor="Red" runat="server" />
                        <asp:RegularExpressionValidator ID="expusername" runat="server" ControlToValidate="code" CssClass="errMess" ValidationExpression="[a-z]{2}" ForeColor="Red" ErrorMessage="Gồm 2 kí tự, không chứa kí tự đặc biệt!" />--%>
                    </div>
                    <div class="form-group">
                        <label for="name">Tên thể loại</label>
                        <input type="text" runat="server" class="form-control" id="txtName" aria-describedby="emailHelp" placeholder="Tên thể loại">
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" CssClass="btn btn-primary" ID="btnSubmit1" OnClick="addNewCatergory" Text="Thêm" />
                    &nbsp;
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Đóng</button>
                </div>
            </div>
        </div>
    </div>
    <%--My modal--%>
    <div id="MyPopupEdit" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="width: 100%;">
                    <h4 class="modal-title">Sửa&nbsp;<button type="button" class="close" data-dismiss="modal" style="position: absolute; right: 30px;">
                    &times;</button>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="code">Mã thể loại</label>
                        <input type="text" runat="server" class="form-control" id="txtCodeEdit" aria-describedby="emailHelp" placeholder="Mã thể loại">
                        <%--<asp:RequiredFieldValidator ID="rusername" ControlToValidate="code" CssClass="errMess" ErrorMessage="Bạn không được để trống trường này!" ForeColor="Red" runat="server" />
                        <asp:RegularExpressionValidator ID="expusername" runat="server" ControlToValidate="code" CssClass="errMess" ValidationExpression="[a-z]{2}" ForeColor="Red" ErrorMessage="Gồm 2 kí tự, không chứa kí tự đặc biệt!" />--%>
                    </div>
                    <div class="form-group">
                        <label for="name">Tên thể loại</label>
                        <input type="text" runat="server" class="form-control" id="txtNameEdit" aria-describedby="emailHelp" placeholder="Tên thể loại">
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" CssClass="btn btn-primary" ID="Button1" OnClick="editCatergory" Text="Sửa" />
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
