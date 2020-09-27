<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import ="java.sql.*" %>
<html>
<head>
<title>회원 정보 수정</title>
</head>
<body>
<%
	String user_id = (String)session.getAttribute("user");

	Connection myConn = null;
	Statement stmt = null;
	String mySQL = null;
	
	String nationality = new String(request.getParameter("nationality").getBytes("8859_1"),"utf-8");
	String password = new String(request.getParameter("password").getBytes("8859_1"),"utf-8");
	String country = new String(request.getParameter("country").getBytes("8859_1"),"utf-8");
	String email = new String(request.getParameter("email").getBytes("8859_1"),"utf-8");
	String phone_number = new String(request.getParameter("phone_number"));
	String birthday = new String(request.getParameter("birthday").getBytes("8859_1"),"utf-8");
	int email_yesorno = new Integer(request.getParameter("email_yesorno"));
	
	try{
	String dbURL = "jdbc:mysql://sjk-flight.co0uj2jb0gsx.ap-northeast-2.rds.amazonaws.com:3306/FLIGHT?user=admin&password=123456789";
	String dbID = "admin";
	String dbPassword = "123456789";
	Class.forName("com.mysql.jdbc.Driver");
	myConn = DriverManager.getConnection(dbURL,dbID,dbPassword);
	stmt = myConn.createStatement();

 	
 	mySQL = "update USER ";
	mySQL = mySQL + " set nationality = '" + nationality + "' , ";
	mySQL = mySQL + " password = '" + password + "' , ";
	mySQL = mySQL + " country = '" + country + "' , ";
	mySQL = mySQL + " email = '" + email + "' , ";
	mySQL = mySQL + " phone_number = " + phone_number + " , ";
	mySQL = mySQL + " email_yesorno = " + email_yesorno + " , ";
	mySQL = mySQL + " birthday = '" + birthday  + "' where id ='" + user_id + "' ";

	stmt.executeUpdate(mySQL);
%>
<script>
	alert("정보가 수정되었습니다.");
	location.href="Mypage_Info.jsp";
</script>
<%
 	} catch (SQLException ex) {
 		String sMessage;
 		if(ex.getErrorCode() == 20002) sMessage="암호는 4자ㅣ 이상이어야 합니다.";
 		else if (ex.getErrorCode() == 20003) sMessage ="암호에 공란은 입력되지 않습니다.";
 		else sMessage = "잠시 후 다시 시도해 주세요.";
%>
<script>
	alert("<%=sMessage %>");
	location.href = "Mypage_Info.jsp";
	<%}%>
</script>
</body>
</html>