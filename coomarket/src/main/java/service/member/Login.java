package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class Login implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		
		MemberDao md = MemberDao.getInstance();
		
		Member member = md.select(id);
		
		int result = 0;
		
		if(member == null || member.getStatus().equals("N")) result = -1; //멤버 데이터가 없거나 활성화 상태가 N인경우
		else if(member.getPassword().equals(pw)) {
			HttpSession session = request.getSession(true);
			session.setAttribute("id", id);
			result = 1;
		}else result = 0;
		
		request.setAttribute("result", result);

		
		return "/member/login";
	}

}
