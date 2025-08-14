package service.oldProduct;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OldCategoryDao;
import model.OldCategory;
import service.CommandProcess;

public class ProductEnrollForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		OldCategoryDao ocd = OldCategoryDao.getInstance();
		List<OldCategory> oldCategory_list = ocd.list();
		request.setAttribute("oldCategory_list", oldCategory_list);
//		System.out.println(category_list.get(0).getCode());
		return "/old_product/old_product_enrollForm";
	}

}
