<%@ Page Language="C#" AutoEventWireup="true"EnableEventValidation="false" CodeBehind="Homepage.aspx.cs" Inherits="FreedomeF.Homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../css/bootstrap-theme.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet"/>
    <link href="../css/datatables.min.css" rel="stylesheet"/>
    <script src="../js/datatables.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
 
    <style type="text/css">
        .auto-style3 {
            left: 0px;
            top: -20px;
            height: 337px;
        }
        .auto-style9 {
            position: relative;
            min-height: 1px;
            top: -20px;
            left: 0px;
            width: -2147483648%;
            float: left;
            margin-right: 37px;
            padding-left: 15px;
            padding-right: 15px;
        }
        .auto-style10 {
            text-align: center;
            color: dodgerblue;
        }
        .auto-style11 {
            width: 421px;
        }
        .auto-style12 {
            font-size: small;
        }
        .auto-style13 {
            width: 308px;
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
      <li class="active"><a href="Homepage.aspx">Trang chủ</a></li>
        <li><asp:HyperLink ID="mystudent"  NavigateUrl="~/UI/MyStudent.aspx" CssClass="nav nav-pills" runat="server">Sinh viên đang chăm sóc</asp:HyperLink></li>
            <%--<li ><a href="Detail.aspx">Đánh Giá Chi Tiết</a></li>--%>
        
        
                                <li><asp:HyperLink ID="control"  NavigateUrl="~/UI/Control.aspx" CssClass="nav nav-pills" runat="server">Thay đổi trọng số</asp:HyperLink></li>
       <li><asp:HyperLink ID="logCare"  NavigateUrl="~/UI/UpdateNotes.aspx" CssClass="nav nav-pills" runat="server">Nhật ký chăm sóc</asp:HyperLink></li>
       <li><asp:HyperLink ID="divide"  NavigateUrl="~/UI/distribution.aspx" CssClass="nav nav-pills" runat="server">Phân công</asp:HyperLink></li>

  </ul>

</div>
               </div>
                      
             <div style="padding-left:80px;" class='col-md-3'>
               
           <div>
               <p class="auto-style13"> <asp:Button ID="btnLogOut" CssClass="btn btn-primary" runat="server" Text="Đăng xuất" OnClick="btnLogOut_Click" /><span class="auto-style12">Người dùng </span><strong><asp:Label ID="lbUserName" runat="server" Text="Label" style="font-size: large"></asp:Label>
    
               
               
                   </strong>
    
               
               
               </p>
    
  </div>      
            </div>
      </div>
         
            
             <div class ="row">
                 
            <div style="padding-top:50px; text-align:center;" class="col-md-6 col-md-offset-3">
                
            <asp:TextBox ID="tbSearch"  runat="server" CssClass="form-group input-md" placeholder="Tên /  Mssv /  Xếp loại /  Nhận xét" Height="30px" Width="568px"></asp:TextBox>
                <asp:Button ID="btnSearch" CssClass="btn btn-primary" runat="server" Text="Tìm kiếm" OnClick="btnSearch_Click" ValidationGroup="check" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbSearch" ErrorMessage="Thanh tìm kiếm trống" ForeColor="Red" SetFocusOnError="True" ValidationGroup="check"></asp:RequiredFieldValidator>
             </div>

        </div>
           
        <div style="padding-top:20px;" class="row">
            
             <div class="container">
                 
             
            <div class="row"> 
                
                    <div class="auto-style3"> 
                        <div class="panel panel-table col-md-12 "> 
                            <div class="panel-heading"> 
                                <div style="padding-top:10px;" class="row"> 
                                   <p class="auto-style11">Chọn ngày để xem thêm thông tin sinh viên <%--<asp:DropDownList ID="DropDownList1" CssClass="form-group" runat="server" AutoPostBack="True">
                                    </asp:DropDownList>--%> <asp:Calendar ID="Calendar1" runat="server" Height="134px" Width="350px"  OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" NextPrevFormat="FullMonth">
                                           <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                           <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                           <OtherMonthDayStyle ForeColor="#999999" />
                                           <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                           <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                           <TodayDayStyle BackColor="#CCCCCC" />
                                       </asp:Calendar>  <h1 class="auto-style10">Báo cáo hàng ngày</h1> </p> 
                                   
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
        <div style="padding-top:40px;padding-bottom:30px;" class="auto-style9">
        <div>
                 
            <h3 style="color:crimson">Chú Thích :</h3>
                 <ul>
                     <li>Vắng mặt hôm nay : Môn và slot học sinh bạn đang chăm sóc đã nghỉ</li>
                     <li>C/D/F : Là chỉ số xếp loại của kì trước</li>
                     <li>Bấm vào Mssv để đến xem thông tin sinh viên</li>
                     <li>Bấm vào tiêu đề để sắp xếp</li>
                    
</ul>

            </div>
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
    <script src="../js/datatables.min.js"></script>
        <script> $('#example').DataTable();</script>
    <script type="text/javascript">

        $(document).keypress(function (e) {
            if (e.which == 13) {
                return false;
            }
        });

</script>
</body>
</html>
