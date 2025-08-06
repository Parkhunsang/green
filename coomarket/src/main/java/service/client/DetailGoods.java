package service.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NewProductDao;
import model.NewProduct;
import service.CommandProcess;

public class DetailGoods implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		NewProductDao npd = NewProductDao.getInstance();
		int np_no = Integer.parseInt(request.getParameter("np_no"));
		NewProduct newProduct = npd.select(np_no);
		request.setAttribute("newProduct", newProduct);
		
		return "/client/detailGoods";
	}

}
