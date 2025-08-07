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
		int result = 0;
		if(id!=null && id.length() >= 6 && id.length() <= 10) { //아이디 글자수 제한
			if(member==null) { //아이디 중복체크
				result = 1;
				msg = "사용가능한 아이디입니다";
			}else {
				result = 0;
				msg="사용불가능한 아이디입니다";
			}
		} else {
			result = 0;
			 msg="사용불가능한 아이디입니다";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("result", result);
		return "/member/confirm";
	}

}