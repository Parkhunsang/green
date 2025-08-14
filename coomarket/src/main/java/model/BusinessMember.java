package model;

import jakarta.persistence.Entity;
import jakarta.persistence.OneToOne;

@Entity
public class BusinessMember {
    private String id;
    private String bizNumber;
    private String companyName;
    
    @OneToOne(mappedBy = "BusinessMember")
    private Member member;
	
    
    public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBizNumber() {
		return bizNumber;
	}
	public void setBizNumber(String bizNumber) {
		this.bizNumber = bizNumber;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
}
