package service.new_product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDao;
import model.Category;
import service.CommandProcess;

public class ProductEnrollForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		CategoryDao cd = CategoryDao.getInstance();
		List<Category> category_list = cd.list();
		request.setAttribute("category_list", category_list);
//		System.out.println(category_list.get(0).getCode());
		return "/new_product/new_product_enroll_form";
	}

}
