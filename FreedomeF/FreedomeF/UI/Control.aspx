<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Control.aspx.cs" Inherits="FreedomeF.Archive1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .auto-style2 {
            width: 1161px;
        }
        .auto-style3 {
            width: 213px
        }
        .auto-style4 {
            font-size: small;
        }
        .auto-style5 {
            width: 851px;
        }
        .auto-style6 {
            width: 307px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <img style="width: 500px; height: 100px;" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcpRoH217iaZ9VdkMrJlSEs1RFgXjE-d-iJxJ7Aniq1V0iLkx2Cw" />
        </div>
        <hr size="30" />
        <div class="row">
            <div class='col-md-7'>
                  <div class="container">
   <ul class='nav nav-pills'>
      <li ><a href="Homepage.aspx">Trang chủ</a></li>
        <li><asp:HyperLink ID="mystudent"  NavigateUrl="~/UI/MyStudent.aspx" CssClass="nav nav-pills" runat="server">Sinh viên đang chăm sóc</asp:HyperLink></li>
            <%--<li ><a href="Detail.aspx">Đánh Giá Chi Tiết</a></li>--%>
        
        
                                <li class="active"><asp:HyperLink ID="control"  NavigateUrl="~/UI/Control.aspx" CssClass="nav nav-pills" runat="server">Thay đổi trọng số</asp:HyperLink></li>
       <li><asp:HyperLink ID="logCare"  NavigateUrl="~/UI/UpdateNotes.aspx" CssClass="nav nav-pills" runat="server">Nhật ký chăm sóc</asp:HyperLink></li>
       <li><asp:HyperLink ID="divide"  NavigateUrl="~/UI/distribution.aspx" CssClass="nav nav-pills" runat="server">Phân công</asp:HyperLink></li>

  </ul>

</div>
            </div>
                      <div class='col-md-3'>
               
           <div style="padding-left:80px;">
              <p class="auto-style6"> <asp:Button ID="logOut" CssClass="btn btn-primary" runat="server"  Text="Đăng xuất" OnClick="logOut_Click1" /> 
                   <span class="auto-style4">Người dùng </span> <strong> <asp:Label ID="lbUserName" runat="server" Text="Label" style="font-size: large"></asp:Label>
                  </strong>
               </p>
    
  </div>      
            </div>


        </div>
        
    
       
        <div style="padding-top: 100px;" class="row">
            <div class="col-md-6 col-md-offset-3">
                <div>
                    <h1 class="auto-style2">Quản lý và thay đổi trọng số công thức xếp loại</h1>
                </div>


                <div class="dropdown">
                    <ul class="dropdown-menu">
                        <li><a href="#">10 A</a></li>
                        <li><a href="#">10 B</a></li>
                        <li><a href="#">10 C</a></li>
                    </ul>
                                <div style="width: 340px">

                              <asp:Label ID="lbNoitice" runat="server" Text="     Bạn có thể thay đổi hệ số % công thức tính xếp loại !" ForeColor="Red" style="font-style: italic"></asp:Label>

                                </div>
                          <div class="auto-style5">
                              
                              <asp:Label ID="lbMark" runat="server" Text="% Điểm GPA"></asp:Label>
                              <asp:TextBox ID="tbMark" runat="server" Width="27px"></asp:TextBox>
                                <asp:Label ID="lbBehavior" runat="server" Text="% Hành Vi"></asp:Label>
                                <asp:TextBox ID="tbBehavior" runat="server" Width="32px"></asp:TextBox>
                                <asp:Label ID="lbAttendace" runat="server" Text="% Điểm Danh"></asp:Label>
                                <asp:TextBox ID="tbAttendance" runat="server" Width="29px"></asp:TextBox>
                                <asp:Label ID="lbFailcourse" runat="server" Text="% Môn nợ"></asp:Label>
                                <asp:TextBox ID="tbFailcourse" runat="server" Width="31px"></asp:TextBox>

                              <asp:Button ID="changeRate" ValidationGroup="check" Style="padding-left:20px; height: 36px;" CssClass="btn btn-primary" runat="server" Text="Thay đổi" OnClick="changeRate_Click" />
                              
<asp:Label ID="lbNoitice2" runat="server" ForeColor="Red"></asp:Label>
                                
                              
                              <asp:Label ID="lbSuccess" runat="server" ForeColor="#009933"></asp:Label>
                                
                              
                          </div>
                                
                              
                </div>
               
                 <div style="padding-left:20px;">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="check" runat="server" ControlToValidate="tbMark" Display="Dynamic" ErrorMessage="% GPA Trống" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="check" runat="server" ControlToValidate="tbBehavior" Display="Dynamic" ErrorMessage="% Hành Vi Trống" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="check" runat="server" ControlToValidate="tbAttendance" Display="Dynamic" ErrorMessage="% Điểm danh Trống" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="check" runat="server" ControlToValidate="tbFailcourse" Display="Dynamic" ErrorMessage="% Môn nợ Trống" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbMark" ErrorMessage="% GPA là số" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^\d+$" ValidationGroup="check"></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbBehavior" ErrorMessage="% Hành vi là số" ForeColor="#FF3300" SetFocusOnError="True" ValidationExpression="^\d+$" ValidationGroup="check"></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tbAttendance" ErrorMessage="% Điểm danh là số" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^\d+$" ValidationGroup="check"></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="tbFailcourse" ErrorMessage="% Môn nợ là số" ForeColor="Red" ValidationExpression="^\d+$" ValidationGroup="check"></asp:RegularExpressionValidator>

            </div>
            </div> <div class="col-md-6 col-md-offset-3">
                    <table>
                        <tr>
                            <td style="text-align:right"class="auto-style3">
                                <asp:Label ID="lbGpa" runat="server" Text="Trọng số Gpa hiện tại: "></asp:Label>
                            </td>
                            <td style="text-align:left;">
                                <strong>
                                <asp:Label ID="lbGpa2" runat="server" Text=""></asp:Label>
                                </strong>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:right" class="auto-style3">
                                <asp:Label ID="lbBe" runat="server" Text="Trọng số hành vi hiện tại: "></asp:Label>
                            </td>
                            <td style="text-align:left;">
                                <strong>
                                <asp:Label ID="lbBe2" runat="server" Text=""></asp:Label>
                                </strong>
                            </td>
                        </tr>
                          <tr>
                            <td style="text-align:right" class="auto-style3">
                                <asp:Label ID="lbFail" runat="server" Text="Trọng số môn nợ hiện tại: "></asp:Label>
                            </td>
                            <td style="text-align:left;">
                                <strong>
                                <asp:Label ID="lbFail2" runat="server" Text=""></asp:Label>
                                </strong>
                            </td>
                        </tr>
                         <tr>
                            <td style="text-align:right" class="auto-style3">
                                <asp:Label ID="lbAttent" runat="server" Text="Trọng số điểm danh hiện tại: "></asp:Label>
                            </td>
                            <td style="text-align:left;">
                                <strong>
                                <asp:Label ID="lbAttent2" runat="server" Text=""></asp:Label>
                                </strong>
                            </td>
                        </tr>
                    </table>
                </div>
           
        </div>
              <div class="row">
          <div class="col-md-12">
            <div style="padding-top: 400px;">
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
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</body>
</html>
