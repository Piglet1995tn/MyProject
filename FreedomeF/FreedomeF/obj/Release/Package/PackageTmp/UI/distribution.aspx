<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="distribution.aspx.cs" Inherits="FreedomeF.UI.distribution" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <link rel="stylesheet" href="../css/bootstrap-theme.min.css"/>
     <link href="../css/datatables.min.css" rel="stylesheet"/>
    <link href="../css/bootstrap.min.css" rel="stylesheet"/>
    <style type="text/css">
        .auto-style1 {
            width: 470px;
        }
        .auto-style2 {
            font-size: small;
        }
        .auto-style3 {
            width: 304px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
                <div>

              <img style="width:500px;height:100px;" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcpRoH217iaZ9VdkMrJlSEs1RFgXjE-d-iJxJ7Aniq1V0iLkx2Cw"/>
        </div>
         <hr size="30" />
        <div class="row">
           <div class='col-md-6'>		
        <div class="container">
   <ul class='nav nav-pills'>
      <li ><a href="Homepage.aspx">Trang chủ</a></li>
        <li><asp:HyperLink ID="mystudent"  NavigateUrl="~/UI/MyStudent.aspx" CssClass="nav nav-pills" runat="server">Sinh viên đang chăm sóc</asp:HyperLink></li>
           
        
        
                                <li><asp:HyperLink ID="control"  NavigateUrl="~/UI/Control.aspx" CssClass="nav nav-pills" runat="server">Thay đổi trọng số</asp:HyperLink></li>
       <li><asp:HyperLink ID="logCare"  NavigateUrl="~/UI/UpdateNotes.aspx" CssClass="nav nav-pills" runat="server">Nhật ký chăm sóc</asp:HyperLink></li>
       <li class="active"><asp:HyperLink ID="divide"  NavigateUrl="~/UI/distribution.aspx" CssClass="nav nav-pills" runat="server">Phân công</asp:HyperLink></li>

  </ul>

</div>
               </div>
            
                 <div style="padding-left:80px;" class='col-md-3'>
               
           <div>
               <p class="auto-style3"><asp:Button ID="btnLogout" CssClass="btn btn-primary" runat="server" Text="Đăng xuất" OnClick="logOut_Click" /><span class="auto-style2">Người dùng </span><strong>
                   <asp:Label ID="lbUserName" runat="server" Text="Label" style="font-size: large"></asp:Label>
    
                   </strong>
    
                
               
               </p>
    
  </div>      
            </div>
      </div>
        <div class="row">
            <div style="padding-top:100px;" class="col-md-6 col-md-offset-3">
                <p style="color:red;" class="auto-style1">Click vào MSSV để chọn / thay đổi&nbsp; nhân viên chăm sóc sinh viên</p>
                <h2>Danh sách sinh viên cần chăm sóc </h2>
                 <asp:Button ID="btnReUpdate" CssClass="btn btn-primary" runat="server" Text="Lấy danh sách sinh viên" OnClick="btnReUpdate_Click" />
                <asp:Button ID="btnRecomment" runat="server" OnClick="btnRecomment_Click" CssClass="btn btn-primary" Text="Gợi ý phân công chăm sóc" Enabled="False" />
               
                
                
                <asp:Label ID="lbError" runat="server" ForeColor="Red"></asp:Label>
               
                
                
            </div>
        </div>
       
        
        

                
        <div class="col-md-6 col-md-offset-3"> 
            <asp:Panel ID="Panel1" runat="server">
                </asp:Panel></div>
        
        <div  class="col-md-6 col-md-offset-3">
            <div>
            <h2>Danh sách sinh viên cũ / có tiến bộ</h2>
        </div>
             <asp:Panel ID="Panel2" runat="server">
                </asp:Panel>
        </div>
               
        
             <div class="row">
          <div class="col-md-12">
            <div style="padding-top: 150px;">
                <div style="margin-left: 20px;">
                    <b>Mọi góp ý, thắc mắc xin liên hệ:</b> Freedom Group&nbsp; Facebook: <a href="https://www.facebook.com/anh.tu.9597">Anh Tú</a> Điện thoại: <b>01632489257</b>
                   

                </div>
            </div>
            <div style="text-align: center;" class="footer">
                © Powered by <a href="#">FPT University </a>| <a href="http://fap.fpt.edu.vn">FAP</a>  
            </div>

</div>

        </div>

    </form>
        </body> <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/datatables.min.js"></script>
    <script> $('#list1').DataTable();</script>
    <script> $('#list2').DataTable();</script>
</html>
