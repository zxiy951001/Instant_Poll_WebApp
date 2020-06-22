<%@ Page Title="" Language="C#" MasterPageFile="~/quiz.Master" AutoEventWireup="true" CodeBehind="enterPin.aspx.cs" Inherits="votepicker_webproj.enterPin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Enter PIN (If Any)"></asp:Label>
    <form runat="server">
         <p>
       <asp:TextBox ID="TextBox1" runat="server" CssClass="searchinput"></asp:TextBox>
                                     <p></p>
        <asp:Button class="btn btn-dark" style="width:25%;margin: 0 auto;position:relative;" ID="Button2" OnClick="Button2_Click" runat="server" Text="Submit" />
                                      <p></p>

        <asp:Label ID="Label2" runat="server" Text="Click here for quiz without PINS"></asp:Label>
                                            
                 
            <a href="QuizNoPin.aspx" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
               Go!
               
              </p>
            </a>
  
          
          
                                        <p>
                                      <a class="txt1" runat="server" id="errtext"/>			
    </form>
</asp:Content>
