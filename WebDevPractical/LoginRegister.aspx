<%@ page language="C#" autoeventwireup="true" inherits="LoginRegister, App_Web_syrzg4zt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="assets/jquery-1.8.2.js"></script>
    <script>
        $(function () { // DOM Ready
            var $show = $("#show"); // Also, cache the selectors you plan to reuse
            $show.click(function () {
                var showText = $.trim($show.text());
                if (showText === "login") {
                    $show.text("SignUp")
                    $("#SignUpDiv").show()
                    $("#loginDiv").hide()
                }
                else {
                    $show.text("login");
                    $("#loginDiv").show()
                    $("#SignUpDiv").hide()
                }
               
               
            });
        });

        $("#form1").validate({
            rules: {
                eduEmail1: {
                    required: true,
                    email: true,
                    accept: 'edu'
                },
            }
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <a id="show" href="#" class="lnk_log">login
        </a>
        <div id="loginDiv" style="display: none;">
            login 
        </div>
        <div id="SignUpDiv" style="display: none;">
            Signup 
        </div>
        <form id="myForm">

          <span class="label">Try:</span> <input type="text" id="eduEmail1" name="eduEmail1" value="abc@email.cpom"/>
    <br />
    
    <br />
        <input type="submit" value=" Press me! "/>
            </form>
    </form>
</body>
</html>
