<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="FreedomeF.Profile1" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />
    <link rel="stylesheet" href="../css/bootstrap-theme.min.css" />
    <link href="../css/datatables.min.css" rel="stylesheet" />

    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style8 {
            width: 53px;
        }

        .auto-style12 {
            width: 208px;
            height: 15px;
        }

        .auto-style14 {
            width: 212px;
        }

        .auto-style16 {
            display: block;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            width: 453px;
            height: 93px;
            margin-top: 0;
        }

        .auto-style36 {
            width: 121px;
            height: 15px;
        }

        .auto-style41 {
            width: 124px;
            height: 15px;
        }

        .auto-style42 {
            width: 119px;
            height: 15px;
        }

        .auto-style47 {
            font-size: small;
        }

        .auto-style48 {
            margin-top: 10px;
        }

        .auto-style51 {
            width: 254px;
            height: 291px;
        }

        .auto-style53 {
            width: 129px;
            height: 15px;
        }

        .auto-style57 {
            width: 241px;
            height: 284px;
        }

        .auto-style63 {
            width: 56px;
            height: 15px;
        }

        .auto-style66 {
            width: 494px;
        }

        .auto-style67 {
            width: 123px;
            height: 15px;
        }

        .auto-style68 {
            width: 117px;
            height: 15px;
        }

        .auto-style69 {
            height: 250px;
            width: 212px;
        }

        .auto-style72 {
            width: 59px;
            height: 15px;
        }

        .auto-style73 {
            width: 52px;
        }

        .auto-style74 {
            width: 58px;
        }

        .auto-style75 {
            width: 57px;
            height: 15px;
        }

        .auto-style76 {
            width: 477px;
        }

        .auto-style77 {
            width: 507px;
        }

        .auto-style78 {
            width: 77px;
            height: 15px;
        }

        .auto-style87 {
            width: 52px;
            height: 15px;
        }

        .auto-style88 {
            height: 15px;
        }

        .auto-style89 {
            width: 56px;
            height: 15px;
        }

        .auto-style90 {
            width: 52px;
            height: 15px;
        }

        .auto-style91 {
            height: 11px;
        }

        .auto-style92 {
            width: 392px;
        }

        .auto-style93 {
            width: 852px;
            padding-left:40px;
        }

        .auto-style94 {
            width: 68px;
            font-size: x-small;
        }
        .auto-style95 {
            width: 75px;
            height: 15px;
        }
        .auto-style96 {
            width: 127px;
            height: 14px;
        }
        .auto-style97 {
            width: 127px;
            height: 15px;
        }
        .auto-style99 {
            width: 67px;
            height: 15px;
        }
        .auto-style101 {
            width: 206px;
            height: 15px;
        }
        .auto-style102 {
            width: 207px;
            height: 15px;
        }
        .auto-style103 {
            height: 15px;
            width: 243px;
        }
        .auto-style104 {
            width: 304px;
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
                        <li><a href="Homepage.aspx">Trang chủ</a></li>
                         <li><asp:HyperLink ID="mystudent"  NavigateUrl="~/UI/MyStudent.aspx" CssClass="nav nav-pills" runat="server">Sinh viên đang chăm sóc</asp:HyperLink></li>
                        <%--<li><a href="Detail.aspx">Đánh Giá Chi Tiết</a></li>--%>                        <%--<li><a href="Archive.aspx">Lưu Trữ</a></li>--%>
                        <li>
                            <asp:HyperLink ID="control" NavigateUrl="~/UI/Control.aspx" CssClass="nav nav-pills" runat="server">Thay đổi trọng số</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="logCare" NavigateUrl="~/UI/UpdateNotes.aspx" CssClass="nav nav-pills" runat="server">Nhật ký chăm sóc</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="divide" NavigateUrl="~/UI/distribution.aspx" CssClass="nav nav-pills" runat="server">Phân công</asp:HyperLink></li>

                    </ul>

                </div>
            </div>
         
            
            <div style="padding-left: 80px;" class='col-md-3'>
                <div>
                    <p class="auto-style104">
                         <asp:Button ID="btnLogOut" CssClass="btn btn-primary" runat="server" Text="Đăng xuất" OnClick="btnLogOut_Click" /> <span class="auto-style47">Người dùng </span> 
                        <asp:Label ID="lbUserName" runat="server" Text="Label" Style="font-weight: 700; font-size: large"></asp:Label>
                        
                    </p>
                  

                </div>


            </div>
       

        </div>

      

        <div style="padding-top: 10px;" class='row'>
            <h1 style="padding-left: 40px;"><strong>Hồ sơ sinh viên</strong></h1>

            <hr size="40px;" />
            <div class="col-md-3">
                <div style="padding-left: 20px;" class="card">
                    <%-- <img  src="https://vignette.wikia.nocookie.net/fastandfurious/images/0/02/Jason_Statham.jpg/revision/latest?cb=20150507190455" alt="Card image cap" />--%>
                    <asp:Image class="auto-style69" ID="stImage" runat="server" />
                    <div class="auto-style14">
                        <table class="auto-style57">
                            <tr>
                                <td style="text-align: right;" class="auto-style87">
                                    <h5 class="auto-style8"><strong>Mssv:</strong></h5>
                                </td>
                                <td style="text-align: left;" class="auto-style88">
                                    <asp:Label ID="rollnumb" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;" class="auto-style90">
                                    <h5 class="auto-style89"><strong>Tên :</strong></h5>
                                </td>
                                <td style="text-align: left;" class="auto-style91">
                                    <asp:Label ID="name" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;" class="auto-style87">
                                    <p class="auto-style78">
                                        <strong>Ngày sinh :
                                    </strong>
                                    </p>
                                </td>
                                <td style="text-align: left;" class="auto-style88">
                                    <asp:Label ID="dob" runat="server" Text="Label"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="text-align: right;" class="auto-style87">
                                    <p class="auto-style75">
                                        <strong>Địa chỉ
                                    </strong>
                                    </p>
                                </td>
                                <td style="text-align: left;" class="auto-style88">
                                    <asp:Label ID="addr" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;" class="auto-style87">
                                    <p class="auto-style63">
                                        <strong>phone:&nbsp; :
                                    </strong>
                                    </p>
                                </td>
                                <td style="text-align: left;" class="auto-style88">
                                    <asp:Label ID="phonenumb" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;" class="auto-style87">
                                    <p class="auto-style72">
                                        <strong>email</strong> :
                                    </p>
                                </td>
                                <td style="text-align: left;" class="auto-style88">
                                    <asp:Label ID="mail" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;" class="auto-style87">
                                    <p class="auto-style95">
                                        <strong>Phụ huynh</strong> :
                                    </p>
                                </td>
                                <td style="text-align: left;" class="auto-style88">
                                    <asp:Label ID="parent" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;" class="auto-style87">
                                    <p class="auto-style99">
                                        <strong>Liên hệ</strong> :
                                    </p>
                                </td>
                                <td style="text-align: left;" class="auto-style88">
                                    <asp:Label ID="contact" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;" class="auto-style73">
                                    <p style="color: orangered" class="auto-style74"><strong>Lưu ý</strong></p>
                                </td>
                                <td style="text-align: left;">
                                    <asp:CheckBox ID="cbAttent" runat="server" CssClass="auto-style47" ForeColor="Red" AutoPostBack="True" OnCheckedChanged="cbAttent_CheckedChanged" /></td>

                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    <p style="color: orangered" class="auto-style94"><strong>Loại ra khỏi danh sách</strong></p>
                                </td>
                                <td style="text-align: left;">
                                    <asp:CheckBox ID="cbRemove" runat="server" AutoPostBack="True" ForeColor="#00CC00" OnCheckedChanged="cbRemove_CheckedChanged" CssClass="auto-style47" />
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>

            </div>


            <div class="col-md-8">
                <ul class="nav nav-tabs">
                    <li><a data-toggle="tab" href="#menu0">Học tập</a></li>
                    <li><a data-toggle="tab" href="#menu1">Thông tin khác</a></li>
                    
                    <li><a data-toggle="tab" href="#menu3">Nhận xét</a></li>
                    <li><a data-toggle="tab" href="#menu4">Khung chương trình</a></li>
                    <li><a data-toggle="tab" href="#menu5">Chi tiết học tập</a></li>
                    <li><a data-toggle="tab" href="#menu6">Hành vi</a></li>
                    <li><a data-toggle="tab" href="#menu7">Lịch học/thi</a></li>


                </ul>

                <div class="tab-content">
                    <div id="menu0"  class="tab-pane fade  ">
                        <div>
                            <div class="panel">


                                <table class="auto-style51">

                                <tr>
                                    <td class="auto-style88">
                                        <p style="text-align: right;" class="auto-style68"><strong>Chuyên ngành:</strong></p>
                                    </td>
                                    <td class="auto-style88" >
                                        <asp:Label Style="text-align: left;" ID="major" runat="server" Text="Label"></asp:Label>

                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style88">
                                        <p style="text-align: right;" class="auto-style42"><strong>Khóa:</strong></p>
                                    </td>
                                    <td class="auto-style88">
                                        <asp:Label Style="text-align: left;" ID="curr" runat="server" Text="Label"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="auto-style88">
                                        <p style="text-align: right;" class="auto-style36"><strong>Mã thành viên:</strong></p>
                                    </td>
                                    <td class="auto-style88">
                                        <asp:Label Style="text-align: left;" ID="member" runat="server" Text="Label"></asp:Label></td>


                                </tr>
                                <tr>
                                    <td class="auto-style88">
                                        <p style="text-align: right;" class="auto-style67"><strong>Diện:</strong>
                                        </td>
                                    <td class="auto-style88">
                                        <asp:Label Style="text-align: left;" ID="mode" runat="server" Text="Label"></asp:Label></td>

                                </tr>
                                <tr>

                                    <td class="auto-style88">
                                        <p style="text-align: right;" class="auto-style41"><strong>Kì thanh toán:</strong></p>

                                    </td>
                                    <td class="auto-style88">
                                        <asp:Label Style="text-align: left;" ID="ktx" runat="server" Text="Label"></asp:Label></td>
                                </tr>
                                <tr>

                                    <td class="auto-style88">
                                        <p style="text-align: right;" class="auto-style96"><strong>Kì hiện tại:</strong></p>
                                    </td>
                                    <td class="auto-style88">
                                        <asp:Label Style="text-align: left;" ID="currrentTerm" runat="server" Text="Label"></asp:Label></td>
                                </tr>
                                <tr>

                                    <td class="auto-style88">
                                        <p style="text-align: right;" class="auto-style97"><strong>Trạng thái:</strong>
                                        </td>
                                    <td class="auto-style88">
                                        <asp:Label Style="text-align: left;" ID="status" runat="server" Text="Label"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="auto-style88">
                                        <p style="text-align: right;" class="auto-style97"><strong>Ngày cấp CMT:</strong></p>
                                    </td>
                                    <td class="auto-style88">
                                        <asp:Label Style="text-align: left;" ID="dateofissue" runat="server" Text="Label"></asp:Label></td>


                                </tr>
                                
                                <tr>
                                    <td class="auto-style88">

                                        <p style="text-align: right;" class="auto-style53"><strong>Số dư tài khoản:</strong></p>

                                    </td>
                                    <td class="auto-style88">
                                        <asp:Label Style="text-align: left;" ID="finance" runat="server" Text="Label"></asp:Label>

                                    </td>

                                </tr>
                            </table>
              
</div>


                        </div>

                    </div>



                    <div id="menu1" class="tab-pane fade">
                      
                     
                        <table class="auto-style66">
                            <tr>
                                <td class="auto-style103">
                                    <p style="text-align: right;" class="auto-style101"><strong>Loại Tài Chính:</strong></p>
                                </td>
                                <td class="auto-style88">
                                    <asp:Label Style="text-align: left;" ID="lbFinace" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td class="auto-style103">
                                    <p style="text-align: right;" class="auto-style101"><strong>Hạn 7 nam:</strong></p>
                                </td>
                                <td class="auto-style88">
                                    <asp:Label Style="text-align: left;" ID="limit7year" runat="server" Text="Label"></asp:Label>

                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style103">
                                    <p style="text-align: right;" class="auto-style101"><strong>Quyêt định thôi học:</strong>
                                    
                                </td>
                                <td class="auto-style88">
                                    <asp:Label Style="text-align: left;" ID="dropout" runat="server" Text="Label"></asp:Label>

                                </td>


                            </tr>
                            <tr>
                                <td class="auto-style103">
                                    <p style="text-align: right;" class="auto-style102"><strong>Quyêt định chuyển cơ sở:</strong></p>
                                </td>
                                <td class="auto-style88">

                                    <asp:Label Style="text-align: left;" ID="changeCampus" runat="server" Text="Label"></asp:Label>
                                </td>


                            </tr>

                            <tr>
                                <td class="auto-style103">
                                    <p style="text-align: right;" class="auto-style12"><strong>Quyêt định chuyển ngành:</strong>
                                    
                                </td>
                                <td class="auto-style88">

                                    <asp:Label Style="text-align: left;" ID="changeMajor" runat="server" Text="Label"></asp:Label>
                                </td>


                            </tr>

                            <tr>
                                <td class="auto-style103">
                                    <p style="text-align: right;" class="auto-style12"><strong>Quyêt định kỷ luật:</strong></p>
                                </td>
                                <td class="auto-style88">
                                    <asp:Label Style="text-align: left;" ID="getDiscipline" runat="server" Text="Label"></asp:Label>

                                </td>


                            </tr>
                            <tr>
                                <td class="auto-style103">
                                    <p style="text-align: right;" class="auto-style102"><strong>Quyêt định Rejoin:</strong></p>
                                </td>
                                <td class="auto-style88">
                                    <asp:Label Style="text-align: left;" ID="rejoin" runat="server" Text="Label"></asp:Label>

                                </td>


                            </tr>


                            <tr>
                                <td class="auto-style103">
                                    <p style="text-align: right;" class="auto-style12"><strong>Quyêt định công nhận TN:</strong></p>
                                </td>
                                <td class="auto-style88">
                                    <asp:Label Style="text-align: left;" ID="gruadation" runat="server" Text="Label"></asp:Label>

                                </td>


                            </tr>
                            <tr>
                                <td class="auto-style103">
                                    <p style="text-align: right;" class="auto-style12"><strong>Quyêt định công nhận SVCQ:</strong></p>
                                </td>
                                <td class="auto-style88">
                                    <asp:Label Style="text-align: left;" ID="svcq" runat="server" Text="Label"></asp:Label>

                                </td>


                            </tr>

                        </table>


                    </div>
                    
                    <div id="menu3" class="tab-pane fade">
                        <table  class="auto-style93">
                            <tr>
                                <td class="auto-style77">
                                    <div>
                                        <asp:Label ID="lbComment" runat="server" Text="Thêm nhận xét :"></asp:Label>
                                        <textarea id="comment" style="resize: none;" runat="server" class="auto-style16" name="S2"></textarea>
                                      <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="check" ControlToValidate="comment" ForeColor="Red" ErrorMessage="Nhận xét đang bị trống"></asp:RequiredFieldValidator>--%>
                                        <div style="padding-top: 20px;">
                                            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rdComment" runat="server" AutoPostBack="True" Height="16px" Width="449px" OnSelectedIndexChanged="rdComment_SelectedIndexChanged">
                                                <asp:ListItem>Có Tiến Bộ</asp:ListItem>
                                                <asp:ListItem>Chưa Tiến Bộ</asp:ListItem>
                                                <asp:ListItem>Cần Chú Ý</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                        </td>
                                <td>
                                    <h4>Nhận xét của bạn</h4>
                                       


                                    <asp:GridView ID="grMyComment" runat="server" AutoGenerateColumns="False"  CellPadding="3" BorderStyle="None" BorderWidth="1px" DataSourceID="SqlDataSource3" Width="552px" CssClass="auto-style48" Height="83px"   DataKeyNames="commentID,accountID" AllowSorting="True" OnRowCommand="grMyComment_RowCommand" BackColor="White" BorderColor="#CCCCCC">
                                            <Columns>
                                                <asp:BoundField DataField="commentID" HeaderText="commentID" SortExpression="commentID" Visible="False" InsertVisible="False" ReadOnly="True" />
                                                <asp:BoundField DataField="content" HeaderText="Nội dung" SortExpression="content" />
                                                <asp:TemplateField HeaderText="file đính kèm"  SortExpression="fileName">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fileName") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("fileName") %>' CommandName="Download" Text='<%# Eval("fileName") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="staffName" HeaderText="Người nhận xét" ReadOnly="True" SortExpression="staffName" />
                                                <asp:BoundField DataField="date" ReadOnly="True" HeaderText="Ngày" SortExpression="date" />
                                                <asp:BoundField DataField="accountID" HeaderText="accountID" InsertVisible="False" ReadOnly="True" SortExpression="accountID" Visible="False" />
                                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" DeleteText="Xóa" EditText="Sửa" CancelText="Hủy" UpdateText="Cập nhật" />
                                            </Columns>
                                            <FooterStyle BackColor="White" ForeColor="#000066" />
                                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                            <RowStyle ForeColor="#000066" />
                                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                                        </asp:GridView>


                                </td>
                                        </tr>
                                        <tr>

                                            <td>
                                        <div  class="auto-style76">
                                            <div style="padding-bottom:10px;">



                                                <asp:FileUpload ID="FileUploadSave"  runat="server" AllowMultiple="True" />
                                                



                                            </div>
                                            <asp:Button ID="btnAddComment" CssClass="btn btn-primary" runat="server" ValidationGroup="check" Text="Thêm nhận xét" OnClick="btnAddComment_Click" />

                                            <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>

                                        <asp:Label ID="Label10" runat="server" ForeColor="Lime"></asp:Label>
                                        <asp:Label ID="Label11" runat="server" ForeColor="Red"></asp:Label>

                                           
                                          <%--  <asp:Button ID="ButSave" runat="server" CssClass="btn btn-primary" ValidationGroup="checkFile" Text="Tải lên" OnClick="ButSave_Click" />--%>
                                        <p>
                                           
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="checkFile" ControlToValidate="FileUploadSave" ForeColor="Red" runat="server" ErrorMessage="Vui lòng chọn file tải lên"></asp:RequiredFieldValidator>
                                            
                                        </p>
                                            <asp:Label ID="upLabel" ForeColor="#00CC00" runat="server" Text=""></asp:Label>
                                        </td>
                                            <td>
                                                  <h4>Nhận xét khác</h4>


                                                   <asp:GridView ID="grOtherComment" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC"  BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="commentID,accountID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" OnRowCommand="grOtherComment_RowCommand1" Width="552px">
                                        <Columns>
                                            <asp:BoundField DataField="commentID" HeaderText="commentID" InsertVisible="False" ReadOnly="True" SortExpression="commentID" Visible="False" />
                                            <asp:BoundField DataField="content" HeaderText="Nội dung" SortExpression="content" />
                                            <asp:TemplateField HeaderText="file đính kèm" SortExpression="fileName">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fileName") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("fileName") %>' CommandName="Download" Text='<%# Eval("fileName") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="date" HeaderText="Ngày" SortExpression="date" />
                                            <asp:BoundField DataField="staffName" HeaderText="Người nhận xét" SortExpression="staffName" />
                                            <asp:BoundField DataField="accountID" HeaderText="accountID" InsertVisible="False" ReadOnly="True" SortExpression="accountID" Visible="False" />
                                        </Columns>
                                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                        <SortedDescendingHeaderStyle BackColor="#242121" />
                                    </asp:GridView>
                                            

                                            </td>

                                        </tr>
                                        <tr>
                                        <td>
                                        <p style="padding-top: 20px;" class="auto-style92">
                                            <asp:Button ID="btnAllComment" runat="server" CssClass="btn btn-primary" OnClick="btnAllComment_Click" Text="Hiển thị tất cả nhận xét" /></p>

                                    </div>
                                    <div style="padding-top: 30px;">
                                        <div>
                                            <asp:TextBox ID="tbSearch" runat="server"></asp:TextBox>
                                            <div style="padding-top:10px;"><asp:Button ID="btnSearch" runat="server" ValidationGroup="checkCM" CssClass="btn btn-primary" Text="Tìm kiếm nhận xét" OnClick="btnSearch_Click"/></div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="tbSearch" ValidationGroup="checkCM" SetFocusOnError="true" runat="server" ForeColor="Red" ErrorMessage="Thanh tìm kiếm trống"></asp:RequiredFieldValidator>
                                        </div>

                                        <asp:Label ID="lbResult" runat="server" ForeColor="Red" Text=""></asp:Label>
                                        </td>
                                        <td>
                                              <asp:Label ID="Label21" runat="server" ForeColor="Red" Text="Bạn có thể thay đổi xếp loại"></asp:Label>
                                
                                
                                    <asp:DropDownList ID="drpChangeRank" CssClass="form-control" runat="server">
                                        <asp:ListItem>A</asp:ListItem>
                                        <asp:ListItem>B</asp:ListItem>
                                        <asp:ListItem>C</asp:ListItem>
                                        <asp:ListItem>D</asp:ListItem>
                                        <asp:ListItem>E</asp:ListItem>
                                        <asp:ListItem>F</asp:ListItem>
                                    </asp:DropDownList>
                                    <div style="padding-top:10px;"><asp:Button ID="btnUpdateRank" runat="server" CssClass="btn btn-primary" Text="Cập nhật" OnClick="btnUpdateRank_Click" /></div>
                                    
                                    <asp:Label ID="lbNoitice" runat="server" ForeColor="Lime"></asp:Label>

                                            </td>
                                        </tr>
                                        <tr>

                                            <td>

                <asp:GridView ID="grShowAllComment" AutoGenerateColumns="false" OnRowCommand="grShowAllComment_RowCommand1" runat="server">
                                          <Columns>
                                    
                                    <asp:BoundField DataField="content" HeaderText="Nội dung" SortExpression="content" />
                                    <asp:TemplateField HeaderText="file đính kèm" SortExpression="fileName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fileName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("fileName") %>' CommandName="Download" Text='<%# Eval("fileName") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                    <asp:BoundField DataField="date" HeaderText="Ngày" SortExpression="date" />
                                    <asp:BoundField DataField="staffName" HeaderText="Người nhận xét" SortExpression="staffName" />
                                    
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

                                            </td>

                                            <td>  

                                                     <em>
                                        <asp:Label ID="lbGuide" runat="server" Text="Thêm hoặc chuyển đổi người chăm sóc" ForeColor="#FF3300"></asp:Label>
                                    </em>
                                
                                
                                    <div style="padding-top: 40px;">
                                   


                                         <asp:DropDownList ID="drpStaff" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="staffName" DataValueField="accountID">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FnProject3 %>" SelectCommand="SELECT [staffName], [accountID] FROM [Account] WHERE role='CareStaff'"></asp:SqlDataSource>

                                        <div style="padding-top:10px;"> <asp:Button ID="btnUpdateStaff" runat="server" CssClass="btn btn-primary" OnClick="btnUpdateStaff_Click" Text="Cập nhật" /></div>
                                       
                                        <asp:Label ID="Label24" runat="server" ForeColor="Red"></asp:Label>
                                       
                                    </div>

                                                </td>
                                        </tr>
                                    

                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:FnProject3 %>" 
                                            DeleteCommand="DELETE FROM [Comment] WHERE [commentID] = @commentID" 
                                            InsertCommand="INSERT INTO [Comment] ([content], [date], [studentID], [commentTypeID], [accountID]) VALUES (@content, @date, @studentID, @commentTypeID, @accountID)" 
                                            SelectCommand="SELECT Comment.commentID,Comment.content,Comment.fileName,Comment.date, Account.staffName,Account.accountID
                                            FROM Comment 
                            INNER JOIN Account ON Comment.accountID= Account.accountID Where studentID=@studentID AND Account.accountID=@accountID"
                                            UpdateCommand="UPDATE [Comment] SET [content] = @content WHERE [commentID] = @commentID">
                                            <DeleteParameters>
                                                <asp:Parameter Name="commentID" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="content" Type="String" />
                                                <asp:Parameter Name="date" Type="DateTime" />
                                                <asp:Parameter Name="studentID" Type="String" />
                                                <asp:Parameter Name="commentTypeID" Type="Int32" />
                                                <asp:Parameter Name="accountID" Type="Int32" />
                                            </InsertParameters>
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="studentID" QueryStringField="studentID" />
                                                <asp:SessionParameter Name="accountID" SessionField="accountID" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="content" Type="String" />
                                                <asp:Parameter Name="commentID" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>

                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FnProject3 %>" SelectCommand="SELECT Comment.commentID,Comment.content,Comment.fileName,Comment.date, Account.staffName,Account.accountID
                                    FROM Comment 
                                    INNER JOIN Account ON Comment.accountID= Account.accountID Where studentID=@studentID AND Account.accountID!=@accountID">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="studentID" QueryStringField="studentID" />
                                            <asp:SessionParameter Name="accountID" SessionField="accountID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                
                         
                        </table>
                    </div>
                    <div id="menu4" class="tab-pane fade">
                       
                        <asp:Panel ID="Panel1" runat="server" Width="624px"></asp:Panel>


                    </div>
                    <div id="menu5" class="tab-pane fade">
                        <div style="padding-left:20px;">

                            <div>
                                


                            
                             <asp:Chart ID="Chart1" runat="server"  Palette="Pastel" Width="512px">
                                    <Series>
                                        <asp:Series  Name="Series1" IsValueShownAsLabel="True" IsVisibleInLegend="False" IsXValueIndexed="True" BorderWidth="0" MarkerStyle="Triangle">
                                            <EmptyPointStyle IsValueShownAsLabel="True" />
                                            <SmartLabelStyle CalloutStyle="Box" IsMarkerOverlappingAllowed="True" />
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                            <axisx>
                                    <MajorGrid Enabled ="False" />
                                </axisx>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                    <Titles>
                                        <asp:Title Name="chartName" Text="Thông tin học tập 2 kỳ gần nhất">
                                        </asp:Title>
                                    </Titles>
                                    <BorderSkin BorderWidth="0" />
                                </asp:Chart>    




                            </div>
                            <div  style="padding-top: 30px;">
                               

                                <div class="panel panel-info" style="width: 506px">
                                <label class="panel-heading" for="comment">Thông tin học tập/Số môn nợ:   <asp:Label ID="lbFailnumb" runat="server" Text="Label"></asp:Label></label>
                                <div class="form-group panel-body">
          
                                    <asp:Panel ID="pnStudy" runat="server"></asp:Panel>
                                </div>
                                </div>


                            </div>
                        </div>
                    </div>
                    <div id="menu6" class="tab-pane fade">
                        <div>
                            <asp:Chart ID="Chart2" runat="server"  Palette="SeaGreen" Width="512px">
                                <Series>
                                    <asp:Series  IsValueShownAsLabel="True" IsVisibleInLegend="False" IsXValueIndexed="True" BorderWidth="0" MarkerStyle="Triangle" Name="Series2">
                                        <EmptyPointStyle IsValueShownAsLabel="True" />
                                            <SmartLabelStyle CalloutStyle="Box" IsMarkerOverlappingAllowed="True" />
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                                 <axisx>
                                    <MajorGrid Enabled ="False" />
                                </axisx>
                                    </asp:ChartArea>
                                </ChartAreas>
                                 <Titles>
                                        <asp:Title Name="chartName" Text="Thông tin điểm hành vi 2 kỳ gần nhất">
                                        </asp:Title>
                                    </Titles>
                                  <BorderSkin BorderWidth="0" />
                            </asp:Chart>
                        </div>
                        <div style="padding-top: 30px;">

                            <div class="panel panel-info" style="width: 506px" >
                                <label class="panel-heading" for="comment">Thông tin về hành vi</label>
                                <div class="form-group panel-body">
          
                                    <asp:Panel ID="Panel3" runat="server"></asp:Panel>
                                </div>
                                </div>
                        </div>
                    </div>
                    <div id="menu7" class="tab-pane fade">
                        <div>
                            <asp:Panel ID="scheduleExam" runat="server"></asp:Panel>
                        </div>
                        <div style="padding-top:30px;">
                            <asp:Panel ID="scheduleStudy" runat="server"></asp:Panel>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="row">
            <div style="padding-top: 150px;">
                <div style="margin-left: 20px;">
                     <b>Mọi góp ý, thắc mắc xin liên hệ:</b> Freedom Group&nbsp; Facebook: <a href="https://www.facebook.com/anh.tu.9597">Anh Tú</a> Điện thoại: <b>01632489257</b>

                </div>
            </div>
            <div style="text-align: center;" class="footer">
                    © Powered by <a href="#">FPT University </a>| <a href="http://fap.fpt.edu.vn">FAP</a>  
            </div>
                          
        </div>
                          
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    
    <script src="../js/datatables.min.js"></script>
    <script>

        $(document).ready(function () {
            //$('#commentTable').DataTable();
            $('a[href="#menu<%=tab%>"]').tab('show')
            $('#curi').DataTable();
            $('#exam').DataTable();
            $('#time').DataTable();

            

        });

    </script>

</body>
</html>
