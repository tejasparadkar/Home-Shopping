<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page session="false" %>
<!DOCTYPE html>
<html>
<head>
<title>Online Shopping</title>
<!--css-->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/ken-burns.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/animate.min.css" type="text/css" media="all" />
<!--css-->
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #bee5bd;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #50894f;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form .imag {
	width: 200px;
	border-style: ridge;
	border-radius: 20px;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #435142;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.contain {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.contain:before, .contain:after {
  content: "";
  display: block;
  clear: both;
}
.contain .info {
  margin: 50px auto;
  text-align: center;
}
.contain .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.contain .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.contain .info span a {
  color: #000000;
  text-decoration: none;
}
.contain .info span .fa {
  color: #EF3B3A;
}
body {
  background-image: url(images/login.jpg) ; /* fallback for old browsers */
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
</style>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="ONLINE SHOPPING" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--js-->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!--js-->
<!--webfonts-->
<link href='//fonts.googleapis.com/css?family=Cagliostro' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!--webfonts-->
</head>
<body>
	<!--header-->
	<!--<div class="col-md-12 wel-grid"> -->
		<div class="header">
			<div class="container">
				<nav class="navbar navbar-default">
					<div class="container-fluid">
				<!---Brand and toggle get grouped for better mobile display-->
						<div class="navbar-header">
							<div class="navbar-brand">
								<h1><a href=""><center>Home Shopping Login Page</center></a></h1>
							</div>
						</div>
					</div>
				</nav>
		    </div>
		</div>
    <div class="login-page">
  			<div class="form">
    			<br><br><br>
  <%
  String email= request.getParameter("email");
  String pass= request.getParameter("password");
  try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
    Statement s=conn.createStatement();
    String sql="select * from users where email='"+email+"' and password='"+pass+"'";
    ResultSet rs=s.executeQuery(sql);
    if(rs.next()){
  if(email.equals(rs.getString(2)) && pass.equals(rs.getString(3))){
  %>
    <form class="login-form" method="post">
        <h2>Login Sucessfully...</h2><br><br><br>
       
        <br>
    </form>
    <a href= "https://localhost/project/men.php?login=1"><h1>OK</h1></a>
  <%
  }
  else{
    %>
  <form class="login-form" action="sign-in.php" method="post">
      <h3>Email ID or password is invalid</h3><br><br><br>
      <button type="submit" name="submit">Ok</button>
      <br>
  </form>
  <%
}}
}catch(Exception e){
  out.println(e);
}
%>
</div>
</div>
</div>
</body>
</html>
