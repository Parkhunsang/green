package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

public class JoinTypeAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String type = request.getParameter("joinTypes");
		
		int result = 0;
		if(type != null) {
			if("individual".equals(type)) result=1;
			else if("business".equals(type)) result=2;
		}
		
		request.setAttribute("result", result);
		
		return "/member/joinForm";
	}

}