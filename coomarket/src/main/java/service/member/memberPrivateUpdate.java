package service.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberPrivateDao;
import model.MemberPrivate;
import service.CommandProcess;

public class memberPrivateUpdate implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		String address = request.getParameter("address");
		String addressDetail = request.getParameter("addressDetail");
		MemberPrivateDao memberPrivateDao = MemberPrivateDao.getInstance();
		MemberPrivate memberPrivate = memberPrivateDao.select(id);
		
		memberPrivate.setAddress(address);
		memberPrivate.setAddressDetail(addressDetail);
		
		int result = 0;
		
		result = memberPrivateDao.addressUpdate(memberPrivate);
		
		request.setAttribute("result",result);
		
		return "/member/memberPrivateUpdate";
	}

}
