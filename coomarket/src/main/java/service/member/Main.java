package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

public class Main implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		return "/display/main";
	}

}
