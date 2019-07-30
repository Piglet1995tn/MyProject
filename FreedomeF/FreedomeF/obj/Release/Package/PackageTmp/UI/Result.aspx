<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="FreedomeF.UI.Result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <link rel="stylesheet" href="../css/bootstrap-theme.min.css"/>
    <link href="../css/bootstrap.min.css" rel="stylesheet"/>
    <style type="text/css">
        .auto-style1 {
            margin-right: -15px;
            margin-left: -15px;
            height: 273px;
        }
        .auto-style2 {
            width: 303px;
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
      <li><a href="Homepage.aspx">Trang chủ</a></li>
        <li><asp:HyperLink ID="mystudent"  NavigateUrl="~/UI/MyStudent.aspx" CssClass="nav nav-pills" runat="server">Sinh viên đang chăm sóc</asp:HyperLink></li>
            <%--<li ><a href="Detail.aspx">Đánh Giá Chi Tiết</a></li>--%>
        
      <li><asp:HyperLink ID="control"  NavigateUrl="~/UI/Control.aspx" CssClass="nav nav-pills" runat="server">Thay đổi trọng số</asp:HyperLink></li>
       <li><asp:HyperLink ID="logCare"  NavigateUrl="~/UI/UpdateNotes.aspx" CssClass="nav nav-pills" runat="server">Nhật ký chăm sóc</asp:HyperLink></li>
       <li><asp:HyperLink ID="divide"  NavigateUrl="~/UI/distribution.aspx" CssClass="nav nav-pills" runat="server">Phân công</asp:HyperLink></li>

  </ul>

</div>
               </div>
                      <div class='col-md-3'>
                 </div>
            <div style="padding-left:80px;" class='col-md-3'>
               
           <div>
               <p class="auto-style2"><asp:Button ID="btnLogOut" CssClass="btn btn-primary" runat="server" Text="Đăng xuất" OnClick="btnLogOut_Click" />Người dùng 
                   <strong><asp:Label ID="lbUserName" runat="server" Text="Label" style="font-size: large"></asp:Label>
    
                   </strong>
    
               </p>
    
  </div>      
            </div>
      </div>
        <div class ="row">
            <div style="padding-top:50px;" class="col-md-6 col-md-offset-3">
            <asp:TextBox ID="tbSearch" runat="server" CssClass="form-group input-md"  placeholder="Tên /  Mssv /  Xếp loại /  Nhận xét" Height="30px" Width="568px"></asp:TextBox>
                <asp:Button ID="btnSearch" CssClass="btn btn-primary" runat="server" ValidationGroup="search" Text="Tìm Kiếm" OnClick="btnSearch_Click" />
 
                </div>
        </div>
         <div class="auto-style1">
             <div style="padding-top:50px;" class="col-md-6 col-md-offset-3">
                 <div style="padding-bottom:20px;"><asp:Label ID="lbResult" runat="server" ForeColor="Red" style="font-size: large; font-weight: 700; font-style: italic"></asp:Label>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbSearch" ValidationGroup="search" ErrorMessage="Thanh tìm kiếm trống" ForeColor="Red"></asp:RequiredFieldValidator>
                 </div>
            </div>
             <div class="col-md-6 col-md-offset-3">
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  CellPadding="5" GridLines="Horizontal" Height="82px"  AllowPaging="True" BackColor="White" BorderColor="#336666"  BorderWidth="3px" OnPageIndexChanging="GridView1_PageIndexChanging">
                         <Columns>
                        
                        <asp:HyperLinkField DataTextField="studentId" InsertVisible="False" DataNavigateUrlFields="studentId"   DataNavigateUrlFormatString="~/UI/Profile.aspx?studentID={0}" HeaderText="Mssv" SortExpression="studentID" />
                             <asp:BoundField DataField="studentName" HeaderText="Tên"  ReadOnly="True" SortExpression="studentName"/>
                        <asp:BoundField DataField="rankName" HeaderText="Xếp Loại"  ReadOnly="True" SortExpression="rankName" /> 
                              <asp:BoundField DataField="content" HeaderText="Nhận xét"  ReadOnly="True" SortExpression="content" /> 
                              <asp:BoundField DataField="date" HeaderText="Ngày"  ReadOnly="True" SortExpression="date" /> 
                             
                                            </Columns>
               <FooterStyle BackColor="White" ForeColor="#333333" />
               <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
               <RowStyle BackColor="White" ForeColor="#333333" />
               <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
               <SortedAscendingCellStyle BackColor="#F7F7F7" />
               <SortedAscendingHeaderStyle BackColor="#487575" />
               <SortedDescendingCellStyle BackColor="#E5E5E5" />
               <SortedDescendingHeaderStyle BackColor="#275353" />
           </asp:GridView>
                 </div>

        </div>
    
           
    </form> 
       <div style="margin-top:350px;" class="row footer">
            <div >
                <div style="margin-left:20px;">
                    <b>Mọi góp ý, thắc mắc xin liên hệ:</b> Freedom Group&nbsp; Facebook: <a href="https://www.facebook.com/anh.tu.9597">Anh Tú</a> Điện thoại: <b>01632489257</b> 
                </div>
            </div>
            <div style="text-align:center;" class="panel-footer">
                  © Powered by <a href="#">FPT University </a>| <a href="http://fap.fpt.edu.vn">FAP</a>   
            </div>

        </div><script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script type="text/javascript">

    $(document).keypress(function(e) {
        if (e.which == 13) {
            return false;
        }
    });

</script>
     </body>
</html>
