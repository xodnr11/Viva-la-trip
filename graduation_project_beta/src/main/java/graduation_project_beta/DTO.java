package graduation_project_beta;

public class DTO {
	public DTO(int no, String id, String pw,String Date_of_birth,String Gender,String UserName) {
		super();
		this.no = no;
		this.id = id;
		this.pw = pw;
		this.Date_of_birth = Date_of_birth;
		this.Gender = Gender;
		this.UserName = UserName;
	}
	
	private int no;
	private String id;
	private String pw;
	private String Date_of_birth;
	private String Gender;
	private String UserName;
	
	public int getNo() {
		return no;
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
	public String geDate_of_birth() {
		return Date_of_birth;
	}
	public void setDate_of_birth(String Date_of_birth) {
		this.Date_of_birth = Date_of_birth;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String Gender) {
		this.Gender = Gender;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String UserName) {
		this.UserName = UserName;
	}
}
