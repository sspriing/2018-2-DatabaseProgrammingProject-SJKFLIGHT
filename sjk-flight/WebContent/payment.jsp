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

<%
int money = Integer.parseInt(request.getParameter("totalMoney"));
int serviceMoney = 0;
int totalMoney = 0;
int run = Integer.parseInt(request.getParameter("run"));
int totalNum = Integer.parseInt(request.getParameter("totalNum"));
String departureCode = request.getParameter("departureCode");
String destinationCode = request.getParameter("destinationCode");
String adultNum = request.getParameter("adultNum");
String kidNum = request.getParameter("kidNum");
String infantNum = request.getParameter("infantNum");
String type = request.getParameter("type");

String mealType;
int luggage;

Flight[] departureFlight = new Flight[totalNum];
Flight[] arrivalFlight = new Flight[totalNum];

for(int j=0;j<totalNum;j++){
	mealType = request.getParameter("addMeal"+String.valueOf(1)+String.valueOf(j));
	luggage = Integer.parseInt(request.getParameter("addKG"+String.valueOf(1)+String.valueOf(j)));
	serviceMoney += luggage*1000;
	if( mealType.equals("샐러드"))
		serviceMoney +=3000;
	else if(mealType.equals("파스타"))
		serviceMoney += 7000;
	else if(mealType.equals("비빔밥"))
		serviceMoney += 6500;
	departureFlight[j] = (Flight)session.getAttribute("departureFlight"+j);
	departureFlight[j].setMealType(mealType);
	departureFlight[j].setLuggage(luggage);
}

if(!type.equals("oneway")){
for(int j=0;j<totalNum;j++){
	mealType = request.getParameter("addMeal"+String.valueOf(2)+String.valueOf(j));
	luggage = Integer.parseInt(request.getParameter("addKG"+String.valueOf(2)+String.valueOf(j)));
	serviceMoney += luggage*1000;
	if( mealType.equals("샐러드"))
		serviceMoney +=3000;
	else if(mealType.equals("파스타"))
		serviceMoney += 7000;
	else if(mealType.equals("비빔밥"))
		serviceMoney += 6500;
	arrivalFlight[j] = (Flight)session.getAttribute("arrivalFlight"+j);
	arrivalFlight[j].setMealType(mealType);
	arrivalFlight[j].setLuggage(luggage);
}
}
totalMoney = money + serviceMoney;
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
					<li id = "status">STEP1. <h4>운임선택</h4></li>
					<li id = "status">STEP2. <h4>탑승자 정보입력</h4></li>
					<li id = "status">STEP3. <h4>부가서비스 선택</h4></li>
					<li id = "status" style = "background-color:#F96332;"><p style="color:white; font-size:25px;">STEP4. <br>항공권 결제</p></li>				
				</ul>
				<div id ="content">
				<form action = "paymentAction.jsp" method = "post">
		<img src="./img/jeju_orange.PNG">   
        <h2 class="font-color">결제수단 선택</h2> 
        <div style = "float: left;margin-left:100px">
        <img src="./img/credit.png" style = "width:100px;height:auto">  <br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;신용카드<input type ="radio" name="payment"value ="creditCard"></div>
		<div style = "float:left;margin-left:50px">
		<img src="./img/cash.png" style = "width:90px;height:auto">  <br>
		&nbsp;&nbsp;무통장입금<input type ="radio" name="payment" value ="realMoney"></div>
		
		<table style = "width: 70%;margin-top: 200px;margin-left:70px;clear:both">
		<tr><h4><td>운임가격 </td> <td><%=money %></td></h4></tr>
		<tr><h4><td>추가 서비스 가격 </td> <td><%=serviceMoney %></td></h4></tr>
		</table>
		<h3 style = "margin-top:30px;float:right;margin-right:250px">결제예정 금액 : <%= money + serviceMoney %><br><br>
						<button type = "submit" class="btn-3" style = "float:right;width: 200px">결제하기</button>		
		</h3>
		
		<input type = "hidden" name = "totalMoney" value = "<%=totalMoney%>">
		<input type = "hidden" name = "money" value = "<%=money%>">
		<input type = "hidden" name = "serviceMoney" value = "<%=serviceMoney %>">
		<input type = "hidden" name = "run" value = "<%=run %>">
		<input type = "hidden" name = "totalNum" value  ="<%=totalNum %>">
		<input type = "hidden" name = "type" value = "<%=type %>">
		</form>
				</div>

			</div>
		</div>
</div>
</div>
</body>
</html>