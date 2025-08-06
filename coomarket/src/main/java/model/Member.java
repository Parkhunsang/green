package model;

import java.sql.Date;

<<<<<<< HEAD
public class Member {
    private String id;
    private String password;
    private String name;
    private String address;
    private String tel;
    private String email;
    private Date reg_date;
    private String del;
    private String is_admin;
    private String member_type;
    
=======
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
    
>>>>>>> 6ff9406c3aae50e266f3fa5a35625d8621c7ed63
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
<<<<<<< HEAD
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
=======
>>>>>>> 6ff9406c3aae50e266f3fa5a35625d8621c7ed63
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
<<<<<<< HEAD
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public String getIs_admin() {
		return is_admin;
	}
	public void setIs_admin(String is_admin) {
		this.is_admin = is_admin;
=======
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
>>>>>>> 6ff9406c3aae50e266f3fa5a35625d8621c7ed63
	}
	public String getMember_type() {
		return member_type;
	}
	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}
<<<<<<< HEAD
=======

>>>>>>> 6ff9406c3aae50e266f3fa5a35625d8621c7ed63
	
}
