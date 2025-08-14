package service.display;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LocDao;
import model.Loc;
import service.CommandProcess;

public class Main implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		LocDao ld = LocDao.getInstance();
		List<Loc> loc_list = ld.list();
		request.setAttribute("loc_list", loc_list);
		
		return "/display/main";
	}

}