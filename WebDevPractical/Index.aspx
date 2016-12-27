<%@ page language="C#" autoeventwireup="true" inherits="Index, App_Web_syrzg4zt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Flexiple</title>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-1.9.0.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script>
        $(function () { // DOM Ready
            var $show = $("#show"); // Also, cache the selectors you plan to reuse
            $show.click(function () {
                var showText = $.trim($show.text());
                if (showText === "login") {
                    $show.text("SignUp")
                    $("#loginDiv").show()
                    $("#SignUpDiv").hide()

                }
                else {
                    $show.text("login");
                    $("#SignUpDiv").show()
                    $("#loginDiv").hide()
                }


            });
        });


    </script>
    <script>
        function ValidateEmail(email) {
            var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            return expr.test(email);
        };
        function checkDomain(nname) {
            var arr = new Array('.in');
            var mai = nname;
            var val = true;
            var dot = mai.lastIndexOf(".");
            var dname = mai.substring(0, dot);
            var ext = mai.substring(dot, mai.length);
            if (dot > 2 && dot < 57) {
                for (var i = 0; i < arr.length; i++) {
                    if (ext == arr[i]) {
                        val = true;
                        break;
                    }
                    else {
                        val = false;
                    }
                }
                if (val == false) {
                    alert("Your domain extension " + ext + " is not correct");
                    return false;
                }

            }
            else {
                alert("invalid domain name");
                return false;
            }
            return true;
        }

           
      
        $(document).ready(function () {
            $('#Register').click(function () {
                var pass = $("#txtSignUpPassword").val();
                var repass = $("#txtSignUpConfirmPassword").val();
                var regexLOwercase = new RegExp("^[a-z_\-]+$");

                var name = $('#txtSignUpCompanyName').val().trim();
                var domain = $("#txtSignupEmail").val();

                var subname = name.substring(0, 9);
                if (!name.match(regexLOwercase))
                {
                    
                    alert("only lowercase allowed in company name.");
                     return false;
                }   
              if (subname != 'flexiple_')
              {
                  alert("Invalid name.enter like 'flexiple_name' format");
                   return false;
              }
              if (!ValidateEmail(domain))
              {
                  alert("Invalid Email Id.");
                  return false;
              }

            

              var passregex = new RegExp("^(?=(?:.*[A-Z].*){2})(?!(?:.*[A-Z].*){3,})(?=(?:.*[$@$!%*?&].*){2})(?!(?:.*[$@$!%*?&].*){3,}).*$");
             
              if (!pass.match(passregex))
              {
               
                  alert("Password must contains exact 2 upper case and 2 special charecters.");
                  return false;
              }

              if (pass.length < 4 || pass.length > 8) {
                  alert("Password length must between 4 to 8.");
                  return false;
              }

              if (pass != repass)
              {
                
                  alert("Password and confirm password must match.")
                  return false;
              }

              if (checkDomain(domain)) {
                  return true;
              }
              else {
                  return false;
              }
            
            });
       });  
        
    </script>

</head>
<body class="skin-blue">
    <form id="form1" runat="server">
        <a id="show" href="#" class="lnk_log btn btn-success">SignUp
        </a>
        <asp:Panel ID="panellogin" runat="server">
            <div id="loginDiv">
                <%-- style="display: none;"--%>
                <div id="login" class="login">
                    <div class="wrapper text-center">
                        <div class="col-md-4 " style="left: 35%">
                            <div class="thumbnail">
                                <h4 class="pull-center"></h4>
                                <h4><strong>Welcome.</strong> Please login.</h4>
                                <div class="form-group">
                                    <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label>
                                </div>
                                <br />
                                <div class="form-group">
                                    <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server" Placeholder="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqUserName" runat="server" ErrorMessage="Email Required." ControlToValidate="txtUserName" ValidationGroup="validate" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtPassword" CssClass="form-control" type="password" runat="server" placeholder="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqPassword" runat="server" ErrorMessage="Password Required." ControlToValidate="txtPassword" ValidationGroup="validate" ForeColor="Red"></asp:RequiredFieldValidator>

                                </div>
                                <br />
                                <p>
                                     
                                </p>
                                <p>
                                    <asp:Button ID="btnLogin" CssClass="btn btn-success btn-block" runat="server" Text="Login" CausesValidation="true" ValidationGroup="validate" OnClick="btnLogin_Click" />
                                </p>
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="SignUpDiv" style="display: none;">
                <div id="SignUp">
                    <div class="wrapper text-center">
                        <div class="col-md-4" style="left: 35%">
                            <div class="thumbnail">
                                <h4 class="pull-center"></h4>
                                <h4><strong>Sign Up</strong></h4>
                                <div class="form-group">
                                    <asp:Label ID="lblSignUpErrormsg" runat="server" 0ForeColor="Red"></asp:Label>
                                </div>
                                <br />
                                <div class="form-group">
                                    <asp:TextBox ID="txtSignUpCompanyName" CssClass="form-control" runat="server" ClientIDMode="Static" 
                                        placeholder="Company Name" ValidationGroup="validate1" MaxLength="150"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Company Name Required." ControlToValidate="txtSignUpCompanyName" ValidationGroup="validate1" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtSignupEmail" CssClass="form-control" ClientIDMode="Static" type="Email"
                                         runat="server" placeholder="Email" MaxLength="250"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email Required." ControlToValidate="txtSignupEmail" ValidationGroup="validate1" ForeColor="Red"></asp:RequiredFieldValidator>
                                   </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtSignUpPassword" CssClass="form-control" ClientIDMode="Static" type="password"
                                         placeholder="Password" runat="server"  ValidationGroup="validate1" MaxLength="8"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Password Required." ControlToValidate="txtSignUpPassword" ValidationGroup="validate1" ForeColor="Red"></asp:RequiredFieldValidator>
                                  </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtSignUpConfirmPassword" CssClass="form-control" ClientIDMode="Static" type="password" runat="server" placeHolder="Confirm Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Re enter password."  ControlToValidate="txtSignUpConfirmPassword" ValidationGroup="validate1" ForeColor="Red"></asp:RequiredFieldValidator>
<div id="divConfirmPass" class="text-danger"></div>
                                </div>

                                <p>
                                   
                                </p>
                                <p>
                                    <asp:Button ID="Register" CssClass="btn btn-success btn-block" runat="server" Text="Sign Up" ValidationGroup="validate1" OnClick="Register_Click" />
                                </p>
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </form>
</body>
</html>
