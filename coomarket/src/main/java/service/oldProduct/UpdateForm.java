package service.oldProduct;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OldCategoryDao;
import dao.OldProductDao;
import model.OldCategory;
import model.OldProduct;
import service.CommandProcess;

public class UpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int op_no = Integer.parseInt(request.getParameter("op_no"));
		OldProductDao opd = OldProductDao.getInstance();
		OldProduct oldProduct = opd.select(op_no);
		OldCategoryDao ocd = OldCategoryDao.getInstance();
		List<OldCategory> oldcategory_list = ocd.list();
		request.setAttribute("oldcategory_list", oldcategory_list);

		request.setAttribute("oldProduct", oldProduct);
		return "updateForm";
	}

}
