package model;
import jakarta.persistence.*;

@Entity
public class MemberPrivate {
	@Id
    private String id;
	
    private String name;
    private String address;
    private String address_detail;
    private String tel;
    private String member_pic;
    
    @OneToOne(mappedBy = "memberPrivate")
    private Member member;
    
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMember_pic() {
		return member_pic;
	}
	public void setMember_pic(String member_pic) {
		this.member_pic = member_pic;
	}
}