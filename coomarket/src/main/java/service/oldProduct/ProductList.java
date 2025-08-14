package service.oldProduct;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NewProductDao;
import dao.OldProductDao;
import model.OldProduct;
import service.CommandProcess;

public class ProductList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int rowPerPage = 10;
		int pagePerBlock = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum==null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		OldProductDao opd = OldProductDao.getInstance();
		int total = opd.total();
		int totalPage = (int)Math.ceil((double)total/rowPerPage);
		int startPage = currentPage - (currentPage - 1) % pagePerBlock;  
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage) endPage = totalPage;
		int startRow = (currentPage - 1) * rowPerPage;
		
		List<OldProduct> product_list = opd.list(startRow, rowPerPage);
		
		request.setAttribute("pageNum", currentPage);
		request.setAttribute("product_list", product_list);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("pagePerBlock", pagePerBlock);
		
		return "/old_product/productList";
	}

}
