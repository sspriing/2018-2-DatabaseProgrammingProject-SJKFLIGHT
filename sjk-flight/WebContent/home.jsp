<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@page import="flight.FlightDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "flight.Flight" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<link rel="apple-touch-icon" sizes="76x76" href="./img/apple-icon.png">
  <link rel="icon" type="image/png" href="./img/favicon.png">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/css/bootstrap-select.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/js/bootstrap-select.min.js"></script>

<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  
  <link href="./css/bootstrap.min.css" rel="stylesheet" />
  <link href="./css/now-ui-kit.css?v=1.2.0" rel="stylesheet" />
 
 
 <script src="./assets/js/core/jquery.min.js" type="text/javascript"></script>
  <script src="./assets/js/core/popper.min.js" type="text/javascript"></script>
  <script src="./assets/js/core/bootstrap.min.js" type="text/javascript"></script>
  <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
  <script src="./assets/js/plugins/bootstrap-switch.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="./assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
  <!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
  <script src="./assets/js/plugins/bootstrap-datepicker.js" type="text/javascript"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
  <script src="./assets/js/now-ui-kit.js?v=1.2.0" type="text/javascript"></script>

<%
FlightDAO flightDAO = new FlightDAO();
String[][] airport = flightDAO.getAirport();
int num = flightDAO.getAirportNum();

%>
   
    <title>SJK Air</title>
     <link rel="stylesheet" type="text/css" href="style.css" />
  
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
	    	
    	
    	
        html, body {
            width: 100%;
            height: 100%
        }

        html {
            overflow-y: scroll
        }

        body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, form, fieldset, p, button {
            margin: 0;
            padding: 0
        }

        body, h1, h2, h3, h4, input, button {
            font-family: NanumGothicWeb,verdana,dotum,Helvetica,sans-serif;
            font-size: 15px;
            color: #d2d2d7
        }

        body {
            background-color: #fff;
            *word-break: break-all;
            -ms-word-break: break-all
        }

        img, fieldset, iframe {
            border: 0 none
        }

        li {
            list-style: none
        }
        
         a:link { color: black; text-decoration: none;}
		 a:visited { color: black; text-decoration: none;}
 		 a:hover { font-weight:bolder; color: black; text-decoration: none;}

        #wrap {
            width: 1000px;
            margin: 0 auto
        }

        header {
            width: 100%;
            margin-top: 20px;
            padding: 20px;
           background: white;
        }
 
        hgroup {
            overflow: hidden;
            padding-bottom: 20px
        }

            hgroup h1 {
                float: left;
                font-size: 18px;
                color: #fff
            }

            hgroup h2 {
                float: right;
                font-weight: normal;
                color: #fff;
                opacity: 0.8
            }

	        .menubar{
				border:none;
				border:0px;
				margin:0px;
				padding:0px;
				font: 67.5% "Lucida Sans Unicode", "Bitstream Vera Sans", "Trebuchet Unicode MS", "Lucida Grande", Verdana, Helvetica, sans-serif;
				font-size:14px;
				font-weight:bold;
				}
				
				.menubar ul{
				background: #f96332;
				height:50px;
				list-style:none;
				margin:0;
				padding:0;
				}
				
				.menubar li{
				float:left;
				padding:0px;
				}
				
				.menubar li a{
				background: #f96332;
				color:#FFFFFF;
				display:block;
				font-weight:normal;
				line-height:50px;
				margin:0px;
				padding:0px 25px;
				text-align:center;
				text-decoration:none;
				}
				
				.menubar li a:hover, .menubar ul li:hover a{
				background: rgb(71,71,71);
				color:#FFFFFF;
				text-decoration:none;
				}
				
				.menubar li ul{
				background: #FFFFFF;
				display:none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
				height:auto;
				padding:0px;
				margin:0px;
				border:0px;
				position:absolute;
				width:200px;
				z-index:200;
				/*top:1em;
				/*left:0;*/
				}
				
				.menubar li:hover ul{
				display:block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
				}
				
				.menubar li li {
				background: #f96332;
				display:block;
				float:left;
				margin:0px;
				padding:0px;
				width:200px;
				}
				
				.menubar li:hover li a{
				background:none;
				}
				
				.menubar li ul a{
				display:block;
				height:50px;
				font-size:12px;
				font-style:normal;
				margin:0px;
				padding:0px 10px 0px 15px;
				text-align:left;
				}
				
				.menubar li ul a:hover, .menubar li ul li:hover a{
				background: rgb(71,71,71);
				border:0px;
				color:#ffffff;
				text-decoration:none;
				}
				
				.menubar p{
				clear:left;
				}
				
        section {
            float: initial;
            width: 95%;
            margin-top: 15px;
            margin-bottom: 10px;
            padding: 3px;
            line-height: 20px
        }

    

        footer,h1 {
            clear: both;
            padding: 3px;
            margin-top: 3px;
            border: 1px solid #ccc
            font-family: NanumGothicWeb,verdana,dotum,Helvetica,sans-serif;
            font-size: 13px;
            color: black;
        }


        body {
            font-family: Verdana,sans-serif;
            margin: 0
        }

        .mySlides {
            display: none
        }

        /* Slideshow container */
        .slideshow-container {
            max-width: 1000px;
            position: relative;
            margin: auto;
        }

        /* On hover, add a black background color with a little bit see-through */
        .prev:hover, .next:hover {
            background-color: rgba(0,0,0,0.8);
        }

        /* Caption text */
        .dot {
            cursor: pointer;
            height: 15px;
            width: 15px;
            margin: 0 2px;
            margin-top: 5px;
            background-color: #FFFFFF;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }

            .active, .dot:hover {
                background-color: #FFFFFF;
            }

        @media only screen and (max-width: 300px) {
            .prev, .next, .text {
                font-size: 11px
                //폰트키우고 싶은데 안커짐
            }
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

<body>
<body class="index-page sidebar-collapse">
<form method = "post" action = "reserve.jsp">
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
            <a class="nav-link" href="javascript:void(0)">
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
              <p>O O 님, 환영합니다</p></h5>
            </a>
          </li>
            </div>
        </ul>
      </div>
    </div>
  </nav>

  <section > 
   <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" style = "margin-top:-10px; margin-left:25%; margin-right:150px; width:1000px">
   
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img class="d-block w-10" src="img/img1.jpg"  alt="First slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-10" src="img/img2.jpg"  alt="Second slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-10" src="img/img3.jpg"  alt="Third slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-10" src="img/img4.jpg"  alt="fourth slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-10" src="img/img5.jpg"  alt="fifth slide">
				    </div>
				  </div>
				  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				
               
                <!-- 여기에 왕복/편도/다구간/단체예약 메뉴 만들것 -->   
                
     </div>
			    
   <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" style = "margin-top:-10px; margin-left:25%; margin-right:150px; width:1000px">			   
		         <div class="menubar">
				<ul>
				 <li><a href="javascript:typeRound();"  id = "round">왕복</a></li>
				 <li><a href="javascript:typeOneway();" id = "oneway">편도</a></li>
				 <li><a href="javascript:typeMultiway();" id = "multiway">다구간</a></li>
				 <li><a href="groupReservation.jsp">단체예약</a></li>
				 <input type="radio" name="radio">일반결제
                 <input type="radio" checked name="radio">마일리지결제
				</ul>
			    </div>
	</div>		   
      <div class="slideshow-container" style = " margin-left:25%;">
    	<h1>출발지를 선택하세요!
		<select class="selectpicker" style="width:300px;height:1px" multiple data-max-options="1" name = "departure" >
	    <optgroup label="한국">
	        <%for(int i = 0; i < 3; i++){%>
	     <option value = "<%=airport[i][1]%>"><%=airport[i][0]%></option>
	     <%} %>
	    </optgroup>
	    <optgroup label="동북아">
	        <%for(int i = 3; i < 10; i++){%>
	     <option value = "<%=airport[i][1]%>"><%=airport[i][0]%></option>
	     <%} %>
	    </optgroup>
	    <optgroup label="동남아">
	        <%for(int i = 10; i < 13; i++){%>
	     <option value = "<%=airport[i][1]%>"><%=airport[i][0]%></option>
	     <%} %>
	    </optgroup>
	    <optgroup label="대양주">
	        <%for(int i = 13; i < num; i++){%>
	     <option value = "<%=airport[i][1]%>"><%=airport[i][0]%></option>
	     <%} %>
	    </optgroup>
	  	</select>
	
		도착지를 선택하세요!
		<select class="selectpicker"  multiple data-max-options="1" name = "destination">
		  <optgroup label="한국">
	        <%for(int i = 0; i < 3; i++){%>
	     <option value = "<%=airport[i][1]%>"><%=airport[i][0]%></option>
	     <%} %>
	    </optgroup>
	    <optgroup label="동북아">
	        <%for(int i = 3; i < 10; i++){%>
	     <option value = "<%=airport[i][1]%>"><%=airport[i][0]%></option>
	     <%} %>
	    </optgroup>
	    <optgroup label="동남아">
	        <%for(int i = 10; i < 13; i++){%>
	     <option value = "<%=airport[i][1]%>"><%=airport[i][0]%></option>
	     <%} %>
	    </optgroup>
	    <optgroup label="대양주">
	        <%for(int i = 13; i < num; i++){%>
	     <option value = "<%=airport[i][1]%>"><%=airport[i][0]%></option>
	     <%} %>
	    </optgroup>
	  </select></h1>
	 
	 <div id = "multiway-option">
	     	<h1>출발지를 선택하세요!
		<select class="selectpicker" style="width:300px;height:1px" multiple data-max-options="1" name = "departure1" >
	    <optgroup label="한국">
	        <%for(int i = 0; i < 3; i++){%>
	     <option value = "<%=airport[i][1]%>"><%=airport[i][0]%></option>
	     <%} %>
	    </optgroup>
	    <optgroup label="동북아">
	        <%for(int i = 3; i < 10; i++){%>
	     <option value = "<%=airport[i][1]%>"><%=airport[i][0]%></option>
	     <%} %>
	    </optgroup>
	    <optgroup label="동남아">
	        <%for(int i = 10; i < 13; i++){%>
	     <option value = "<%=airport[i][1]%>"><%=airport[i][0]%></option>
	     <%} %>
	    </optgroup>
	    <optgroup label="대양주">
	        <%for(int i = 13; i < num; i++){%>
	     <option value = "<%=airport[i][1]%>"><%=airport[i][0]%></option>
	     <%} %>
	    </optgroup>
	  	</select>
	
		도착지를 선택하세요!
		<select class="selectpicker"  multiple data-max-options="1" name = "destination1">
		  <optgroup label="한국">
	        <%for(int i = 0; i < 3; i++){%>
	     <option value = "<%=airport[i][1]%>"><%=airport[i][0]%></option>
	     <%} %>
	    </optgroup>
	    <optgroup label="동북아">
	        <%for(int i = 3; i < 10; i++){%>
	     <option value = "<%=airport[i][1]%>"><%=airport[i][0]%></option>
	     <%} %>
	    </optgroup>
	    <optgroup label="동남아">
	        <%for(int i = 10; i < 13; i++){%>
	     <option value = "<%=airport[i][1]%>"><%=airport[i][0]%></option>
	     <%} %>
	    </optgroup>
	    <optgroup label="대양주">
	        <%for(int i = 13; i < num; i++){%>
	     <option value = "<%=airport[i][1]%>"><%=airport[i][0]%></option>
	     <%} %>
	    </optgroup>
	  </select></h1>
	 </div>
	 

      
         <div class="col-md-6">
           <div class="datepicker-container">
             <div class="form-group">
               <input type="text" class="form-control date-picker" value="출발날짜를 선택하세요!" data-datepicker-color="primary" name = "departure_date1">
             </div>
           </div>
         </div>
      
      
      <div id = "oneway-option">
         <div class="col-md-6">
           <div class="datepicker-container">
             <div class="form-group">
               <input type="text" class="form-control date-picker" value="도착날짜를 선택하세요!" data-datepicker-color="primary" name = "departure_date2">
             </div>
           </div>
         </div>
       </div>
       
	<div class="btn-group"> 
	<label value = "성인">성인
	  <select class="selectpicker " name = "adultNum" data-style="select-with-transition btn-primary btn-round" data-size="9" >
	    <option value="0">0명</option>
	    <option value="1">1명</option>
	    <option value="2">2명</option>
	    <option value="3">3명</option>
	    <option value="4">4명</option>
	    <option value="5">5명</option>
	    <option value="6">6명</option>
	    <option value="7">7명</option>
	    <option value="8">8명</option>
	    <option value="9">9명</option>
	</select>
	</label>
	<label value = "소아">소아
	<select class="selectpicker "name = "kidNum" data-style="select-with-transition btn-primary btn-round"  data-size="9" >
	    <option value="0">0명</option>
	    <option value="1">1명</option>
	    <option value="2">2명</option>
	    <option value="3">3명</option>
	    <option value="4">4명</option>
	    <option value="5">5명</option>
	    <option value="6">6명</option>
	    <option value="7">7명</option>
	    <option value="8">8명</option>
	    <option value="9">9명</option>
	 </select>
	 </label>
	 <label value = "유아">유아
	 <select class="selectpicker "  name = "infantNum" data-style="select-with-transition btn-primary btn-round"data-size="9">
	    <option value="0">0명</option>
	    <option value="1">1명</option>
	    <option value="2">2명</option>
	    <option value="3">3명</option>
	    <option value="4">4명</option>
	    <option value="5">5명</option>
	    <option value="6">6명</option>
	    <option value="7">7명</option>
	    <option value="8">8명</option>
	    <option value="9">9명</option>
	 </select>
   </label>
   
   
    </div>
       <button class="btn btn-primary" data-toggle="modal" data-target="#myModal" style ="float:right; width:200px">
        소아, 유아 나이 기준
       </button>
       
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header justify-content-center">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
              <i class="now-ui-icons ui-1_simple-remove"></i>
            </button>
            <h1 class="title title-up">소아,유아 나이 기준</h1>
          </div>
          <div class="modal-body">
            <h1>소아</h1>
           <h1>[국내선] 만2세~만13세 미만(최초 출발일 기준)</h1>
           <h1>[국제선] 만2세~만12세 미만(최초 출발일 기준)</h1>
           
           <h1>유아</h1>
           <h1>[국내선] 생후 7일 이상~만2세 미만(탑승일 기준)</h1>
           <h1>[국제선] 생후 14일 이상~만2세 미만(최초 출발일 기준)</h1>
           <h1>*탑승 수속 시 생년월일 확인 가능한 서류 지참 필수</h1>
            </h1>
          </div>
          <div class="modal-footer">
            <input type="button" onclick = "nothing()" class="btn btn-danger" data-dismiss="modal">확인하였습니다.</button>
          </div>
        </div>
      </div>
    </div>
	
   <button type = "submit" class="btn-3" style = "float:right;width: 200px">예매하기</button>	
   <%session.setAttribute("user", "1234"); %>
    </div>
    <script>
		var slideIndex = 0;
		showSlides();
		
		function plusSlides(n) {
		  showSlides(slideIndex += n);
		}
		
		function currentSlide(n) {
		  showSlides(slideIndex = n);
		}
		
		function showSlides() {
		  var i;
		  var slides = document.getElementsByClassName("mySlides");
		  var dots = document.getElementsByClassName("dot");
		  for (i = 0; i < slides.length; i++) {
		      slides[i].style.display = "none";
		  }
		  slideIndex++;
		  if(slideIndex > slides.length){
			  slideIndex = 1
		  }
		  for (i = 0; i < dots.length; i++) {
		      dots[i].className = dots[i].className.replace(" active", "");
		  }
		  slides[slideIndex-1].style.display = "block";
		  dots[slideIndex-1].className += " active";
		  setTimeout(showSlides, 2000); 
		}
    </script>
		    
    
    <script>
    $(document).ready(function() {
      // the body of this function is in assets/js/now-ui-kit.js
      nowuiKit.initSliders();
      
    });

    function scrollToDownload() {

      if ($('.section-download').length != 0) {
        $("html, body").animate({
          scrollTop: $('.section-download').offset().top
        }, 1000);
      }
    }
  </script>
  
  <div class="container" style = "margin-bottom:300px">
		
		</div>
 </section> 
<input type = "hidden" id = "type" name = "type" value = "round">
</form>
</body>
<script>

function typeRound(){
	$("#round").css("background","red");
	$("#oneway").css("background","#F96332");
	$("#multiway").css("background","#F96332");
	
	$("#multiway-option").hide();
	$("#oneway-option").show();
	
	$("#type").val("round");
	
}

function typeOneway(){
	$("#round").css("background","#F96332");
	$("#oneway").css("background","red");
	$("#multiway").css("background","#F96332");
	
	$("#multiway-option").hide();
	$("#oneway-option").hide();
	
	$("#type").val("oneway");
}

function typeMultiway(){
	$("#round").css("background","#F96332");
	$("#oneway").css("background","#F96332");
	$("#multiway").css("background","red");
	
	$("#multiway-option").show();
	$("#oneway-option").show();
	$("#type").val("multiway");
}

function nothing(){
	;
}

$(document).ready(function(){
	typeRound();
});
</script>
        
</html>