<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FreedomeF.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="../css/bootstrap-theme.min.css"/>
    <link href="../css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <img style="width:500px;height:100px;" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcpRoH217iaZ9VdkMrJlSEs1RFgXjE-d-iJxJ7Aniq1V0iLkx2Cw"/>
        </div>
        <div class="container">
            <div class="row">   
                <div class="col-md-4 col-md-offset-4">
                    <hr size="30" />
                    <h2><span class="label label-default btn-warning">Cán bộ ĐH-FPT</span></h2>
                <div class="panel panel">
                    

                    <div class="panel-heading">
                        
                    </div>
                    <div class="panel-body">

                       <div>
                           <asp:DropDownList ID="drpSelectCampus" CssClass=" form-control-static"  runat="server" Height="28px" style="margin-left: 0" Width="157px">
                               <asp:ListItem>Hòa Lạc</asp:ListItem>
                           </asp:DropDownList>
                          <asp:Button ID="loginButton" runat="server" CssClass="btn btn-primary" Text="Đăng Nhập" OnClick="loginButton_Click1" />
                           
                        </div>
                    </div>           
                    <span style="padding-left:5px">
                    <strong>
                    <asp:Label ID="lbNoitice" runat="server" ForeColor="#FF3300"></asp:Label>
                    </strong>
                    </span>           
                </div>    
            </div>
                </div>
            </div>
            <div class="container">
                <hr style="margin-top:20px;"  />
                <div  class="row">
                    <div class="col-md-12">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="https://c1.staticflickr.com/6/5780/22365129566_da8e4064fa_b.jpg" alt="Los Angeles" style="width:100%;height:500px"/>
      </div>

      <div class="item">
        <img src="https://c2.staticflickr.com/8/7465/16122297496_150c2a2475_b.jpg" alt="Chicago" style="width:100%;height:500px"/>
      </div>
    
      <div class="item">
        <img src="https://c2.staticflickr.com/8/7440/16471723561_d8d44fb4ae_b.jpg" alt="New york" style="width:100%;height:500px"/>
      </div>
    </div>

    <!-- Left and right controls -->
   
  </div>
</div>
                    </div>
                </div>
           
          
           <div  class="row">
            <div style="padding-top:80px;">
                <div style="margin-left:20px;">
                     <b>Mọi góp ý, thắc mắc xin liên hệ:</b> Freedom Group&nbsp; Facebook: <a href="https://www.facebook.com/anh.tu.9597">Anh Tú</a> Điện thoại: <b>01632489257</b>
                </div>
            </div>
            <div style="text-align:center;" class="panel-footer">
             © Powered by <a href="#">FPT University </a>| <a href="http://fap.fpt.edu.vn">FAP</a>  
            </div>

        </div>
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</body>
</html>
