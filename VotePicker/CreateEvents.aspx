<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/presenter.master" AutoEventWireup="true" CodeBehind="CreateEvents.aspx.cs" Inherits="votepicker_webproj.CreateEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>

.tbsize{width: 100px; height: 20px}
</style>
    
    <form runat="server" class="container-fluid" style="width:100%">
       <div class="container-fluid">
                   <div class="form-group mb-3" style="padding-bottom:30px; ">
                    <h1 style="color:black">Create Event</h1>
        </div>
            <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                   <div class="form-group mb-3">
                    <label id="testl" runat="server" for="name">Event Name</label>
                    <input id="name" runat="server" name="name" type="text" class="form-control validate" required/>
                       </div>
                <div class="form-group mb-3">
                    <label id="Label1" runat="server" for="pin">Pin(if any)</label>
                    <input id="pin" runat="server" name="pin" type="text" class="form-control validate" required/>
                       </div>
                       <div class="form-group mb-3">
                     <label>Number Of Questions:</label>                   
                           <asp:TextBox runat="server" id="question" AutoPostBack="true" OnTextChanged="quesnum" name="name" type="text" class="form-control validate tbsize"></asp:TextBox>
                           <p></p>

                           <asp:Table ID="myTable" runat="server" Width="100%" CssClass="table"> 
                        <asp:TableRow runat="server">
        <asp:TableCell runat="server">S/N</asp:TableCell>
        <asp:TableCell runat="server">Question</asp:TableCell>
        <asp:TableCell runat="server">Choice 1</asp:TableCell>
        <asp:TableCell runat="server">Choice 2</asp:TableCell>
        <asp:TableCell runat="server">Choice 3</asp:TableCell>
        <asp:TableCell runat="server">Choice 4</asp:TableCell>
    </asp:TableRow>
</asp:Table>
                <div class="form-group mb-3" style="text-align:center; padding-top:30px; ">
                     <asp:Button ID="button2" runat="server" OnClick="CreateEvent"  Text="Create Event" class="btn btn-dark" width="50%"/>
                    </div>
                  </div>
                
                  </div>
            </div>

             </form>
          
            
            

   
</asp:Content>

