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
	
	String log;
	if(session_id==null)
		log ="<a href=login.jsp>�α���</a>";
	else
		log =session_name + "�� ȯ���մϴ�!";
    
 	Connection myConn = null;
 	Statement stmt = null;
 	String mySQL = null;
 	String nationality ="";
	String password ="";
	String country ="";
	String email ="";
	String phone_number ="";
	String kor_name = "";
	String birthday = "";
	String user_code = "";
 	String passport_number = "";
 	int email_yesorno=0;
 	
	String dbURL = "jdbc:mysql://sjk-flight.co0uj2jb0gsx.ap-northeast-2.rds.amazonaws.com:3306/FLIGHT?user=admin&password=123456789";
	String dbID = "admin";
	String dbPassword = "123456789";
	Class.forName("com.mysql.jdbc.Driver");
	myConn = DriverManager.getConnection(dbURL,dbID,dbPassword);
 	stmt = myConn.createStatement();
 	
 	mySQL = "select user_code, password, nationality, country, email, phone_number, birthday, passport_number, email_yesorno from USER where id ='" + session_id + "'";
 	
 	ResultSet myResultSet = stmt.executeQuery(mySQL);
 	if(myResultSet.next()){
 		user_code = myResultSet.getString("user_code");
 		nationality = myResultSet.getString("nationality");
 		password = myResultSet.getString("password");
 		country = myResultSet.getString("country");
 		email = myResultSet.getString("email");
 		phone_number = myResultSet.getString("phone_number");
 		birthday = myResultSet.getString("birthday");
 		passport_number = myResultSet.getString("passport_number");
 		email_yesorno = myResultSet.getInt("email_yesorno");
 	}
 	
	mySQL = "select koreaname from LOCALUSER where user_code ='" + user_code + "'";
 	
 	myResultSet = stmt.executeQuery(mySQL);
 	if(myResultSet.next()){
 		kor_name = myResultSet.getString("koreaname");
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
             		�α���
				<% }
				else { %>
					<%=session_name%>�� ȯ���մϴ�!
				<%	}%>
			</p></h5>
            </a>
          </li>
          		 <li class="nav-item">
             <a class="nav-link" href="join.jsp">
              <h5><i class="now-ui-icons emoticons_satisfied"></i>
              <p>ȸ������</p></h5>
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
             <h2 class="title">ȸ������ ����</h2>
             <hr color ="black" size = "5px">
                  <div class="typography-line">
                  <h3><span><%=session_name%> ����, �ȳ��ϼ��� !</span> </h3>   
                              
                  </div>
             <br>
             
                 <img src="./img/jeju_orange.PNG"> 
                 <h2 class="font-color">�������Է�</h2> 
                 
    <form method="post" action = "Mypage_info_verify.jsp">
        <table width="1000px">
            <tr>
                <td>
                    <label for="sname">���̵�
                </td>
                <td>
                    <%=session_id %>
                </td>
            </tr>        
            <tr>
                <td>
                    <label for="pwd">��й�ȣ
                </td>
                <td>
                    <input type="text" name="password" id="password" size="20px" value="<%=password %> ">
                </td>
            </tr>
                        <tr>
                <td>
                    <label for="sname">��������
                </td>
                <td>
                    <%=session_name %>
                     <br> <font color = "#ff5005">������ ���ؼ��� �����Ϳ� �����ϼ���.</font>
                </td>
            </tr>
             <tr>
                <td>
                    <label for="sname">���ǹ�ȣ
                </td>
                <td>
                    <%=passport_number %>
                    <br> <font color = "#ff5005">������ ���ؼ��� �����Ϳ� �����ϼ���.</font>
                </td>
            </tr>
            <tr>
                   <td>
                         �������
                    </td>
                    <td>
                    <input type="text" name="birthday" id="birthday" size="30" value="<%= birthday %>">
                    <br> <font color = "#ff5005">ex) 1900-01-12 �� ���� �ۼ����ּ���.</font>
                    </td>
               </tr>
            <tr>
                <td>
                    <label for="sname">����(���ǻ�)
                </td>
                <td>
                    <input type="text" name="nationality" id="nationality" size="20px" value="<%=nationality %>"> 
                </td>
            </tr>  
            <tr>
                <td>
                    <label for="sname">���ֱ���
                </td>
                <td>
                    <input type="text" name="country" id="country" size="20px" value="<%=country %>"> 
                </td>
            </tr>                             
            <tr>
                <td>
                    <label for="email">�̸���
                </td>
                <td>
                    <input type="text" name="email" id="email" size="30" value="<%= email %>">
                    <br> <font color = "#ff5005">ex) Hong@gildong.com�� ���� �ۼ����ּ���.</font>
                </td>
            </tr>
            <tr>
                <td>
                    ��ȭ��ȣ
                </td>
                <td>
                    <input type="text" name="phone_number" size="11" value="0<%= phone_number %>">
                    <br> <font color = "#ff5005">ex) -�� �����ϰ� �ۼ����ּ���.</font>
                </td>
            </tr>
            <tr>
            <tr>
                <td>
                    <label for="news">�̸��� ���ſ���
                </td>
                <td>
                     <input type="text" name="email_yesorno" size="3" value="<%= email_yesorno %>">
                    <br> <font color = "#ff5005">1 : �̸��� ����, 0: �̸��� �̼���</font>
                    <br>*�̸��� �ּҸ� ����Ͻø� ȸ����ȣ, �������� �� ���� ���� �޾ƺ��� �� �ֽ��ϴ�.
                </td>
            </tr>
        </table>
        <br>
        <input type ="submit" class="btn btn-primary btn-lg" style="float:right;" value="ȸ������ ����">
    </form>

<br><br><br><br><br>


<p><br /></p>

        </div>
        
        
        
      </div>



</div>



</div>


</body>
</html>