package service.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OldProductDao;
import model.OldProduct;
import service.CommandProcess;

public class OldDetailGoods implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		OldProductDao opd = OldProductDao.getInstance();
		int op_no = Integer.parseInt(request.getParameter("op_no"));
		OldProduct oldProduct = opd.select(op_no);
		request.setAttribute("oldProduct", oldProduct);
		
		return "/client/oldDetailGoods";
	}

}
