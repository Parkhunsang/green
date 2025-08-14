package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.MemberPrivateDao;
import model.Member;
import model.MemberPrivate;
import service.CommandProcess;

public class Mypage implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		MemberDao memberDao = MemberDao.getInstance();
		MemberPrivateDao memberPrivateDao = MemberPrivateDao.getInstance();
		HttpSession session = request.getSession();
		if(session.getAttribute("id")!=null) {
			String id=(String)session.getAttribute("id");
			System.out.println("id: "+id);
			Member member = memberDao.select(id);
			MemberPrivate memberPrivate = memberPrivateDao.select(id);

			request.setAttribute("member", member);
			request.setAttribute("memberPrivate", memberPrivate);
			
			if(memberPrivate!=null) return "/member/mypage";
			else return "/member/mypageVerification";
			
		}
		return "/display/main";
	}

}