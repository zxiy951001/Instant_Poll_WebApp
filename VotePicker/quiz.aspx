<%@ Page Title="" Language="C#" MasterPageFile="~/quiz.Master" AutoEventWireup="true" CodeBehind="quiz.aspx.cs" Inherits="votepicker_webproj.quiz" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ProviderName="<%$ ConnectionStrings:sql12.providerName%>" 
    ConnectionString="<%$ ConnectionStrings:sql12 %>" DeleteCommand="DELETE FROM votequestions WHERE pin = @pin" 
    InsertCommand="INSERT INTO votequestions (question, eventid, Choice1, Choice2, Choice3, Choice4) VALUES (@question, @eventid ,@Choice1, @Choice2, @Choice3, @Choice4)" 
    SelectCommand="SELECT ID,eventName, dateCreated FROM voteEvents WHERE  pin = @pin " 
    UpdateCommand="UPDATE votequestions SET question = @question, Choice1 = @Choice1,Choice2 = @Choice2,Choice3 = @Choice3,Choice4 = @Choice4 WHERE (id = @id)" 
    >
        
	<selectparameters>
		<asp:sessionparameter name="pin" sessionfield="pin" type="string" />
	</selectparameters>

      <InsertParameters>

</InsertParameters>
            <DeleteParameters>
                
            </DeleteParameters>
          
            <UpdateParameters>
    
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

