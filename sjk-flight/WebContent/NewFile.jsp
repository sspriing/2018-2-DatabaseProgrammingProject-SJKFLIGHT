<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "flight.Flight" %>
    <%@ page import  = "flight.FlightDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body><%
FlightDAO flightDAO = new FlightDAO();
String[] a = flightDAO.getDate().split(" |:|-");
String date = null;
for(int i = 0; i <a.length;i++){
date = a[0]+"-"+a[1]+"-"+a[2];
		} %>
		<%=date %>
<%
	flightDAO.insertPayment("123420180815", 10000);
%>
</body>
</html>