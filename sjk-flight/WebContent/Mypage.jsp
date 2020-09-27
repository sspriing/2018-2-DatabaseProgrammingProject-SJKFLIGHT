<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
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
	
	if (session_id==null) response.sendRedirect("flight_login.jsp");
	
 	Connection myConn = null;
 	Statement stmt = null;
 	String mySQL = null;
 	int count = 0;
 	int count2 = 0;
 	int boarding_count = 0;
 	int m_count = 0;
 	int boarding_flight_count  = 0;
 	String[] reservation_arr = new String[20];
 	String[] board_reserv_arr = new String[20];
 	String[] board_flight_code = new String[20];
 	String[] board_dep_date = new String[20];
 	String[] passenger_name = new String[30];
 	String[] board_departure = new String[10];
 	String[] board_destination = new String[10];
 	String[] m_code = new String[20];
 	String[] saving_date = new String[20];
 	int[] use_yesorno = new int[10];
 	int[] mileage = new int[20];
 	int[] way_code = new int[20];
 	String[] seat_code = new String[2];
	int[] boardingstatus = new int[2];	
	String[] flight_code = new String[2];
	int[] flight_order = new int[2];
	String user_code = "";
	String[] departure_date = new String[2];
	String[] destination = new String[2];
	int grade_code = 0;
 	int[] total_num = new int[2];
 	int[] flight_cost_i = new int[10];
 	double[] flight_cost_d = new double[10];
 	int[] straight_distance = new int[100];
 	int zero = 0;
    int available_m = 0;
 	
	String dbURL = "jdbc:mysql://sjk-flight.co0uj2jb0gsx.ap-northeast-2.rds.amazonaws.com:3306/FLIGHT?user=admin&password=123456789";
	String dbID = "admin";
	String dbPassword = "123456789";
	Class.forName("com.mysql.jdbc.Driver");
	myConn = DriverManager.getConnection(dbURL,dbID,dbPassword);
 	stmt = myConn.createStatement();
 	
 	
 	mySQL = "select user_code from USER where id ='" + session_id + "'";
 	
 	ResultSet myResultSet = stmt.executeQuery(mySQL);
 	if(myResultSet.next()){
 		user_code = myResultSet.getString("user_code");
 	}
 %>
<%
      mySQL =  "select mileagenumber,savingdate, mileageuse_yesorno  from MILEAGE where user_code ='"+user_code+"'";
      myResultSet = stmt.executeQuery(mySQL);
      while(myResultSet.next())
      {
    	m_code[m_count] = myResultSet.getString("mileagenumber");
    	saving_date[m_count] = myResultSet.getString("savingdate");
        use_yesorno[m_count] = myResultSet.getInt("mileageuse_yesorno");
        m_count++;
      }
     
      
     for(int i = 0; i<m_count; i++)
     {
         mySQL = "select mileage from NOTUSEMILEAGE where user_code = '"+user_code+"' AND mileage_code ='"+m_code[i]+"'";
         myResultSet = stmt.executeQuery(mySQL);
         while(myResultSet.next())
         {
           mileage[i] = myResultSet.getInt("mileage");
         }
     } 
     for(int i = 0; i<m_count; i++)
     {
         mySQL = "select mileage from USEMILEAGE where user_code = '"+user_code+"' AND mileage_code ='"+m_code[i]+"'";
         myResultSet = stmt.executeQuery(mySQL);
         while(myResultSet.next())
         {
           mileage[i] = myResultSet.getInt("mileage");
         }
     } 
    
     for(int i = 0; i < m_count; i++)
     {
    	
    	 if(use_yesorno[i] == 1)//미사용
    	 {
    		 available_m += mileage[i];
    	 }
    	 else
    	 {
    		 available_m -= mileage[i];
    	 }
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
          <li class="nav-item" style = "margin-top:10px; font-size:10px">
             <%
             	if(session_id == null){ 
             		%>
             		<a class = "nav_link" href="flight_login.jsp">
             		<%
             	} else {
             		%>
             		<a class = "nav_link" href = "logout.jsp">
             <%	}%>
             <h5><i class="now-ui-icons ui-1_lock-circle-open"></i><p>
             <%
             	if(session_id==null) {
             		%>
             		로그인
				<% }
				else { %>
					<%=session_name%>님 환영합니다!
				<%	}%>
			</p></h5>
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
        	<br><br>
             <h1 class="title">My Page</h1>
             <hr color ="black" size = "5px">
                <div class="typography-line">
                  <h2>
                    <span> <%=session_name%> 고객님, 안녕하세요 !</span> </h2>               
                    <button class="btn btn-neutral btn-sm" style="float:right;" onclick="location.href='Mypage_Info.jsp' "><i class="now-ui-icons ui-2_settings-90"></i>　회원정보수정</button></a>
                </div>
                
                
              <div class="pointInfoWrap1 mt40">
					<ul style = "list-style:none;">
						<li style="float:left; background-color: #f96332;">
							<p style="color:white; font-size:25px;">　　현재 나의 등급은　　</p>
							<%
							mySQL = "select grade_code from USERGRADECHECK where user_code ='" + user_code + "'";
	
							myResultSet = stmt.executeQuery(mySQL);
							if(myResultSet.next()){
								grade_code = myResultSet.getInt("grade_code");
							}
							%>					
							<p style="color:white; font-size:40px;" align ="center"> 
							<% if(grade_code == 0) {%> Silver <%} else if(grade_code ==1) { %>Silver + <%} else if(grade_code ==2) { %>Gold<%} else { %>Vip <%} %>
							</p>
							<p style="color:white; font-size:12px;">　　　　자세한 등급별혜택은 고객센터문의　　</p>								
						</li>
						<li style = "background-color: white;">
							<a href="#마일리지조회" style="text-decoration: none;">
							<p style="color:black; font-size:25px;" align="center">                                      현재 나의 마일리지는</p>
							<p style="color:black; font-size:50px;"align="center"><%=available_m%>P</p>
						<p style="color:black; font-size:13px;"align="center">현재 가용 포인트 입니다.</p>
							</a>
						</li>
					</ul>
				</div>
                
                <br><br><br>

           <img src="./img/jeju_orange.PNG">   
           <h2 class="font-color">　예약조회</h2> 
           <hr>       
            <!--  예약조회는 탑승전 내역만 불러온다 -->
             <!-- 데이터베이스에서 불러올 시에는 테이블에 값 넣는것에 수정 필요 -->      
      <table>
      <thead>
        <tr>
          <th>예약번호</th><th>구분</th><th>좌석</th><th>상태</th><th>출발일</th><th>목적지</th>
        </tr>
      </thead>
      <tbody>
        <%
        mySQL = "select reservationcode, way_code from RESERVATION where user_code ='" + user_code + "'"; 
        myResultSet = stmt.executeQuery(mySQL);
        
     	while(myResultSet.next()){
     		reservation_arr[count] = myResultSet.getString("reservationcode");
     		way_code[count] = myResultSet.getInt("way_code");
     		count++;
     	}
     	
     	for(int i=0; i<count;i++) {
     		mySQL = "select boardingstatus, seatcode, flightcode, flightorder from RESERVATIONDETAILS where reservationcode = '" + reservation_arr[i] +"'AND boardingstatus = '" +zero+"'"; 	
     		
     		myResultSet = stmt.executeQuery(mySQL);
     		while(myResultSet.next()){
     			seat_code[count2] = myResultSet.getString("seatcode");
     			boardingstatus[count2] = myResultSet.getInt("boardingstatus");
     			flight_code[count2] = myResultSet.getString("flightcode");
     			flight_order[count2] = myResultSet.getInt("flightorder");
     			count2++;
     		}
     		for(int j=0;j<count2;j++) {
 			mySQL = "select departure_date, destination from FLIGHT_SCHEDULE where flight_code = '" + flight_code[j] + "'";
 			myResultSet = stmt.executeQuery(mySQL);
 			if(myResultSet.next()) {
 				departure_date[j] = myResultSet.getString("departure_date");
 				destination[j] = myResultSet.getString("destination");
 			}
     		}
     		
     		for(int j = 0; j<count2; j++) {
     		%>
     			<tr>
     			<td><%=reservation_arr[i]%></td>
     			<td><%if(way_code[i] == 1) {%>편도 <%} else if(way_code[i] ==0 || way_code[i] ==2){ %>구간<%=flight_order[j]%><%} %></td>
     			<td><%=seat_code[j]%></td>
     			<td><%if(boardingstatus[j] == 0){%>탑승전<%}%></td>
     			<td><%=departure_date[j] %></td>
     			<td><%=destination[j] %></td>
     			</tr>
     		<% 
     		}
     		count2=0;
     	}
     	%>

      </tbody>
      </table>
      
      <br><br><br>
      <img src="./img/jeju_orange.PNG"> 
                 <h2 class="font-color">　탑승내역</h2> 
           <hr>       
             <!-- 데이터베이스에서 불러올 시에는 테이블에 값 넣는것에 수정 필요 -->      
      <table>
      <thead>
        <tr>
          <th>탑승일</th><th>항공권번호</th><th>탑승자명</th><th>출발지</th><th>목적지</th><th>결제금액(KRW)</th><th>적립 마일리지</th>
        </tr>
      </thead>
      <tbody>
        <!-- <tr>
          <td>최근내역이 없습니다.</td><td></td><td></td><td></td><td></td><td></td><td></td>
        </tr> -->

      </tbody>
      <!-- 탑승내역 쿼리 -->
      <%
      
  	  mySQL = "select reservationcode, flightcode, passenger_name,straightdistance from RESERVATIONDETAILS where user_code ='" + user_code + "' AND boardingstatus <> '" +zero+"'"; 	  
      myResultSet = stmt.executeQuery(mySQL);
      while(myResultSet.next()){
   		board_reserv_arr[boarding_count] = myResultSet.getString("reservationcode");
   		board_flight_code[boarding_flight_count] = myResultSet.getString("flightcode");
   		passenger_name[boarding_flight_count] = myResultSet.getString("passenger_name");
   		straight_distance[boarding_flight_count] = myResultSet.getInt("straightdistance");
   		boarding_count++;
   		}
	   	/* 현재까지 예약상세에서 탑승전을 제외한 내역을 탑승내역 리스트에 넣었고 카운트했다 */
	   	
	   	/* 이제는 탑승일을 출력하자->플라트 스케줄에서 가져와야함
	   	예약상세에서 flightcode로 플라이트 스케줄에서 가져와야함	*/
	    //이제 출발지+목적지 출력-> flight_code로 flight_schedule에서 찾는다
        for(int i = 0; i < boarding_count; i++)
        {
        	mySQL  = "select departure_date, departure, destination from FLIGHT_SCHEDULE where flight_code = '"+board_flight_code[i]+"'";
        	myResultSet = stmt.executeQuery(mySQL);
        	while(myResultSet.next())
        	{
        		board_dep_date[i] = myResultSet.getString("departure_date");
        		board_departure[i] = myResultSet.getString("departure");
        		board_destination[i] = myResultSet.getString("destination");
        	}	
        }
       
      //이제 결제금액+ 적립마일리지
      //이때 reservaiton에서 totalnumber가 10명이상이면 10%할인해줌
      //이때 직선거리(마일만큼 마일리지 준다) 즉 위도 경도로 거리 계산시 마일 단위로 해야함!
       for(int i = 0; i < boarding_count; i++)
        {
    	   mySQL = "select totalnumber,flightcost from RESERVATION where reservationcode='"+board_reserv_arr[i]+"'";
    	   myResultSet = stmt.executeQuery(mySQL);
    	   while(myResultSet.next()){
    		   total_num[i] = myResultSet.getInt("totalnumber");
    		   flight_cost_i[i] = myResultSet.getInt("flightcost");
    		   flight_cost_d[i] = (double)flight_cost_i[i];
        	   if(total_num[i] >=10){
        		   flight_cost_d[i] = flight_cost_i[i]*0.9;
        	   } } 
    	   
        }
    
   		
   		for(int j = 0; j<boarding_count; j++) {
   		%>
   			<tr>
   			<td><%=board_dep_date[j]%></td>
   			<td><%=board_flight_code[j] %></td>
   			<td><%=passenger_name[j]%></td>
   			<td><%=board_departure[j]%></td>
   			<td><%=board_destination[j] %></td>
   			<td><%=flight_cost_d[j]%></td>
   			<td><%=straight_distance[j] %></td>
   			</tr>
   		<% 
   		}
   		count2=0;
   	
      %>
    </table>
          <br><br><br>
          <a name="마일리지조회">
      <img src="./img/jeju_orange.PNG"> 
                 <h2 class="font-color">　마일리지 내역 조회</h2> 
                 </a>
           <hr>       
             <!-- 데이터베이스에서 불러올 시에는 테이블에 값 넣는것에 수정 필요 -->      
      <table>
      <thead>
        <tr>
          <th>적립일자</th><th>구분</th><th>적립 마일리지</th>
        </tr>
      </thead>
      <tbody>
      </tbody>
     <!--마일리지 쿼리작성 -->
     <%
     for(int j = 0; j<m_count; j++) {
 		%>
 			<tr>
 			<td><%=saving_date[j]%></td>
 			<td><%if(use_yesorno[j]== 0){%>사용<%}else{%>미사용<%}%></td>
 			<td><%=mileage[j] %></td>
 			</tr>
 		<% 
 		}
     %>
      
    </table>
    
    <br><br><br><br><br><br>
        </div>
      </div>
</div>
</div>
</body>
</html>