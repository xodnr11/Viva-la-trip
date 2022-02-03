package graduation_project_beta.model;

public class userinfo_DTO {
	public userinfo_DTO(int no, String id, String pw, String UserName, String liked) {
		super();
		this.no = no;
		this.id = id;
		this.pw = pw;
		this.UserName = UserName;
		this.liked = liked;
	}
	
	private int no;
	private String id;
	private String pw;
	private String UserName;
	private String liked;
	public int getNo() {
		return no;
	}
	public String getLiked() {
		return liked;
	}
	public void setLiked(String liked) {
		this.liked = liked;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {	
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String UserName) {
		this.UserName = UserName;
	}
}
