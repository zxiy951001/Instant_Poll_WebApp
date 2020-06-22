<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/presenter.master" AutoEventWireup="true" CodeBehind="ViewEvent.aspx.cs" Inherits="votepicker_webproj.ViewEvent" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ProviderName="<%$ ConnectionStrings:sql12.providerName%>" 
    ConnectionString="<%$ ConnectionStrings:sql12 %>" DeleteCommand="DELETE FROM votequestions WHERE id = @id" 
    InsertCommand="INSERT INTO votequestions (question, eventid, Choice1, Choice2, Choice3, Choice4) VALUES (@question, @eventid ,@Choice1, @Choice2, @Choice3, @Choice4)" 
    SelectCommand="SELECT id,question, choice1, choice2, choice3, choice4 FROM votequestions WHERE  eventid = @eventid " 
    UpdateCommand="UPDATE votequestions SET question = @question, Choice1 = @Choice1,Choice2 = @Choice2,Choice3 = @Choice3,Choice4 = @Choice4 WHERE (id = @id)" 
    >
        
	<selectparameters>
		<asp:sessionparameter name="eventid" sessionfield="eventid" type="Int32" />
	</selectparameters>

      <InsertParameters>
<asp:sessionparameter name="eventid" sessionfield="eventid" type="Int32" />
<asp:Parameter Name="question" Type="string" />
<asp:Parameter Name="Choice1" Type="string" />
<asp:Parameter Name="Choice2" Type="string"/>
<asp:Parameter Name="Choice3" Type="string" />
<asp:Parameter Name="Choice4" Type="string" />
</InsertParameters>
            <DeleteParameters>
                
            </DeleteParameters>
          
            <UpdateParameters>
                <asp:Parameter Name="question" Type="String" />
                <asp:Parameter Name="Choice1" Type="String" />
                <asp:Parameter Name="Choice2" Type="String" />
                <asp:Parameter Name="Choice3" Type="String" />
                <asp:Parameter Name="Choice4" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
   
       <div class="col-12 tm-block-col">
            <form runat="server">
         <p>
                <h5 style="color:black;">Search Questions</h5><asp:TextBox ID="TextBox1" runat="server" CssClass="searchinput"></asp:TextBox>
       
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />
                      </p>
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll" style="color: #000000">
                        <h2 class="tm-block-title">Event Questions</h2>
                       
            <asp:GridView ID="GridView1" class="table" runat="server" AutoGenerateColumns="False"  DataKeyNames="id" DataSourceID="SqlDataSource2" ForeColor="Black" AllowPaging="True" GridLines="None" RowStyle-BackColor="white" Width="800px">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" InsertVisible="False" />
                 <asp:TemplateField HeaderText="QUESTION" >
                          <ItemTemplate>  
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("question") %>'></asp:Label>  
                    </ItemTemplate> 
                      <EditItemTemplate>  
                           <asp:TextBox ID="tbquestion" runat="server" Text='<%# Bind("question") %>'></asp:TextBox> 
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbquestion" ForeColor="Red" ErrorMessage="Question can't be blanked"></asp:RequiredFieldValidator>                           
                          </EditItemTemplate>
                          </asp:TemplateField>
              <asp:TemplateField HeaderText="CHOICE 1">
                          <ItemTemplate>  
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("choice1") %>'></asp:Label>  
                    </ItemTemplate> 
                      <EditItemTemplate>  
                           <asp:TextBox ID="tbc1" runat="server" Text='<%# Bind("choice1") %>'></asp:TextBox> 
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbc1" ForeColor="Red" ErrorMessage="Choice 1 can't be blanked"></asp:RequiredFieldValidator>                           
                          </EditItemTemplate>
                          </asp:TemplateField>
                <asp:TemplateField HeaderText="CHOICE 2">
                          <ItemTemplate>  
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("choice2") %>'></asp:Label>  
                    </ItemTemplate> 
                      <EditItemTemplate>  
                           <asp:TextBox ID="tbc2" runat="server" Text='<%# Bind("choice2") %>'></asp:TextBox> 
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbc2" ForeColor="Red" ErrorMessage="Choice 2 can't be blanked"></asp:RequiredFieldValidator>                           
                          </EditItemTemplate>
                          </asp:TemplateField>
                 <asp:TemplateField HeaderText="CHOICE 3">
                          <ItemTemplate>  
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("choice3") %>'></asp:Label>  
                    </ItemTemplate> 
                      <EditItemTemplate>  
                           <asp:TextBox ID="tbc3" runat="server" Text='<%# Bind("choice3") %>'></asp:TextBox> 
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbc3" ForeColor="Red" ErrorMessage="Choice 3 can't be blanked"></asp:RequiredFieldValidator>                           
                          </EditItemTemplate>
                          </asp:TemplateField>
                <asp:TemplateField HeaderText="CHOICE 4">
                          <ItemTemplate>  
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("choice4") %>'></asp:Label>  
                    </ItemTemplate> 
                      <EditItemTemplate>  
                           <asp:TextBox ID="tbc4" runat="server" Text='<%# Bind("choice4") %>'></asp:TextBox> 
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbc4" ForeColor="Red" ErrorMessage="Choice 4 can't be blanked"></asp:RequiredFieldValidator>                           
                          </EditItemTemplate>
                          </asp:TemplateField>
               




                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField showDeleteButton="True" />
                  
            </Columns>
                <EmptyDataTemplate>
            <div style="text-align:center;" >No records found.</div>
            </EmptyDataTemplate>
       <HeaderStyle Font-Bold="True" ForeColor="Black" />

<RowStyle BackColor="White"></RowStyle>
        </asp:GridView>
                          
                    </div>
                <p></p>
                  <h5 style="color:black;">Add Questions</h5>
                <asp:TextBox ID="TextBox2"  STYLE="background-color:white;border:solid 1px black; color:black;" class="form-control" placeholder="Question" runat="server"></asp:TextBox>
                <asp:TextBox ID="TextBox3"  STYLE="background-color:white;border:solid 1px black; color:black;" class="form-control" placeholder="Choice 1"  runat="server"></asp:TextBox>
                <asp:TextBox ID="TextBox4"  STYLE="background-color:white;border:solid 1px black; color:black;"  class="form-control" placeholder="Choice 2" runat="server"></asp:TextBox>
                <asp:TextBox ID="TextBox5"  STYLE="background-color:white;border:solid 1px black; color:black;"  class="form-control" runat="server" placeholder="Choice 3"></asp:TextBox>
                <asp:TextBox ID="TextBox6"   STYLE="background-color:white;border:solid 1px black; color:black;" class="form-control" runat="server" placeholder="Choice 4"></asp:TextBox>
                <asp:Button class="btn btn-dark" style="width:100%;margin: 0 auto;position:relative;" ID="Button2" OnClick="Button2_Click" runat="server" Text="Add" />
                            
                            
                </form>
                </div>

</asp:Content>