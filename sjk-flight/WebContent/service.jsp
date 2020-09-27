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
  
  #users{
  	margin-left: 30px;
  	padding-left: 10px;
  	background-color: #d2d2d7;
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

select{
	margin:15px;
	width: 150px;
}

  </style>
</head>
<body class="index-page sidebar-collapse">

<%
String userName =(String)session.getAttribute("user");
if(userName==null){
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
              <p><%=userName %> 님, 환영합니다</p></h5>
            </a>
          </li>
            </div>
        </ul>
      </div>
    </div>
  </nav>

	  <div class="wrapper">
		<div class = "main">
			<div class = "section section-images">
				<div class = "container">
				<%
int totalNum = Integer.parseInt(request.getParameter("totalNum"));
int adultNum = Integer.parseInt(request.getParameter("adultNum"));
int kidNum = Integer.parseInt(request.getParameter("kidNum"));
int infantNum = Integer.parseInt(request.getParameter("infantNum"));
String type = request.getParameter("type");
int run;
if(type.equals("oneway")) run =1;
else run = 2;
%>

<form method="post" action ="payment.jsp">
<h1 style = "margin-top:60px">항공권 예매</h1>
				<ul id = "reserveStatus">
					<li id = "status">STEP1. <br><h4>운임선택<h4></h4></li>
					<li id = "status"> STEP2. <h4>탑승자 정보입력</h4></li>
					<li id = "status" style = "background-color:#F96332;"><p style="color:white; font-size:22px;">STEP3. <br>부가서비스 선택</p></li>
					<li id = "status">STEP4. <h4>항공권 결제</h4></li>					
				</ul>
<div id = "content">
		<img src="./img/jeju_orange.PNG">   
        <h2 class="font-color">사전 수하물 구매</h2> 
<%
for(int i=1;i<=run;i++){
	%>
	<h4>>구간<%=i %></h4>
	<%
	for(int j=0;j<totalNum;j++){
		%><div id = "users"><p><b>
			<%=request.getParameter("firstName"+j) %></b>
			<select name = "addKG<%=i%><%=j%>">
			<option value ="0">+0KG</option>
			<option value ="5">+5KG (+5000)</option>
			<option value ="10">+10KG (+10000)</option>
			<option value ="15">+15KG (+15000)</option>
			<option value ="20">+20KG (+20000)</option>
			</select>
			<br>
			</p>
			</div>
		<%
	}
}
%>
<br>
<img src="./img/jeju_orange.PNG"> 
<h2 class="font-color">사전 기내식 주문</h2> 
<%
for(int i=1;i<=run;i++){
	%>
	<h4>>구간<%=i %></h4>
	<%
	for(int j=0;j<totalNum;j++){
		%><div id = "users"><p><b>
			<%=request.getParameter("firstName"+j) %></b>
			<select name = "addMeal<%=i%><%=j%>">
			<option value ="0">선택안함</option>
			<option value ="샐러드">샐러드 (+3000)</option>
			<option value ="파스타">파스타 (+7000)</option>
			<option value ="비빔밥">비빔밥 (+6500)</option>
			</select>
			<br>
			</p>
			</div>
		<%
	}
}
%>


<%
	FlightDAO flightDAO = new FlightDAO();
	String departureCode = request.getParameter("departureCode");
	String arrivalCode = request.getParameter("arrivalCode");
	int money = 0;
	int departureMoney = 0;
	int arrivalMoney = 0;
	int totalMoney = 0;
	if(departureCode != null){
		departureMoney = flightDAO.getMoney(departureCode);
		if(arrivalCode != null){
			arrivalMoney= flightDAO.getMoney(arrivalCode);
		}
	}
	money = departureMoney + arrivalMoney;
	
	totalMoney += money * adultNum;
	totalMoney += money * kidNum * 0.7;
	totalMoney += money * infantNum * 0.5;
%>

<%
Flight[] departureFlight = new Flight[totalNum];
Flight[] arrivalFlight = new Flight[totalNum];

for(int i = 0;i<totalNum;i++){
	departureFlight[i] = new Flight();
	departureFlight[i].setFlightCode(request.getParameter("departureCode"));
	if(i <adultNum)
		departureFlight[i].setFlightCost(departureMoney);
	else if(i <adultNum + kidNum)
		departureFlight[i].setFlightCost((int)(departureMoney*0.7));
	else departureFlight[i].setFlightCost((int)(departureMoney*0.5));
	departureFlight[i].setUserCode(request.getParameter("userID"+i));
	departureFlight[i].setPassengerName(request.getParameter("firstName"+i));
	
	session.setAttribute("departureFlight"+i,departureFlight[i]);
}

if(!type.equals("oneway")){
	for(int i = 0;i<totalNum;i++){
		arrivalFlight[i] = new Flight();
		arrivalFlight[i].setFlightCode(request.getParameter("arrivalCode"));
		if(i <adultNum)
			arrivalFlight[i].setFlightCost(arrivalMoney);
		else if(i <adultNum + kidNum)
			arrivalFlight[i].setFlightCost((int)(arrivalMoney*0.7));
		else arrivalFlight[i].setFlightCost((int)(arrivalMoney*0.5));
		arrivalFlight[i].setUserCode(request.getParameter("userID"+i));
		arrivalFlight[i].setPassengerName(request.getParameter("firstName"+i));
		
		session.setAttribute("arrivalFlight"+i,arrivalFlight[i]);
	}
}
%>

<input type = "hidden" name = "departureCode" value = "<%=request.getParameter("departureCode") %>">
<input type = "hidden" name = "arrivalCode" value = "<%=request.getParameter("arrivalCode") %>">

<input type = "hidden" name = "money" value  = "<%=money %>">
<input type = "hidden" name = "totalMoney" value ="<%=totalMoney %>">
<input type = "hidden" name = "run" value ="<%=run %>">
<input type = "hidden" name = "adultNum" value =<%=adultNum %>>
<input type = "hidden" name = "kidNum" value =<%=kidNum %>>
<input type = "hidden" name = "infantNum" value =<%=infantNum %>>
<input type = "hidden" name = "totalNum" value ="<%=totalNum%>">
<input type = "hidden" name = "type" value = "<%=type %>">

 <button type = "submit" class="btn-3">NEXT</button>
</form>
<br><br><br><br>
</div>
				</div>
			</div>
		</div>
</div>

</body>
</html>

