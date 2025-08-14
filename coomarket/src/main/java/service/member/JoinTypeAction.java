package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

public class JoinTypeAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String type = request.getParameter("joinTypes");
		
		if(type != null) {
			if("individual".equals(type)) type="I";
			else if("business".equals(type)) type="B";
		}
		
		request.setAttribute("type", type);
		
		return "/member/joinForm";
	}

}