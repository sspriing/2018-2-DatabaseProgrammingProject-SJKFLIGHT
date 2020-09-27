
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

<%String id = (String)session.getAttribute("id"); 
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
				<h1 style = "margin-top:200px"><center>결제완료 되었습니다!!</center></h1>
				<%
FlightDAO flightDAO = new FlightDAO();
String user_code = (String)session.getAttribute("id");

String departure = request.getParameter("departureCode");
String destination = request.getParameter("arrivalCode");
int totalMoney = Integer.parseInt(request.getParameter("totalMoney"));
int run = Integer.parseInt(request.getParameter("run"));
String adultNum = request.getParameter("adultNum");
String kidNum = request.getParameter("kidNum");
String infantNum = request.getParameter("infantNum");
int totalNum = Integer.parseInt(request.getParameter("totalNum"));
String type = request.getParameter("type");
int money = Integer.parseInt(request.getParameter("money"));
String payment = request.getParameter("payment");
String reservationCode = null;

int way_code = 0;
int paymentCode = 0;

if(payment.equals("creditCard")) paymentCode = 0;
else paymentCode = 1;

if(type.equals("oneway"))
	way_code = 0;
else if(type.equals("round"))
	way_code = 1;
else way_code = 2;

reservationCode = flightDAO.insertReservation(user_code, totalNum, totalMoney, way_code);
flightDAO.insertPayment(reservationCode, totalMoney);

Flight[] departureFlight = new Flight[totalNum];
Flight[] arrivalFlight = new Flight[totalNum];
%>

<img src="./img/jeju_orange.PNG" style = "margin-left:100px"> 
<h2 class="font-color" style = "margin-left:100px">구간1</h2> 
<%

for(int i=0;i<totalNum;i++){
	departureFlight[i] = (Flight)session.getAttribute("departureFlight"+i);
	flightDAO.insertReservationDetail(
			reservationCode, departureFlight[i].getFlightOrder(),
			departureFlight[i].getFlightCode(), 1000, 0, 
			departureFlight[i].getMealType(), departureFlight[i].getLuggage(),
			departureFlight[i].getUserCode(),departureFlight[i].getPassengerName()			);
	flightDAO.insertPaymentDetail(
			reservationCode, paymentCode, totalMoney, 
			departureFlight[i].getLuggage(), 1000, 1000);
	%>
	<table style = "margin-left: 100px">
	<tr><th><%=departureFlight[i].getPassengerName() %></th><th></th></tr>
	<tr><td>운항번호</td><td><%=departureFlight[i].getFlightCode() %></td></tr>
	<tr><td>출발지</td><td><%=flightDAO.getDepDes(departureFlight[i].getFlightCode())[0]%></td></tr>
	<tr><td>목적지</td><td><%=flightDAO.getDepDes(departureFlight[i].getFlightCode())[1]%></td></tr>
	<tr><td>운항금액</td><td><%=departureFlight[i].getFlightCost() %></td></tr>
	<tr><td>수하물 추가금액</td><td><%=departureFlight[i].getLuggage()*1000 %></td></tr>
	<tr><td>기내식 추가</td><td><%=departureFlight[i].getMealType() %></td></tr>	
	</table>
	<%
}

if(!type.equals("oneway")){
	%>
	<img src="./img/jeju_orange.PNG" style = "margin-left:100px"> 
<h2 class="font-color" style = "margin-left:100px">구간2</h2> 
	
	<%
	
	for(int i=0;i<totalNum;i++){
		arrivalFlight[i] = (Flight)session.getAttribute("arrivalFlight"+i);
		flightDAO.insertReservationDetail(
				reservationCode, arrivalFlight[i].getFlightOrder(),
				arrivalFlight[i].getFlightCode(), 1000, 0, 
				arrivalFlight[i].getMealType(), arrivalFlight[i].getLuggage(),
				arrivalFlight[i].getUserCode(),arrivalFlight[i].getPassengerName()			);
		flightDAO.insertPaymentDetail(
				reservationCode, paymentCode, totalMoney, 
				arrivalFlight[i].getLuggage(), 1000, 1000);
		%>
		<table style = "margin-left: 100px">
		<tr><th><%=arrivalFlight[i].getPassengerName() %></th><th></th></tr>
		<tr><td>운항번호</td><td><%=arrivalFlight[i].getFlightCode() %></td></tr>
		<tr><td>출발지</td><td><%=flightDAO.getDepDes(arrivalFlight[i].getFlightCode())[0]%></td></tr>
		<tr><td>목적지</td><td><%=flightDAO.getDepDes(arrivalFlight[i].getFlightCode())[1]%></td></tr>
		<tr><td>운항금액</td><td><%=arrivalFlight[i].getFlightCost() %></td></tr>
		<tr><td>수하물 추가금액</td><td><%=arrivalFlight[i].getLuggage()*1000 %></td></tr>
		<tr><td>기내식 추가</td><td><%=arrivalFlight[i].getMealType() %></td></tr>	
		</table>
		<%
	}
	
}
%>
	<h3 style = "margin-top: 50px;"><center>총 결제금액: <%=totalMoney %></center></h3>

				</div>
			</div>
		</div>
</div>

</body>
</html>