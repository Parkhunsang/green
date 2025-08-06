package model;

import java.sql.Date;

import jakarta.persistence.*;

@Entity
public class Member {
	@Id
    private String id;
	
    private String password;
    private String email;
    private Date reg_date;
    private String status;
    private String member_type;
    
    @OneToOne
    @JoinColumn(name = "id")
    private MemberPrivate memberPrivate;
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMember_type() {
		return member_type;
	}
	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}

	
}
