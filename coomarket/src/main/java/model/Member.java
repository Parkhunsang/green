package model;

import java.sql.Date;

import jakarta.persistence.*;

@Entity
public class Member {
	@Id
    private String id;
	
    private String password;
    private String email;
    private Date regDate;
    private String status;
    private String memberType;
    
    @OneToOne
    @JoinColumn(name = "id")
    private MemberPrivate memberPrivate;
    
    @OneToOne
    @JoinColumn(name = "id")
    private MemberPrivate BusinessMember;

    @OneToOne
    @JoinColumn(name = "id")
    private MemberPrivate businessMemberPrivate;
    
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMemberType() {
		return memberType;
	}
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	
}