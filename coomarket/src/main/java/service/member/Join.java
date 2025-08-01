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
		
		String id = request.getParameter("userId_individual");
		String pw = request.getParameter("userPw_individual");
		String name = request.getParameter("userName_individual");
		String addr = request.getParameter("userAddress_individual");
		String tel = request.getParameter("userTel_individual");
		String email = request.getParameter("userEmail_individual");
		
		Member member = new Member();
		member.setId(id);
		member.setPassword(pw);
		member.setName(name);
		member.setAddress(addr);
		member.setTel(tel);
		member.setEmail(email);
		
		int result = 0;
		
		MemberDao md = MemberDao.getInstance();
		
		result = md.insert(member);
		request.setAttribute("result", result);
		
		return "/member/join";
	}

}
