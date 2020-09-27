<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
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

  </style>
</head>
<body>
<body class="index-page sidebar-collapse">
<% 
	String session_id = (String)session.getAttribute("user");
	String session_name = (String)session.getAttribute("name");
	
 	Connection myConn = null;
 	Statement stmt = null;
 	String mySQL = null;
	
	String dbURL = "jdbc:mysql://sjk-flight.co0uj2jb0gsx.ap-northeast-2.rds.amazonaws.com:3306/FLIGHT?user=admin&password=123456789";
	String dbID = "admin";
	String dbPassword = "123456789";
	Class.forName("com.mysql.jdbc.Driver");
	myConn = DriverManager.getConnection(dbURL,dbID,dbPassword);
 	stmt = myConn.createStatement();
 	
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
        <ul class="navbar-nav"style ="float:left; ">
          <li class="nav-item">
            <a class="nav-link" href="javascript:void(0)">
              <h5><i class="now-ui-icons gestures_tap-01"></i>
              <p>Reservation</p></h5>
            </a>
          </li>
            </div>
        </ul>
      </div>
    </div>
  </nav>
  
  
  <div class="wrapper">
    <div class="main">
      <div class="section section-images">
        <div class="container">
        	<br><br><br>
                <div class="typography-line">
                  <h2>
                    <span>관리자 모드 - 데이터 목록</span> </h2>               
                        <hr color ="black" size = "10px">
                </div>
          <a name="마일리지조회">
      <img src="./img/jeju_orange.PNG"> 
                 <h2 class="font-color">　항공사 정보</h2> 
                 </a>
           <hr>       
             <!-- 데이터베이스에서 불러올 시에는 테이블에 값 넣는것에 수정 필요 -->      
      <table>
      <thead>
        <tr>
          <th>airport_code</th><th>airport_name</th><th>country</th><th>longitude</th><th>latitude</th><th>classification_code</th>
        </tr>
      </thead>
      <tbody>
      <%
   	mySQL = "select * from AIRPORT";
   	
   	ResultSet myResultSet = stmt.executeQuery(mySQL);
   	while(myResultSet.next()){ 
   		String airport_code = myResultSet.getString("airport_code");
   		String airport_name = myResultSet.getString("airport_name");
   		String country = myResultSet.getString("country");
   		String longitude = myResultSet.getString("longitude");
   		String latitude = myResultSet.getString("latitude");
   		String classification_code = myResultSet.getString("classification_code");
   	%>
   	    <tr>
   	    <td><%=airport_code %></td><td><%=airport_name %></td><td><%=country %></td><td><%=longitude %></td><td><%=latitude %></td><td><%=classification_code %></td>   
        </tr>
   	<%	
   	}
      %>

      </tbody>
    </table>
      <br><br><br>
      <img src="./img/jeju_orange.PNG"> 
                 <h2 class="font-color">　비행일정</h2> 
           <hr>       
             <!-- 데이터베이스에서 불러올 시에는 테이블에 값 넣는것에 수정 필요 -->      
      <table>
      <thead>
        <tr>
          <th>flight_code</th><th>departure</th><th>destination</th><th>departure_date</th><th>arrival_date</th><th>departure_time</th><th>arrival_time</th>
          <th>airplane_code</th><th>price</th>
        </tr>
      </thead>
      <tbody>
      <%
   	mySQL = "select * from FLIGHT_SCHEDULE";
   	
    myResultSet = stmt.executeQuery(mySQL);
   	while(myResultSet.next()){ 
   		String flight_code = myResultSet.getString("flight_code");
   		String departure = myResultSet.getString("departure");
   		String destination = myResultSet.getString("destination");
   		String departure_date = myResultSet.getString("departure_date");
   		String arrival_date = myResultSet.getString("arrival_date");
   		String departure_time = myResultSet.getString("departure_time");
   		String arrival_time = myResultSet.getString("arrival_time");
   		String airplane_code = myResultSet.getString("airpaLne_code");
   		String price = myResultSet.getString("price");
   	%>
   	    <tr>
   	    <td><%=flight_code %></td><td><%=departure %></td><td><%=destination %></td><td><%=departure_date %></td><td><%=arrival_date %></td><td><%=departure_time %></td><td><%=arrival_time %></td> 
   	    <td><%=airplane_code %></td><td><%=price %></td>   
        </tr>
   	<%	
   	}
      %>
      </tbody>
    </table>
          <br><br><br>
          <a name="마일리지조회">
      <img src="./img/jeju_orange.PNG"> 
                 <h2 class="font-color">　조종사</h2> 
                 </a>
           <hr>       
             <!-- 데이터베이스에서 불러올 시에는 테이블에 값 넣는것에 수정 필요 -->      
      <table>
      <thead>
        <tr>
          <th>pilot_code</th><th>name</th><th>emp_date</th><th>salary</th>
        </tr>
      </thead>
      <tbody>
            <%
   	mySQL = "select * from PILOT";
   	
   	myResultSet = stmt.executeQuery(mySQL);
   	while(myResultSet.next()){ 
   		String pilot_code = myResultSet.getString("pilot_code");
   		String name = myResultSet.getString("name");
   		String emp_date = myResultSet.getString("emp_date");
   		String salary = myResultSet.getString("salary");
   	%>
   	    <tr>
   	    <td><%=pilot_code %></td><td><%=name %></td><td><%=emp_date %></td><td><%=salary %></td>
        </tr>
   	<%	
   	}
      %>
      </tbody>
    </table>
              <br><br><br>
          <a name="마일리지조회">
      <img src="./img/jeju_orange.PNG"> 
                 <h2 class="font-color">　승무원</h2> 
                 </a>
           <hr>       
             <!-- 데이터베이스에서 불러올 시에는 테이블에 값 넣는것에 수정 필요 -->      
      <table>
      <thead>
        <tr>
          <th>code</th><th>name</th><th>emp_date</th><th>salary</th>
        </tr>
      </thead>
      <tbody>
      <%
   	mySQL = "select * from STEWARDESS";
   	
   	myResultSet = stmt.executeQuery(mySQL);
   	while(myResultSet.next()){ 
   		String code = myResultSet.getString("stweardess_code");
   		String name = myResultSet.getString("name");
   		String emp_date = myResultSet.getString("emp_date");
   		String salary = myResultSet.getString("salary");
   	%>
   	    <tr>
   	    <td><%=code %></td><td><%=name %></td><td><%=emp_date %></td><td><%=salary %></td>
        </tr>
   	<%	
   	}
      %>
      </tbody>
    </table>
              <br><br><br>
          <a name="마일리지조회">
      <img src="./img/jeju_orange.PNG"> 
                 <h2 class="font-color">　회원</h2> 
                 </a>
           <hr>       
             <!-- 데이터베이스에서 불러올 시에는 테이블에 값 넣는것에 수정 필요 -->      
      <table>
      <thead>
        <tr>
          <th>code</th><th>mileage</th><th>id</th><th>password</th><th>english_name</th><th>birthday</th>
          <th>passport_number</th><th>nationality</th><th>country</th><th>email</th><th>phone_number</th>
        </tr>
      </thead>
      <tbody>
       <%
   	mySQL = "select * from USER";
   	
   	myResultSet = stmt.executeQuery(mySQL);
   	while(myResultSet.next()){ 
   		String user_code = myResultSet.getString("user_code");
   		String mileage = myResultSet.getString("mileage");
   		String id = myResultSet.getString("id");
   		String password = myResultSet.getString("password");
   		String english_name = myResultSet.getString("english_name");
   		String birthday = myResultSet.getString("birthday");
   		String passport_number = myResultSet.getString("passport_number");
   		String nationality = myResultSet.getString("nationality");
   		String country = myResultSet.getString("country");
   		String email = myResultSet.getString("email");
   		String phone_number = myResultSet.getString("phone_number");
   	%>
   	    <tr>
   	    <td><%=user_code %></td><td><%=mileage %></td><td><%=id %></td><td><%=password %></td><td><%=english_name %></td><td><%=birthday %></td><td><%=passport_number %></td><td><%=nationality %></td>
   	    <td><%=country %></td><td><%=email %></td><td><%=phone_number %></td>               
        </tr>
   	<%	
   	}
      %>
      </tbody>
    </table>
                            <br><br><br>
          <a name="마일리지조회">
      <img src="./img/jeju_orange.PNG"> 
                 <h2 class="font-color">　예약현황</h2> 
                 </a>
           <hr>       
             <!-- 데이터베이스에서 불러올 시에는 테이블에 값 넣는것에 수정 필요 -->      
      <table>
      <thead>
        <tr>
          <th>reservationcode</th><th>fligtorder</th><th>flightcode</th><th>boardingstatus</th><td>straightdistance</td>
          <td>seatcode</td><td>mealtype</td><td>luggageservicecode</td><td>passanger_name</td>
        </tr>
      </thead>
      <tbody>
      <%
   	mySQL = "select * from RESERVATIONDETAILS";
   	
   	myResultSet = stmt.executeQuery(mySQL);
   	while(myResultSet.next()){ 
   		String reservation_code = myResultSet.getString("reservationcode");
   		String flightorder = myResultSet.getString("flightorder");
   		String flightcode = myResultSet.getString("flightcode");
   		String boardingstatus = myResultSet.getString("boardingstatus");
   		String straightdistance = myResultSet.getString("straightdistance");
   		String seatcode = myResultSet.getString("seatcode");
   		String mealtype = myResultSet.getString("mealtype");
   		String luggageservicecode = myResultSet.getString("luggageservicecode");
   		String passanger_name = myResultSet.getString("passenger_name");
   	%>
   	    <tr>
   	    <td><%=reservation_code %></td><td><%=flightorder %></td><td><%=flightcode %></td><td><%=boardingstatus %></td><td><%=straightdistance %></td>
   	    <td><%=seatcode %></td><td><%=mealtype %></td><td><%=luggageservicecode %></td><td><%=passanger_name %></td>
        </tr>
   	<%	
   	}
      %>
      </tbody>
    </table>
    <br><br><br><br><br><br>
            <hr color ="black" size = "10px">
        </div>
      </div>
    </div>
  </div>
</body>
</html>