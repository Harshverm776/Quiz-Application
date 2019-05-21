<%-- 
    Document   : welcome
    Created on : Jun 9, 2018, 6:44:02 PM
    Author     : MISHRA
--%>

<%@page import="utility.SqlUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <title>welcome....</title>
        <style>
        body{
            margin:0;
            background-size: 1400px 650px;
            background-repeat: no-repeat;
            font-family: serif;
            color:white;
        }
        .type{
            font-size:140%;
        }
        .header
        {
            width:100%;
            display: inline;
            position:absolute;
            background: deepskyblue;
            margin-top:0px;
            padding:15px;
            border: solid blue;
            color:black;
        }
        h4{
            display: inline;
            font-size: 24px;
            margin-right: 10px;
            margin-top: 25px;
            text-transform: capitalize;
        }
        #home{
            font-size: 32px;
            background-color: orangered;
            margin: 0px 30% 0px 280px;
            padding: 10px 50px 10px 50px;
            color: #ffffff;
            border:solid black;
        }
        #select{
            margin-top: 130px;
            margin-right: 600px;
            margin-left: 400px;
            position:absolute;
            width:900px;
        }
        #b1,#b2,#b3,#b4{
            font-size:25px;
            width:200px;
            margin-right: 10px;
            margin-left: 10px;
        }
        
        #user
        {
            color:black;
            margin:-10px -2px 0px 20px;
            padding: 5px 10px 0px 10px;

        }
        #apti{
            position: absolute;
            margin-top: 200px;
            margin-left:410px;
            width:200px;
            height: 360px;
        }
        #grammar{
            position: absolute;
            margin-top: 200px;
            margin-left:1080px;
            width:200px;
            height: 360px;
        }
        #gk{
            position: absolute;
            margin-top: 200px;
            margin-left:630px;
            width:200px;
            height: 360px;
        }
        #tech{
            position: absolute;
            margin-top: 200px;
            margin-left:860px;
            width:200px;
            height: 360px;
        }
        .logout{
            font-size: 25px;
            color:white;
            weight:bold;
            display: inline;
            padding: 0px 10px 0px 10px;
            text-decoration: none;

        }
        .logout:hover,.logout:focus{
            color: red;
            font-size: 25px;
        } 
        
        .div1{
            position: absolute;
            margin-top: 230px;
            margin-left: 50px;
                   }
        img{
            border-radius: 50%;
        }
        .div3{
            height:10px;
            width:10px;
            margin-left:25%;
        }
        .div2{
            position:absolute;
            margin-top:120px;
            margin-left:50px;
           width:30%;
            
        }
        #but{
            position:absolute;
            margin-top:100px;
            padding-right: 60px;
            padding-left: 60px;
            position: fixed;
        }
        #d1,#d2,#d3,#d4{
            display:none;
            font-size: 20px;
        }
        input[type='radio']:after {
                width: 15px;
                height: 15px;
                top:-7px;
                left:-4px;
                border-radius: 15px;
                position: relative;
                background-color: #d1d3d1;
                content: '';
                display: inline-block;
                border: 2px solid black;
            }

            input[type='radio']:checked:after {
                width: 15px;
                height: 15px;
                border-radius: 15px;
                top: -7px;
                left: -4px;
                position: relative;
                background-color: #f44336;
                content: '';
                display: inline-block;
                border: 2px solid black;
            }
        </style>
        <script type="text/javascript">
		$(document).ready(
			function()
			{
				var buttonElementId;
				$(':button').click(function(){
					buttonElementId=$(this).attr('id');
					var num=buttonElementId[1];
						var i;
						for(i=1;i<=4;i++)
						{
							if(i==num)
								$("#d"+num).show();
							else
								$("#d"+i).hide();
							
						}
				});
					
			});
	</script>
    </head>
    
<body background="images/user_home.png" >
    
        <div class="header"> 
            <h4><b>
             <i id="user" class="fas fa-user-circle fa-2x"></i>&nbsp;&nbsp;
             <%=session.getAttribute("newuser")%>&nbsp;&nbsp;&nbsp;
             <a id="home">HOME </a>
              <i class="fas fa-sign-out-alt"></i>
                  <a class="logout"href="logout.jsp"> Logout </a>
                  </b>
            </h4>  
        </div> 
        <div class="div1">
            <img height="300" width="300" src="images/img2.jpg">
        </div>
                <div class="div2">
      <h2>  Are you ready to test your skills..???<br><br>
      </h2></div>
            <div id="select">
               <button type="button" id="b1" class="btn btn-primary">Aptitude</button>
               <button type="button"  id="b2" class="btn btn-secondary">G.K</button>
               <button type="button"  id="b3" class="btn btn-danger">Technical</button>
               <button type="button"  id="b4"  class="btn btn-warning">Grammar</button>
            </div>
             <div id="center">
            <div class="alert alert-primary" role="alert" id="apti">
                <form action="Attempting_Quiz.jsp" method="post">
                    <div id="d1">    
                        <input type="text" name="type" value="Aptitude" hidden>
                        <%    
                        ResultSet rs=SqlUtil.retrieve("select count(*) as count from aptitude"); 
                            int num=0;
                            if(rs!=null)
                            {
                                while(rs.next())
                                {
                                  num=rs.getInt("count"); 
                                }
                            }
                            num=num/10;
                            for(int i=1;i<=num;i++)
                            {
                        %>
                        <input type="radio" name="sub_type" value="<%out.print(i);%>" required>Quiz-<%out.print(i);%><br>
                        <%
                            }
                        %>
                        <button type="submit" class="btn btn-dark" id="but"><b>Play</b> </button>

                    </div>
        </form>
            </div>
            <div class="alert alert-secondary" role="alert"  id="gk">
                <form action="Attempting_Quiz.jsp" method="post">
                    <div id="d2">    
                        <input type="text" name="type" value="GK" hidden>
                        <%    
                            rs=SqlUtil.retrieve("select count(*) as count from gk"); 
                            num=0;
                            if(rs!=null)
                            {
                                while(rs.next())
                                {
                                  num=rs.getInt("count"); 
                                }
                            }
                            num=num/10;
                            for(int i=1;i<=num;i++)
                            {
                        %>
                        <input type="radio" name="sub_type" value="<%out.print(i);%>" required>Quiz-<%out.print(i);%><br>
                        <%
                            }
                        %>
                        <button type="submit" class="btn btn-dark" id="but"><b>Play</b> </button>

                    </div>
        </form>
            </div>
            </div>
            <div class="alert alert-danger" role="alert" id="tech">
                <form action="Attempting_Quiz.jsp" method="post">
                    <div id="d3">    
                        <input type="text" name="type" value="Technical" hidden>
                        <%    
                            rs=SqlUtil.retrieve("select count(*) as count from technical"); 
                            num=0;
                            if(rs!=null)
                            {
                                while(rs.next())
                                {
                                  num=rs.getInt("count"); 
                                }
                            }
                            num=num/10;
                            for(int i=1;i<=num;i++)
                            {
                        %>
                        <input type="radio" name="sub_type" value="<%out.print(i);%>" required>Quiz-<%out.print(i);%><br>
                        <%
                            }
                        %>
                        <button type="submit" class="btn btn-dark" id="but"><b>Play</b> </button>

                    </div>
        </form>
            </div>
            </div>
            <div class="alert alert-warning" role="alert" id="grammar">
                <form action="Attempting_Quiz.jsp" method="post">
                    <div id="d4">    
                        <input type="text" name="type" value="Grammar" hidden>
                        <%    
                            rs=SqlUtil.retrieve("select count(*) as count from grammar"); 
                            num=0;
                            if(rs!=null)
                            {
                                while(rs.next())
                                {
                                  num=rs.getInt("count"); 
                                }
                            }
                            num=num/10;
                            for(int i=1;i<=num;i++)
                            {
                        %>
                        <input type="radio" name="sub_type" value="<%out.print(i);%>" required>Quiz-<%out.print(i);%><br>
                        <%
                            }
                        %>
                        <button type="submit" class="btn btn-dark" id="but"><b>Play</b> </button>
                    </div>
        </form>
            </div>
            </div>
             </div>
    </body>
</html>
