<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="UpdateNotes.aspx.cs" Inherits="FreedomeF.UpdateNotes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
           <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no"/>
     <link rel="stylesheet" href="../css/bootstrap-theme.min.css"/>
    <link href="../css/bootstrap.min.css" rel="stylesheet"/>
    <link href="../css/datatables.min.css" rel="stylesheet"/>
    
    <style type="text/css">
        .auto-style1 {
            font-size: small;
        }
        .auto-style2 {
            width: 302px;
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
            <%--<li ><a href="Detail.aspx">Đánh Giá Chi Tiết</a></li>--%>
        
        
                                <li><asp:HyperLink ID="control"  NavigateUrl="~/UI/Control.aspx" CssClass="nav nav-pills" runat="server">Thay đổi trọng số</asp:HyperLink></li>
       <li class="active"><asp:HyperLink ID="logCare"  NavigateUrl="~/UI/UpdateNotes.aspx" CssClass="nav nav-pills" runat="server">Nhật ký chăm sóc</asp:HyperLink></li>
       <li><asp:HyperLink ID="divide"  NavigateUrl="~/UI/distribution.aspx" CssClass="nav nav-pills" runat="server">Phân công</asp:HyperLink></li>

  </ul>

</div>
               </div>
                          <div style="padding-left:80px;" class='col-md-3'>
           <div>
               <p class="auto-style2"><asp:Button ID="btnLogOut" CssClass="btn btn-primary" runat="server" Text="Đăng xuất" OnClick="btnLogOut_Click" /><span class="auto-style1">Người dùng 
                   </span>&nbsp;<strong><asp:Label ID="lbUserName" runat="server" Text="Label" style="font-size: large"></asp:Label>
    
                
               
                   </strong>
    
                
               
               </p>
    
  </div>      
            </div>
      
            </div>
        <div class="row">
            
            </div>
        <div style="padding-top:50px;">
            <div class="panel panel-info panel-table  col-md-10 col-md-offset-1"> 
                            <div class="panel-heading"> 
                                <div class="row"> 
                                    <div class="col col-xs-6"> 
                                    </div>                            
                                        <h3 style="text-align:center;" >Nhật kí chăm sóc</h3> 
                                </div> 
                            </div> 
                            <div class="panel-body"> 
                                <asp:Panel ID="Panel3" runat="server">
                                    </asp:Panel>
                            </div> 
                            <div class="panel-footer"> 
                               
                            </div> 
                        </div> 
            </div>
             
    </form> <div style=" padding-bottom:0;" class="row">
          <div class="col-md-12">
            <div >
                <div style="margin-left: 20px;">
                     <b>Mọi góp ý, thắc mắc xin liên hệ:</b> Freedom Group&nbsp; Facebook: <a href="https://www.facebook.com/anh.tu.9597">Anh Tú</a> Điện thoại: <b>01632489257</b>

                </div>
            </div>
            <div style="text-align: center;" class="footer">
              © Powered by <a href="#">FPT University </a>| <a href="http://fap.fpt.edu.vn">FAP</a>  
            </div>

</div>

        </div>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/datatables.min.js"></script>
    <script> $('#example').DataTable();</script>
</body>
</html>
