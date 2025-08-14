package service.oldProduct;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OldProductDao;
import model.OldProduct;
import service.CommandProcess;

public class SerchResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String keyword = request.getParameter("keyword");
		OldProductDao opd = OldProductDao.getInstance();
		List<OldProduct> old_list = opd.list(keyword);
		request.setAttribute("old_list", old_list);		

		return "/serch/serch_result";
	}
}
