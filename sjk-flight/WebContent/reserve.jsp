<%@page import="flight.FlightDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "flight.Flight" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <link rel="apple-touch-icon" sizes="76x76" href="./img/apple-icon.png">
  <link rel="icon" type="image/png" href="./img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    SJK Air
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  
  <link href="./css/bootstrap.min.css" rel="stylesheet" />
  <link href="./css/now-ui-kit.css?v=1.2.0" rel="stylesheet" />
  
  <style>
  .font-color {
        color: #f96332;
      }
      
  table {
    width: 100%;
    border-top: 1px solid #e5e5e5;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #e5e5e5;
    padding: 10px;
  }
  .tr_font{
  	font-weight:bold;
  	fonr-size:30pt;
  }
  .tr_font2{
    font-weight:bold;
  	fonr-size:50pt;
  }
  
  #p_color{
   font-color:"white";
  }

  footer{ position:fixed; 
  left:0px; 
  bottom:0px; 
  height:20px; 
  width:100%; 
  background:#d2d2d7; 
  color: white; 
  }
  
  #reserveStatus{
    float: left;
    left:50%;
    width: 100%;
  	list-style:none;
  	margin:20px;
  	padding:0;
  	both:clear;
  }
  
  #status{
 	width: 18%;
  	margin-right:30px;
	padding-top: 15px;
	padding-left: 10px;
  	border: 0;
  	float: left;
  }
  
    #content{
  	margin-left: 50px;
  }
  
/* GENERAL BUTTON STYLING */
button,
button::after {
  -webkit-transition: all 0.3s;
    -moz-transition: all 0.3s;
  -o-transition: all 0.3s;
    transition: all 0.3s;
}

button {
  width: 100px;
  float:right;
  background: none;
  border: 3px solid #f96332;
  margin: 20px;
  color: #f96332;
  display: block;
  font-size: 1.0em;
  font-weight: bold;
  position: relative;
  text-transform: uppercase;
}

button::before,
button::after {
  background: #f96332;
  content: '';
  position: absolute;
  z-index: -1;
}

button:hover {
  background: #f96332;
  color: #fff;
}

/* BUTTON 3 */
.btn-3::after {
  height: 0;
  left: 50%;
  top: 50%;
  width: 0;
}

.btn-3:hover:after {
  height: 100%;
  left: 0;
  top: 0;
  width: 100%;
}


  </style>
</head>
<body class="index-page sidebar-collapse">

<%String id = (String)session.getAttribute("user");
if(id==null){
	%>
	<script>
	alert('로그인 후 이용하세요')
	history.back()
	</script>
	<%
}

%>

  <nav class="navbar navbar-expand-lg bg-primary fixed-top navbar-light " color-on-scroll="400">
    <div class="container">
      <div class="navbar-translate">
        <a class="navbar-brand" rel="tooltip" title="GO TO SJK AIR'S MAIN PAGE" data-placement="bottom" target="_blank">
           <h3>SJK AIR</h3>
        </a>
        <button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-bar top-bar"></span>
          <span class="navbar-toggler-bar middle-bar"></span>
          <span class="navbar-toggler-bar bottom-bar"></span>
        </button>
      </div>
      <div class="collapse navbar-collapse justify-content-end" id="navigation" data-nav-image="./assets/img/blurred-image-1.jpg">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="javascript:void(0)">
              <h5><i class="now-ui-icons gestures_tap-01"></i>
              <p>Reservation</p></h5>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Mypage.jsp">
              <h5><i class="now-ui-icons business_badge"></i>
              <p>Mypage</p></h5>
            </a>
          </li>
          <li class="nav-item">
             <a class="nav-link" href="javascript:void(0)">
              <h5><i class="now-ui-icons ui-1_send"></i>
              <p>Q/A</p></h5>
            </a>
          </li>
          <li class="nav-item">
             <a class="nav-link" href="javascript:void(0)">
             <h5><i class="now-ui-icons ui-1_lock-circle-open"></i>
              <p><%=id %> 님, 환영합니다</p></h5>
            </a>
          </li>
            </div>
        </ul>
      </div>
  </nav>

  <div class="wrapper">
		<div class = "main">
			<div class = "section section-images">
				<div class = "container">
				<h1 style = "margin-top:60px">항공권 예매</h1>
				<ul id = "reserveStatus">
					<li id = "status" style = "background-color:#F96332;"><p style="color:white; font-size:25px;">STEP1. <br>운임선택</p></li>
					<li id = "status">STEP2. <h4>탑승자 정보입력</h4></li>
					<li id = "status">STEP3. <h4>부가서비스 선택</h4></li>
					<li id = "status">STEP4. <h4>항공권 결제</h4></li>					
				</ul>
				<div id ="content">
<%
FlightDAO flightDAO = new FlightDAO();
int adultNum  = Integer.parseInt(request.getParameter("adultNum"));
int kidNum  = Integer.parseInt(request.getParameter("kidNum"));
int infantNum  = Integer.parseInt(request.getParameter("infantNum"));
String type = request.getParameter("type");%>
<form method = "post" action="insertInfo.jsp">
<input type ="hidden" name ="adultNum" value = <%=adultNum %>>
<input type ="hidden" name ="kidNum" value = <%=kidNum %>>
<input type ="hidden" name ="infantNum" value = <%=infantNum %>>
<input type ="hidden" name ="type" value = "<%=type%>">
<%
if(type.equals("round")){
	
	String departure = request.getParameter("departure");
	String destination = request.getParameter("destination");
	String depArr1[] = request.getParameter("departure_date1").split("/");
	String depArr2[] = request.getParameter("departure_date2").split("/");
	String departure_date1 = depArr1[2]+"-"+depArr1[0]+"-"+depArr1[1];
	String departure_date2 = depArr2[2]+"-"+depArr2[0]+"-"+depArr2[1];
	String[][] flights1 = flightDAO.getFlight(departure, destination, departure_date1);
	String[][] flights2 = flightDAO.getFlight(destination, departure, departure_date2);
	%>
	<h3 style = "margin-top:30px">구간1: <%=departure %> - <%=destination %></h3>
	<h5 style = "margin-top:30px"><%=departure_date1 %></h5>
			<table>
			<tr><th>편명</th><th>출발시간</th><th>도착시간</th><th>운임가격</th></tr>
				<%
	if(flights1!= null){
		for(int i=0; i<flights1.length;i++){
			if(flights1[i][0]!=null){
				%>
				<tr>
				<td><%=flights1[i][0]%></td><td><%=flights1[i][1] %></td><td><%=flights1[i][2]%></td><td><label><%=flights1[i][3] %> <input type = radio name = "departureCode" value = <%=flights1[i][0] %>></label></td>
				</tr>
				<%
			}
		}
	}
	%>
	</table>
					
	<h3 style = "margin-top:30px">구간2: <%=destination %> - <%=departure %></h3>
	<h5 style = "margin-top:30px"><%=departure_date2 %></h5>
	<table>
	<tr><th>편명</th><th>출발시간</th><th>도착시간</th><th>운임가격</th></tr>
	<%
	if(flights2!= null){
		for(int i=0; i<flights2.length;i++){
			if(flights2[i][0]!=null){
				%>
				<tr>
				<td><%=flights2[i][0]%></td><td><%=flights2[i][1] %></td><td><%=flights2[i][2]%></td><td><label><%=flights2[i][3] %> <input type = radio name = "arrivalCode" value = <%=flights2[i][0] %>></label></td>
				</tr>
				<%
			}
		}
	}
	%>
	</table>
				  <button type = "submit" class="btn-3">NEXT</button>

	
	<%
}
%>

<%
if(type.equals("oneway")){
	String departure = request.getParameter("departure");
	String destination = request.getParameter("destination");
	String depArr1[] = request.getParameter("departure_date1").split("/");
	String departure_date = depArr1[2]+"-"+depArr1[0]+"-"+depArr1[1];
	String[][] flights = flightDAO.getFlight(departure, destination, departure_date);
	%>

	<h3 style = "margin-top:30px">구간1: <%=departure %> - <%=destination %></h3>
	<h5 style = "margin-top:30px"><%=departure_date %></h3>
			<table>
			<tr><th>편명</th><th>출발시간</th><th>도착시간</th><th>운임가격</th></tr>
				<%
	if(flights!= null){
		for(int i=0; i<flights.length;i++){
			if(flights[i][0]!=null){
				%>
				<tr>
				<td><%=flights[i][0]%></td><td><%=flights[i][1] %></td><td><%=flights[i][2]%></td><td><label><%=flights[i][3] %> <input type = radio name = "departureCode" value = <%=flights[i][0] %>></label></td>
				</tr>
				<%
			}
		}
	}
	%>
	</table>				
				  <button type = "submit" class="btn-3">NEXT</button>

	
	<%
}
%>

<%
if(type.equals("multiway")){
	String departure = request.getParameter("departure");
	String destination = request.getParameter("destination");
	String departure1 = request.getParameter("departure1");
	String destination1 = request.getParameter("destination1");
	String depArr1[] = request.getParameter("departure_date1").split("/");
	String depArr2[] = request.getParameter("departure_date2").split("/");
	String departure_date1 = depArr1[2]+"-"+depArr1[0]+"-"+depArr1[1];
	String departure_date2 = depArr2[2]+"-"+depArr2[0]+"-"+depArr2[1];
	String[][] flights1 = flightDAO.getFlight(departure, destination, departure_date1);
	String[][] flights2 = flightDAO.getFlight(departure1, destination1, departure_date2);
	%>

	<h3 style = "margin-top:30px">구간1: <%=departure %> - <%=destination %></h3>
	<h5 style = "margin-top:30px"><%=departure_date1 %></h3>
			<table>
			<tr><th>편명</th><th>출발시간</th><th>도착시간</th><th>운임가격</th></tr>
				<%
	if(flights1!= null){
		for(int i=0; i<flights1.length;i++){
			if(flights1[i][0]!=null){
				%>
				<tr>
				<td><%=flights1[i][0]%></td><td><%=flights1[i][1] %></td><td><%=flights1[i][2]%></td><td><label><%=flights1[i][3] %> <input type = radio name = "departureCode" value = <%=flights1[i][0] %>></label></td>
				</tr>
				<%
			}
		}
	}
	%>
	</table>
					
	<h3 style = "margin-top:30px">구간2: <%=departure1 %> - <%=destination1 %></h3>
	<table>
	<tr><th>편명</th><th>출발시간</th><th>도착시간</th><th>운임가격</th></tr>
	<%
	if(flights2!= null){
		for(int i=0; i<flights2.length;i++){
			if(flights2[i][0]!=null){
				%>
				<tr>
				<td><%=flights2[i][0]%></td><td><%=flights2[i][1] %></td><td><%=flights2[i][2]%></td><td><label><%=flights2[i][3] %> <input type = radio name = "arrivalCode" value = <%=flights2[i][0] %>></label></td>
				</tr>
				<%
			}
		}
	}
	%>
	</table>
				  <button type = "submit" class="btn-3">NEXT</button>

	
	<%
}
%>


</div>
				</div>
			</div>
		</div>
</div>



</form>
</body>
</html>