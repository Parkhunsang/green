package service.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BusinessMemberDao;
import dao.BusinessMemberPrivateDao;
import dao.MemberDao;
import model.BusinessMember;
import model.BusinessMemberPrivate;
import model.Member;
import service.CommandProcess;

public class JoinBusiness implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		Member member = new Member();

		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		String email = request.getParameter("userEmail_individual");
		String memberType = "B";
		
		
		String bizNum = request.getParameter("business_num");
		String compName = request.getParameter("company_name");
		String userTel = request.getParameter("userTel");
		String compAddr = request.getParameter("userAddr");
		String bizEmail = request.getParameter("userEmail_biz");
		

		int result = 0;

		member.setId(id);
		member.setPassword(pw);
		member.setEmail(email);
		member.setMemberType(memberType);

		MemberDao memberDao = MemberDao.getInstance();
		
		
		System.out.println(memberType);

		result = memberDao.insert(member);
		
		if(result>0 && memberType.equals("B")) {
			result = 0;
			BusinessMember bizMember = new BusinessMember();
			BusinessMemberPrivate bizMemberPrivate = new BusinessMemberPrivate();
			bizMember.setId(id);
			bizMember.setBizNumber(bizNum);
			bizMember.setCompanyName(compName);
			
			BusinessMemberDao bizMemberDao = BusinessMemberDao.getInstance();
			result = bizMemberDao.insert(bizMember);
			if(result>0) {
				bizMemberPrivate.setId(id);
				bizMemberPrivate.setCompanyEmail(bizEmail);
				bizMemberPrivate.setCompanyAddress(compAddr);
				bizMemberPrivate.setCompanyTel(userTel);
				BusinessMemberPrivateDao bizMemberPrivateDao = BusinessMemberPrivateDao.getInstance();
				result = bizMemberPrivateDao.insert(bizMemberPrivate);

			}
			
		}else result = -1; //일반가입 성공

		if(result == 0) memberDao.insertCancel(member);
		
		request.setAttribute("result", result);
		
		return "/member/join";
	}

}
