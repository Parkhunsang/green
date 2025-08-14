package service.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.MemberPrivateDao;
import model.Member;
import model.MemberPrivate;
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
		

		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		String email = request.getParameter("userEmail_individual");
		String memberType = "I";

		int result = 0;

		member.setId(id);
		member.setPassword(pw);
		member.setEmail(email);
		member.setMemberType(memberType);

		MemberDao memberDao = MemberDao.getInstance();
		
		
		System.out.println(memberType);

		result = memberDao.insert(member);
		
//		if(result>0) {
//			result = 0;
//			MemberPrivate memberPrivate = new MemberPrivate();
//			memberPrivate.setId(id);
//			MemberPrivateDao memberPrivateDao = MemberPrivateDao.getInstance();
//			result = memberPrivateDao.insert(memberPrivate);
//		}
		
//		if(result == 0) memberDao.insertCancel(member);
		
		request.setAttribute("result", result);
		
		return "/member/join";
	}

}