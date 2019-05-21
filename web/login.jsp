<%-- 
    Document   : logiin
    Created on : Mar 28, 2019, 6:55:40 AM
    Author     : Harsh
--%>
<%@page import="javax.swing.JOptionPane"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>login</title>
  <style>
      body {font-family: Arial, Helvetica, sans-serif;
      background-size: cover;
    background-repeat: no-repeat;
      }

/* Full-width input fields */
input[type=email], input[type=password] {
    width: 50%;
    padding: 12px 20px ;
    margin: 1px 400px;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
    margin-left: 15px;
}

input[type=checkbox]
{
    margin-top:0px;    
}
label{
     width: 30%;
    padding: 12px 20px;
    margin: 8px 400px;
    display: inline-block;
    margin-left:15px;
}
#id01{
    margin: 60px 100px 0px 400px;
    color: white;
    border-color:antiquewhite;
    background-attachment: fixed;
}
/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    margin: 20px 18px;
    margin-bottom:0px;
    border: none;
    cursor: pointer;
    width: 50%;
    font-size: 20px;
}

button:hover {
    opacity: 0.8;
}
.cancelbtn {
    width: 30%;
    padding: 10px 18px;
    background-color: #f44336;
    margin-left: 17px;
    margin-top: 3px;
    margin-bottom: 3px;
}
h4{
   position: absolute; 
   margin-top: 9px;
   margin-left:9px;
    text-shadow: 0px 0px white;
}
.blinking{
    animation:blinkingText 0.5s infinite;
}
@keyframes blinkingText{
    0%{     color: red;    }
    20%{     color: red;    }
    30%{     color: red;    }
    88%{    color: transparent; }
    100%{   color: #ff3333;    }
}
/* Center the image and position the close button */
.imgcontainer {
    text-align: center;
    margin: 10px 310px 0px 0;
    position: relative;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
  
}

span.psw {
    float: right;
    padding-top: 16px;
    margin-left: 5px;
    margin-right: 30px;
    margin-top: 1px;
    color: black;
   
}
.close {
    position: absolute;
    right: 5px;
    top: 0;
    color: #ffffff;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}
.container2{
    margin-left: 25px;
    margin-right: 60px;
    width: 60%;
    padding-top: 0px;
    margin-top:0px;
    background-color: red;
}
.icon{
    border-radius: 50%;
}
a
{
    color: red;
    font-size: larger; 
}
#login{
    margin-top:40px;
    margin-left:12px;
}

</style>
</head>
<body class="background" background="images/img7.jpg"> 
    <div id="id01">
  
        <form action="login_val.jsp" method="post">
    <div class="imgcontainer">
      <span onclick="window.location.href='index.jsp'" class="close" title="Close Modal">&times;</span>
      <img class="icon" src="images/img8.png" alt="Avatar">
    </div>

    <div class="container">
        <label for="mail-id"><b>Mail-id</b></label>
   <br>
   <input type="email" placeholder="Enter your mail-id" name="mail" required>
    <br>
      <label for="psw"><b>Password</b></label>
   <br>
      <input type="password" placeholder="Enter Password" name="psw" required>
      <h4><span class="blinking">
      <% 
     if(request.getAttribute("errorMessage")!=null)
     {
         out.println(request.getAttribute("errorMessage"));
     }
        %>
        </span>
      </h4>
      <button type="submit" id="login">Login</button>
    </div>
    
      <button type="button" onclick="window.location.href='index.jsp'" class="cancelbtn">Cancel</button>
      &nbsp;&nbsp;&nbsp;&nbsp;<a href="Forgot_password.jsp">Forgot password?</a></span>
      </form>
</div>
    </body>
</html>
