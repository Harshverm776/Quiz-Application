<%-- 
    Document   : Forgot_password
    Created on : Apr 2, 2019, 10:16:40 PM
    Author     : Harsh
--%>
<html>
    <head>
        <title>Forgot Password</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <style type="text/css">            
            #feed
     	    {
                display: inline-block;
                margin-top:120px;
                margin-left:400px;
                width: 53%;
                padding:10px 22px 50px 30px;
                position: fixed;
            }
            body
            {
            	font-family: Arial, Helvetica, sans-serif;
                background-size: 1600px;
                background-repeat: no-repeat;
                box-sizing: border-box;
                color:white;
            }
            h1
            {
                    font-family: cursive;
            }
            input{
                width:300px;
            }
            #log
            {
                font-size: 18px;
                margin-left: 150px;
                font-family:serif;
            }
	</style>
    </head>
    <body background="images/forgot.jpg">
            <div id="feed">
             <FORM action="forgot_val.jsp" method="post">
 		    <h1>Forgot Your Password...</h1>
                    <br><br>
                    <table cellpadding="5px">
            <tr>
            	<td>
 				<h3><b>Mail-Id:<b/></h3> 
				</td>
                                <td><input type="text" name="email" required>	
				
                </td>
            </tr>
            <tr>
            	<td>
                <h3><b>Security code:</b></h3> 
				</td>
				<td>
                                    <input type="text" name="security_code" required>
            	</td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <h6><span class="blinking">
              <% 
             if(request.getAttribute("Message")!=null)
             {
                 out.println(request.getAttribute("Message"));
             }
                %>
                </span>
              </h6>
                </td>
            </tr>
            <tr>
            	<td>
            		<button type='submit' class="btn btn-success"> Submit </button>
                </td>
                <td>
                	<button type='reset' class="btn btn-danger"> Reset </button>
                        <a type="button" id="log" class="btn btn-light" href="login.jsp"><b>Login</b></button>
                </td>
            </tr>
        </table>
    </FORM>  
 </div>
    </body>
</html>

