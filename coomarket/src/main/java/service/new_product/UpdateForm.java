package service.new_product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDao;
import dao.NewProductDao;
import model.Category;
import model.NewProduct;
import service.CommandProcess;

public class UpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int np_no = Integer.parseInt(request.getParameter("np_no"));
		NewProductDao npd = NewProductDao.getInstance();
		NewProduct newProduct = npd.select(np_no);
		CategoryDao cd = CategoryDao.getInstance();
		List<Category> category_list = cd.list();
		request.setAttribute("category_list", category_list);

		request.setAttribute("newProduct", newProduct);
		return "updateForm";
	}

}
