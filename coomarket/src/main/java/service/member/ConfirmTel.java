package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberPrivateDao;
import model.MemberPrivate;
import service.CommandProcess;

public class ConfirmTel implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String tel = request.getParameter("telNum");
		String name = request.getParameter("userName");
		System.out.println(tel);
		System.out.println(name);
		MemberPrivateDao memberPrivateDao = MemberPrivateDao.getInstance();
		MemberPrivate memberPrivateChk = memberPrivateDao.selectTel(tel);
		int result = 0;
			if(memberPrivateChk==null) {
				MemberPrivate memberPrivate = new MemberPrivate();
				memberPrivate.setId(id);
				memberPrivate.setTel(tel);
				memberPrivate.setName(name);
				result = memberPrivateDao.insert(memberPrivate);
			}else {
				result = 0;
			}
		request.setAttribute("result", result);
		
		return "/member/confirmTel";
	}

}
