<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="votepicker_webproj.admin"  %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">

    <form id="form1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sql12347806ConnectionString %>" DeleteCommand="DELETE FROM accounts WHERE (username = @username)" ProviderName="<%$ ConnectionStrings:sql12347806ConnectionString.ProviderName %>" SelectCommand="SELECT username, email, name,accountStatus FROM accounts WHERE (username &lt;&gt; 'admin')" UpdateCommand="UPDATE accounts SET email = @email, name = @name, accountStatus = @accountStatus WHERE (username = @username)"></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="mygrdContent" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1148px" OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" InsertVisible="False" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
         
         
            
              
            <asp:TemplateField HeaderText="Status" SortExpression="accountStatus">
                <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("accountStatus") %>' Width="126px">
                            <asp:ListItem>Active</asp:ListItem>
                            <asp:ListItem>Suspended</asp:ListItem>
                        </asp:DropDownList>
                         </EditItemTemplate>
                  <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("accountStatus") %>'></asp:Label>
                    </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="">
                 <ItemTemplate>
                     <asp:Button ID="Button2" runat="server" CausesValidation="false" CommandName="DELTETO"
                    Text="Delete user"  BorderStyle="None" CommandArgument='<%# Eval("username") %>' />
                </ItemTemplate>

            </asp:TemplateField>
         
        </Columns>

<HeaderStyle CssClass="header"></HeaderStyle>

<PagerStyle CssClass="pager"></PagerStyle>

<RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>


        <style>
        .grdContent
        {
            width: 80%;
            border: solid 2px black;
            min-width: 80%;
        }
        .header
        {
            background-color: #646464;
            font-family: Arial;
            color: White;
            border: none 0px transparent;
            height: 25px;
            text-align: center;
            font-size: 16px;
        }
        .rows
        {
            background-color: #fff;
            font-family: Arial;
            font-size: 14px;
            color: #000;
            min-height: 25px;
            text-align: left;
            border: none 0px transparent;
        }
        .rows:hover
        {
            background-color: #ff8000;
            font-family: Arial;
            color: #fff;
            text-align: left;
        }
        .selectedrow
        {
            background-color: #ff8000;
            font-family: Arial;
            color: #fff;
            font-weight: bold;
            text-align: left;
        }
        .mydatagrid a /** FOR THE PAGING ICONS  **/
         {
            background-color: Transparent;
            padding: 5px 5px 5px 5px;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }
        .mygrdContent a:hover /** FOR THE PAGING ICONS  HOVER STYLES**/
        {
            background-color: #000;
            color: #fff;
        }
        .mygrdContent span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/
         {
            background-color: #c9c9c9;
            color: #000;
            padding: 5px 5px 5px 5px;
        }
        .pager
        {
            background-color: #646464;
            font-family: Arial;
            color: White;
            height: 30px;
            text-align: left;
        }
        .mygrdContent td
        {
            padding: 5px;
        }
        .mygrdContent th
        {
            padding: 5px;
        }
    </style> 
    <br />
</form>


</asp:Content>



