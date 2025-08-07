package service.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class Join implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Member member = new Member();
		
		String bizNum = request.getParameter("business_num");
		String compName = request.getParameter("company_name");
		String userTel = request.getParameter("userTel");
		String bizAddr = request.getParameter("userAddr");
		String bizEmail = request.getParameter("userEmail_biz");

		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		String email = request.getParameter("userEmail_individual");

		member.setId(id);
		member.setPassword(pw);
		member.setEmail(email);
		
		if(bizNum != null) {
			
		}else {
			
		}
		
		
		
		int result = 0;
		
		MemberDao md = MemberDao.getInstance();
		
		result = md.insert(member);
		request.setAttribute("result", result);
		
		return "/member/join";
	}

}
