package flight;

public class Flight {
	private String flightCode = null;	//비행기코드
	private int flightCost = 0;
	private int flightorder = 0;
	private String user_code = null;
	private String passenger_name = null;
	private String mealType = null;
	private int luggageservicecode = 0;
	
	public String getFlightCode() {
		return flightCode;
	}
	
	public int getFlightCost() {
		return flightCost;
	}
	
	public int getFlightOrder() {
		return flightorder;
	}

	public String getUserCode() {
		return user_code;
	}
	public String getPassengerName() {
		return passenger_name;
	}
	
	public String getMealType() {
		return mealType;
	}
	
	public int getLuggage() {
		return luggageservicecode;
	}
	
	public void setFlightCode(String flightCode) {
		this.flightCode = flightCode;
	}
	
	public void setFlightCost (int flightCost) {
		this.flightCost  = flightCost;
	}
	
	public void setFlightOrder (int flightorder ) {
		this.flightorder = flightorder;
	}
	
	public void setUserCode (String user_code) {
		this.user_code = user_code;
	}
	public void setPassengerName (String passenger_name) {
		this.passenger_name = passenger_name;
	}
	public void setMealType (String mealType ) {
		this.mealType = mealType;
	}
	public void setLuggage (int luggage) {
		this.luggageservicecode = luggage;
	}
	
}

