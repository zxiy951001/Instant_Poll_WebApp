<%@ Page Title="" Language="C#" MasterPageFile="~/quiz.Master" AutoEventWireup="true" CodeBehind="QuizNoPin.aspx.cs" Inherits="votepicker_webproj.QuizNoPin" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sql12347806ConnectionString %>" SelectCommand="SELECT ID, eventName, dateCreated FROM voteEvents WHERE(pin IS NULL)"
           DeleteCommand="DELETE FROM voteEvents WHERE (ID = @id); DELETE FROM votequestions WHERE (eventid = @id) " UpdateCommand="UPDATE voteEvents SET eventName = @eventName, pin = @pin WHERE (ID = @id)" 
           ProviderName="<%$ ConnectionStrings:sql12347806ConnectionString.ProviderName %>">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="eventName" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>


    <form runat="server">
   <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
    <asp:GridView ID="GridView1" class="table" runat="server" AutoGenerateColumns="False"  DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="Black" AllowPaging="True" GridLines="None" RowStyle-BackColor="white"
              OnRowCommand="GridView1_RowCommand" style ="width:750px" >
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="id" InsertVisible="False" />
                <asp:BoundField DataField="eventName" HeaderText="EVENT NAME" SortExpression="eventName" ReadOnly="True" />
                <asp:BoundField DataField="dateCreated" HeaderText="DATE CREATED" SortExpression="dateCreated" />
                 <asp:TemplateField HeaderText="">
                <ItemTemplate>
                     <asp:Button ID="Button2" runat="server" CausesValidation="false" CommandName="voting"
                    Text="Vote Event"  BorderStyle="None" CommandArgument='<%# Eval("ID") %>' />
                </ItemTemplate>
            </asp:TemplateField>             
            </Columns>
       <HeaderStyle Font-Bold="True" ForeColor="white" />

        <RowStyle BackColor="white"></RowStyle>
                 <EmptyDataTemplate>
            <div style="text-align:center;" >No records found.</div>
            </EmptyDataTemplate>
        </asp:GridView>
         </form>
    
</div>
            </asp:Content>

