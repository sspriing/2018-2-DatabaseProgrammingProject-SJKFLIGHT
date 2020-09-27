<%@ page contentType ="text/html; charset=utf-8" pageEncoding="utf-8" %>
 <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<%
    String user = request.getParameter("userID").toString();
    String password = request.getParameter("password").toString();
    
 	Connection myConn = null;
 	Statement stmt = null;
 	String mySQL = null;
 	int temp_pass=0;
 	int input_pass =0;
 	
 	
	String dbURL = "jdbc:mysql://sjk-flight.co0uj2jb0gsx.ap-northeast-2.rds.amazonaws.com:3306/FLIGHT?user=admin&password=123456789";
	String dbID = "admin";
	String dbPassword = "123456789";
	Class.forName("com.mysql.jdbc.Driver");
	myConn = DriverManager.getConnection(dbURL,dbID,dbPassword);
 	stmt = myConn.createStatement();
 	
 	mySQL = "select id, english_name, user_code from USER where id ='" + user + "' and password = '" + password + "'";
 	
 	ResultSet myResultSet = stmt.executeQuery(mySQL);
 	if(myResultSet.next()){
 		session.setAttribute("user",user);
 		session.setAttribute("name", myResultSet.getString("english_name"));
 		session.setAttribute("user_code", myResultSet.getString("user_code"));
 		response.sendRedirect("Mypage.jsp");
 	}
 	
 	mySQL = "select manager_code from MANAGER where manager_name = '" + user + "'";
 	
 	myResultSet = stmt.executeQuery(mySQL);
 	if(myResultSet.next()){
 		temp_pass = myResultSet.getInt("manager_code");
 		input_pass = Integer.parseInt(password);
 		
 		if(input_pass == temp_pass)
	 		response.sendRedirect("admin.jsp");
 	}
 %>
<script>
	alert("사용자아이디 혹은 암호가 틀렸습니다.");
	location.href="flight_login.jsp";
</script>
<%
 	
 	stmt.close();
 	myConn.close();
 %>
