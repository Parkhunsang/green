package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class Confirm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		String msg = "";
		if(member==null) msg="사용가능한 아이디입니다";
		else msg="다른아이디를상ㅇㅎ사ㅔ요";
		request.setAttribute("msg", msg);
		return "/member/confirm";
	}

}
