package model;

import jakarta.persistence.Entity;
import jakarta.persistence.OneToOne;

@Entity
public class BusinessMemberPrivate {
    private String id;
    private String companyAddress;
    private String companyTel;
    private String companyEmail;

    @OneToOne(mappedBy = "BusinessMemberPrivate")
    private Member member;
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCompany_address() {
		return companyAddress;
	}
	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}
	public String getCompanyTel() {
		return companyTel;
	}
	public void setCompanyTel(String companyTel) {
		this.companyTel = companyTel;
	}
	public String getCompanyEmail() {
		return companyEmail;
	}
	public void setCompanyEmail(String companyEmail) {
		this.companyEmail = companyEmail;
	}
}
