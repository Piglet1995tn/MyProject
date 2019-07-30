<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyStudent.aspx.cs" Inherits="FreedomeF.Overview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no"/>
    <title></title>
        <link rel="stylesheet" href="../css/bootstrap-theme.min.css"/>
    <link href="../css/datatables.min.css" rel="stylesheet"/>
    <link href="../css/bootstrap.min.css" rel="stylesheet"/>
    <style type="text/css">
        .auto-style1 {
            width: 233px;
        }
        .auto-style2 {
            width: 302px;
        }
        .auto-style3 {
            width: 297px;
        }
        .auto-style4 {
            font-size: small;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
         <div>
            <img style="width:500px;height:100px;" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcpRoH217iaZ9VdkMrJlSEs1RFgXjE-d-iJxJ7Aniq1V0iLkx2Cw"/>
        </div>
         <hr size="30"/>
        <div class="row">
           <div class='col-md-6'>		
          <div class="container">
   <ul class='nav nav-pills'>
      <li ><a href="Homepage.aspx">Trang chủ</a></li>
        <%--<li class="active"><a href="Overview.aspx">Sinh viên đang chăm sóc</a></li>--%>
        <li class="active"><asp:HyperLink ID="mystudent"  NavigateUrl="~/UI/MyStudent.aspx" CssClass="nav nav-pills" runat="server">Sinh viên đang chăm sóc</asp:HyperLink></li>
            <%-- <li ><a href="Detail.aspx">Đánh Giá Chi Tiết</a></li>--%>        <%--<li><a href="Archive.aspx">Lưu Trữ</a></li>--%>
         <li><asp:HyperLink ID="control"  NavigateUrl="~/UI/Control.aspx" CssClass="nav nav-pills" runat="server">Thay đổi trọng số</asp:HyperLink></li>
       <li><asp:HyperLink ID="logCare"  NavigateUrl="~/UI/UpdateNotes.aspx" CssClass="nav nav-pills" runat="server">Nhật Kí Chăm Sóc</asp:HyperLink></li>
       <li><asp:HyperLink ID="divide"  NavigateUrl="~/UI/distribution.aspx" CssClass="nav nav-pills" runat="server">Phân Công</asp:HyperLink></li>

  </ul>

</div>
               </div>
                     
             <div style="padding-left:80px;" class='col-md-3'>
               
           <div>
               <p class="auto-style2"><asp:Button ID="btnLogOut" CssClass="btn btn-primary" runat="server" Text="Đăng xuất" OnClick="btnLogOut_Click" /><span class="auto-style4">Người dùng </span> <strong>
                   <asp:Label ID="lbUserName" runat="server" Text="Label" style="font-size: large"></asp:Label>
    
                
               
                   </strong>
    
                
               
               </p>
    
  </div>      
            </div>
           
      </div>
             <div class ="row">
                 
            <div style="padding-top:50px; text-align:center;" class="col-md-6 col-md-offset-3">
            <asp:TextBox ID="tbSearch"  runat="server" CssClass="form-group input-md"  placeholder="Tên /  Mssv /  Xếp loại /  Nhận xét" Height="30px" Width="568px"></asp:TextBox>
                <asp:Button ID="btnSearch" CssClass="btn btn-primary" runat="server" Text="Tìm kiếm" OnClick="btnSearch_Click" ValidationGroup="check" />
 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbSearch" ErrorMessage="Thanh tìm kiếm trống" ForeColor="Red" SetFocusOnError="True" ValidationGroup="check"></asp:RequiredFieldValidator>
 
             </div>
        </div>

      
            <div style="padding-top:60px;" class="row">
             <div class="container">
                
            <div class="row"> 
                <div class="col-md-12"> 
                <h1 class="text-center" style="color:blue">Danh sách sinh viên đang chăm sóc</h1> 
                     
                        <div class="panel panel-info panel-table"> 
                            <div class="panel-heading"> 
                                <div class="row"> 
                                    <div class="col col-xs-6"> 
                                    </div>                            
                                </div> 
                            </div> 
                            <div class="panel-body"> 
                                
                              
                                <asp:Panel ID="Panel1" runat="server" >
                                </asp:Panel>
                              
                            </div> 
                           
                        </div> 
                    </div> 
                </div>
        </div>
            </div>     
                
        
        
            </form>
        <div class="col-md-2">

            <h3 style="color:crimson;padding-left:30px;">Chú Thích :</h3>
            <ul>
                <li class="auto-style1">A /B / C là xếp loại của sinh viên</li>
                <li class="auto-style2">Xếp loại sinh viên dựa trên các hệ số cung cấp</li>
                <li class="auto-style3">Bấm vào MSSV để đến trang cá nhân</li>
                <li class="auto-style3">Các <span style='color:red;' class='glyphicon'>&#xe094;</span><span style='color:green;' class='glyphicon'>&#xe093;</span> hiển thị so sánh chỉ số 2 kì liên tiếp </li>
                <li class="auto-style3">Bấm vào tiêu đề để sắp xếp</li>
            </ul>
                 
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
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    
  
    <script src="../js/datatables.min.js"></script>
    <script> $('#overview').DataTable();</script>
  <script type="text/javascript">

    $(document).keypress(function(e) {
        if (e.which == 13) {
            return false;
        }
    });

</script>

</body>
</html>
