<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import ="java.sql.*" %>
    <%@ page import ="java.math.*" %>
    <%@ page import ="java.util.*" %>
<html>
<head>
<title>회원가입</title>
</head>
<body>
<%
	int random[] = new int[10];

	for(int i=0; i<random.length;i++) {
		random[i] = (int)((Math.random()*45)+1)%10;
	}
	
	String user_code = "";
	
	for(int i=0;i<4;i++) {
		int temp = random[i]%4;
		if(temp == 0) user_code += 'a';
		else if(temp==1) user_code += 'b';
		else if(temp==2) user_code += 'c';
		else user_code += 'd';
	}
	for(int i=4; i<10;i++) {
		user_code += random[i];
	}


	Connection myConn = null;
	Statement stmt = null;
	String mySQL = null;
	
	int zero = 0;
	
	
	String id = new String(request.getParameter("id"));
	String password = new String(request.getParameter("password"));
	String english_name = new String(request.getParameter("english_name"));
	String passport_number = new String(request.getParameter("passport_number"));
	String birthday = new String(request.getParameter("birthday"));
	String nationality = new String(request.getParameter("nationality"));
	String country = new String(request.getParameter("country"));
	String email = new String(request.getParameter("email"));
	String phone_number = new String(request.getParameter("phone_number"));
	int email_yesorno = new Integer(request.getParameter("email_yesorno"));
	
	try{
	String dbURL = "jdbc:mysql://sjk-flight.co0uj2jb0gsx.ap-northeast-2.rds.amazonaws.com:3306/FLIGHT?user=admin&password=123456789";
	String dbID = "admin";
	String dbPassword = "123456789";
	Class.forName("com.mysql.jdbc.Driver");
	myConn = DriverManager.getConnection(dbURL,dbID,dbPassword);
	stmt = myConn.createStatement();

	
 	mySQL = "INSERT INTO USER VALUES ('";
 	mySQL = mySQL +  user_code + "', ";
	mySQL = mySQL +  (zero+1) + " , ";
	mySQL = mySQL +  zero + " , '";
	mySQL = mySQL +  id + "' , '";
	mySQL = mySQL +  password + "' , '";
	mySQL = mySQL +  english_name + "' , '";
	mySQL = mySQL +  birthday + "' , '";
	mySQL = mySQL +  passport_number + "' , '";
	mySQL = mySQL +  nationality + "' , '";
	mySQL = mySQL +  country + "' , '";
	mySQL = mySQL +  email + "' , ";
	mySQL = mySQL +  email_yesorno + " , '"; 
	mySQL = mySQL +  phone_number + "') ";
 	
 	stmt.executeUpdate(mySQL);
	
%>
<script>
	alert("회원가입이 완료되었습니다.");
	location.href="flight_login.jsp";
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
	location.href = "flight_login.jsp";
	<%}%>
</script>
</body>
</html>