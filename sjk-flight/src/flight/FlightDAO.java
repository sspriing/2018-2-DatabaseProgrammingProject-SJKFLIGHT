package flight;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class FlightDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static FlightDAO flightDao = new FlightDAO();
	
	public FlightDAO() {
		try {
			String dbURL = "jdbc:mysql://sjk-flight.co0uj2jb0gsx.ap-northeast-2.rds.amazonaws.com:3306/FLIGHT?user=admin&password=123456789";
			String dbID = "admin";
			String dbPassword = "123456789";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String[][] getFlight(String departure, String destination, String departureTime) {
		
		String SQL = "SELECT * from FLIGHT_SCHEDULE where departure = '"+departure+"' and destination = '"+destination+"' and departure_date ='"+departureTime+"'";
		String [][]flights = new String[1000][4];
		
		int i=0;
		try {
			pstmt = conn.prepareStatement(SQL);
//			pstmt.setString(1, departure);
//			pstmt.setString(2,  destination);
//			pstmt.setString(3, departureTime);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				flights[i][0] = rs.getString("flight_code");
				flights[i][1] = rs.getString("departure_time");
				flights[i][2] = rs.getString("arrival_time");
				flights[i][3] = rs.getString("price");
				i++;
			}
			return flights;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flights;
	}
	
	public int getMoney(String flightCode) {
		String SQL = "SELECT * from FLIGHT_SCHEDULE where flight_code = ?";
		int money = 0;
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, flightCode);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				money = rs.getInt("price");
				}
			return money;
			}
		catch(Exception e){
				e.printStackTrace();
			}
			return -1;
		}
	
	public String[][] getAirport() {
	    int i = 0;
		String[][] airport = new String[20][2];
		String SQL =  "select Airport_name, airport_code from AIRPORT ORDER BY classification_code ASC;";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) 
			{
				airport[i][0]=rs.getString("airport_name");
				airport[i][1] = rs.getString("airport_code");
				i++;
			}
			return airport;
			
	  }catch(Exception e) {
	       e.printStackTrace();
	  } 
	   return airport;
   }
  
   public int getAirportNum() {
	   int num = 0;
	   String SQL = "select count(*) from AIRPORT;";
	   try {
		   pstmt = conn.prepareStatement(SQL);
		   rs = pstmt.executeQuery();
		   rs.next();
		   num = rs.getInt(1);
	   
   }catch(Exception e) {
	   e.printStackTrace();
   }
   return num;
                                
   }
   
   public String[] getDepDes(String flightCode) {
	   String[] depDes = new String[2];
	   String SQL = "select departure, destination from FLIGHT_SCHEDULE where flight_code = ?";
	   try {
		   pstmt = conn.prepareStatement(SQL);
		   pstmt.setString(1, flightCode);
		   rs = pstmt.executeQuery();
		   if(rs.next()) {
			   depDes[0] = rs.getString("departure");
			   depDes[1] = rs.getString("destination");
		   }
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return depDes;
   }
   
   public String getDate() {
	   String SQL = "SELECT NOW();";
	   String date = null;
	   try {
		   pstmt = conn.prepareStatement(SQL);
		   rs = pstmt.executeQuery();
		   if(rs.next()) {
			   date = rs.getString(1);
			   return date;
		   }
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return date;
   }
   
   public String[] getContact(String user_code) {
	   String contact[] = new String[2];
	   String SQL = "SELECT phone_number, email where user_code = ?";
	   try {
		   pstmt = conn.prepareStatement(SQL);
		   pstmt.setString(1, user_code);
		   rs = pstmt.executeQuery();
		   if(rs.next()) {
			   contact[0] = rs.getString("phone_number");
			   contact[1] = rs.getString("email");
		   }
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return contact;
   }
   
   public String insertReservation(String user_code, int totalnumber, int flightcost, int way_code) {
	   String[] date = getDate().split(" |-|:");
	   String reservationCode = user_code + date[0]+date[1]+date[2]+date[3]+date[4]+date[5];
	   String SQL = "INSERT into RESERVATION values (?,?,?,?,?,?)";
	   try {
		   pstmt = conn.prepareStatement(SQL);
		   pstmt.setString(1, reservationCode);
		   pstmt.setString(2, user_code);
		   pstmt.setInt(3, totalnumber);
		   pstmt.setInt(4, 0);
		   pstmt.setInt(5,flightcost);
		   pstmt.setInt(6, way_code);
		   pstmt.executeUpdate();
		   return reservationCode;
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return null;
   }
   
   public int insertReservationDetail(String reservationCode, int flightorder, String flightCode, int straightdistance, int twowaycode, String mealtype, int luggageservicecode, String user_code, String passengerName) {
	   String SQL = "INSERT into RESERVATIONDETAILS values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	   try {
		   pstmt = conn.prepareStatement(SQL);
		   pstmt.setString(1, reservationCode);
		   pstmt.setInt(2, flightorder);
		   pstmt.setString(3, flightCode);
		   pstmt.setInt(4, 0);
		   pstmt.setInt(5,straightdistance);
		   pstmt.setInt(6,twowaycode);
		   pstmt.setString(7, "000");
		   pstmt.setString(8, mealtype);
		   pstmt.setInt(9, luggageservicecode);
		   pstmt.setString(10, user_code);
		   pstmt.setString(11,  passengerName);
		   pstmt.executeUpdate();
		   return 1;
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return -1;
   }
   
   public int insertPayment(String reservationCode, int paymentcost) {
	   String[] date = getDate().split(" |-|:");
	   String paymentdate = date[0]+"-"+date[1]+"-"+date[2];
	   String SQL = "Insert into PAYMENT values (?, ?, ?, ?)";
	   try {
		   pstmt = conn.prepareStatement(SQL);
		   pstmt.setString(1, reservationCode);
		   pstmt.setString(2, reservationCode);
		   pstmt.setInt(3,  paymentcost);
		   pstmt.setString(4, paymentdate);
		   pstmt.executeUpdate();
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return -1;
	   
   }
   
   public int insertPaymentDetail(String paymentcode, int methodofpaymentcode, int flightcost, int luggagecost, int flightfee, int mileage) {
	   String SQL = "INSERT into PAYMENTDETAILS values(?, ?, ?, ?, ?, ?)";
	   try {
		   pstmt = conn.prepareStatement(SQL);
		   pstmt.setString(1, paymentcode);
		   pstmt.setInt(2,methodofpaymentcode);
		   pstmt.setInt(3, flightcost);
		   pstmt.setInt(4, luggagecost);
		   pstmt.setInt(5, flightfee);
		   pstmt.setInt(6, mileage);
		   pstmt.executeUpdate();
	   }catch(Exception e){
		   e.printStackTrace();
	   }
	   return -1;
	   
   }
		
}

