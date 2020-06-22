<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/presenter.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="votepicker_webproj._Default" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">


           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sql12347806ConnectionString %>" SelectCommand="SELECT ID, eventName, dateCreated,pin FROM voteEvents"
           DeleteCommand="DELETE FROM voteEvents WHERE (ID = @id); DELETE FROM votequestions WHERE (eventid = @id) " UpdateCommand="UPDATE voteEvents SET eventName = @eventName, pin = @pin WHERE (ID = @id)" 
           ProviderName="<%$ ConnectionStrings:sql12347806ConnectionString.ProviderName %>">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="eventName" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

      <form runat="server" style ="margin-left:auto; margin-right:auto">
               
                <label class="search" style="color:black">Search Event:</label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="searchinput"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />   
                  <div style= "float: right;" >
        <asp:Button ID="button2" Width ="200px" runat="server" OnClick="btnCreateEvent" Text="Create Event" />
        </div>
               
        <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
        <h2 class="tm-block-title">Event Questions</h2>          
        <asp:GridView ID="GridView1" class="table" runat="server" AutoGenerateColumns="False"  
            OnRowCommand="GridView1_OnRowCommand" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="Black" AllowPaging="True" GridLines="None" RowStyle-BackColor="white" >
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" ReadOnly="True" InsertVisible="False" />
               <asp:TemplateField HeaderText="EVENT NAME">
                          <ItemTemplate>  
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("eventName") %>'></asp:Label>  
                    </ItemTemplate> 
                      <EditItemTemplate>  
                           <asp:TextBox ID="tbeventName" runat="server" Text='<%# Bind("eventName") %>'></asp:TextBox> 
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbeventName" ForeColor="Red" ErrorMessage="Event Name can't be blanked"></asp:RequiredFieldValidator>                           
                          </EditItemTemplate>

                          </asp:TemplateField>
                  <asp:BoundField DataField="pin" HeaderText="PIN" SortExpression="pin" ReadOnly="False" />
                <asp:BoundField DataField="dateCreated" HeaderText="DATE CREATED" SortExpression="dateCreated" ReadOnly="True" />              
                <asp:CommandField ShowDeleteButton="True">
                    <ControlStyle CssClass ="btn btn-link btn-sm" />
                    </asp:CommandField>
                <asp:CommandField ShowEditButton="True">
                    <ControlStyle CssClass ="btn btn-link btn-sm" />
                    </asp:CommandField>
               <asp:TemplateField>
                <ItemTemplate>
                     <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="ViewEvent"
                    Text="View Event" CommandArgument='<%# Eval("id") %>' />
                </ItemTemplate>
            </asp:TemplateField>
                <asp:TemplateField>
                <ItemTemplate>
                     <asp:Button ID="Button2" runat="server" CausesValidation="false" CommandName="EventResult"
                    Text="View Event Results" CommandArgument='<%# Eval("id") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            </Columns>
                <EmptyDataTemplate>
            <div style="text-align:center;" >No records found.</div>
            </EmptyDataTemplate>
       <HeaderStyle Font-Bold="True" ForeColor="black" />
<RowStyle BackColor="White"></RowStyle>
        </asp:GridView>
            <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" />  
              
                    </div>
                    
                </form>
                

</asp:Content>