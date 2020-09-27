<%@page import="flight.FlightDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "flight.Flight" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	session.setAttribute("id", "1234");
%>
<form method = "post" action = "reserve.jsp">
<input type = "hidden" name = "adultNum" value ="1">
<input type = "hidden" name = "kidNum" value ="1">
<input type = "hidden" name = "infantNum" value ="0">
<input type = "hidden" name = "type" value ="round">
<input type = "hidden" name = "departure" value ="GMP">
<input type = "hidden" name = "destination" value ="CJU">
<input type = "hidden" name = "departure_date1" value ="2018/12/06">
<input type = "hidden" name = "departure_date2" value = "2018/12/10">
<input type = "submit">
</form>
</body>
</html>