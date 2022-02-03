package graduation_project_beta.model;

public class user_schedule_DTO {
	public user_schedule_DTO(int no_,String region,int first_period,int last_period, int place_count,String place_list,String travel_name,String travel_content) {
		super();
		this.no_ = no_;
		this.region = region;
		this.first_period = first_period;
		this.last_period = last_period;
		this.place_count = place_count;
		this.place_list = place_list;
		this.travel_name = travel_name;
		this.travel_content = travel_content;
	}
	
	private int no_;
	private String region;
	private int first_period;
	private int last_period;
	private int place_count;
	private String place_list;
	private String travel_name;
	private String travel_content;
	
	public int getNo_() {
		return no_;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public void setNo_(int no_) {
		this.no_ = no_;
	}
	public int getFirst_period() {
		return first_period;
	}
	public void setFirst_period(int first_period) {
		this.first_period = first_period;
	}
	public int getLast_period() {
		return last_period;
	}
	public void setLast_period(int last_period) {
		this.last_period = last_period;
	}
	public int getPlace_count() {
		return place_count;
	}
	public void setPlace_count(int place_count) {
		this.place_count = place_count;
	}
	public String getPlace_list() {
		return place_list;
	}
	public void setPlace_list(String place_list) {
		this.place_list = place_list;
	}
	public String getTravel_name() {
		return travel_name;
	}
	public void setTravel_name(String travel_name) {
		this.travel_name = travel_name;
	}
	public String getTravel_content() {
		return travel_content;
	}
	public void setTravel_content(String travel_content) {
		this.travel_content = travel_content;
	}
	
	
}
