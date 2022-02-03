package graduation_project_beta.model;

public class plan_DTO {
	public plan_DTO(int num, String id,int public_, int start_date, int end_date, String area, String places,int places_count, String info_title, String plan_comment, int plan_liked) {
		super();
		this.num = num;
		this.id = id;
		this.public_ = public_;
		this.start_date = start_date;
		this.end_date = end_date;
		this.area  = area;
		this.places = places;
		this.places_count = places_count;
		this.info_title = info_title;
		this.plan_comment = plan_comment;
		this.plan_liked = plan_liked;
	}
	
	private int num;
	private String id;
	private int public_;
	private int start_date;
	private int end_date;
	private String area;
	private String places;
	
	private int places_count;
	private String info_title;
	private String plan_comment;
	private int plan_liked;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPublic_() {
		return public_;
	}
	public void setPublic_(int public_) {
		this.public_ = public_;
	}
	public int getStart_date() {
		return start_date;
	}
	public void setStart_date(int start_date) {
		this.start_date = start_date;
	}
	public int getEnd_date() {
		return end_date;
	}
	public void setEnd_date(int end_date) {
		this.end_date = end_date;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getPlaces() {
		return places;
	}
	public void setPlaces(String places) {
		this.places = places;
	}
	public int getPlaces_count() {
		return places_count;
	}
	public void setPlaces_count(int places_count) {
		this.places_count = places_count;
	}
	public String getInfo_title() {
		return info_title;
	}
	public void setInfo_title(String info_title) {
		this.info_title = info_title;
	}
	public String getPlan_comment() {
		return plan_comment;
	}
	public void setPlan_comment(String plan_comment) {
		this.plan_comment = plan_comment;
	}
	public int getPlan_liked() {
		return plan_liked;
	}
	public void setPlan_liked(int plan_liked) {
		this.plan_liked = plan_liked;
	}
	
	
}
