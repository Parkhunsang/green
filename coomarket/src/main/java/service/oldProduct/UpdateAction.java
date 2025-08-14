package service.oldProduct;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.OldProductDao;
import model.OldProduct;
import service.CommandProcess;

public class UpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String real = request.getServletContext().getRealPath("/oldProductupload");
		int maxSize = 1024 * 1024 * 10;  // 10M
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(request, real,
					maxSize, "utf-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {	}
		String op_image = mr.getFilesystemName("fileName");
		int op_no = Integer.parseInt(mr.getParameter("op_no"));
		String op_name = mr.getParameter("op_name");        
		String op_content = mr.getParameter("op_content");
	    int op_price = Integer.parseInt(mr.getParameter("op_price"));      
	    int op_discount = Integer.parseInt(mr.getParameter("op_discount")); 
	    String old_code = mr.getParameter("oldCode"); 
	    
	    OldProduct oldProduct = new OldProduct();
	    oldProduct.setOp_no(op_no);
	    oldProduct.setOp_name(op_name);
	    oldProduct.setOp_content(op_content);
	    oldProduct.setOp_image(op_image);
	    oldProduct.setOp_price(op_price);
	    oldProduct.setOp_discount(op_discount);
	    oldProduct.setOldCode(old_code);
	   
	    
	    OldProductDao opd = OldProductDao.getInstance();
	    int result = opd.update(oldProduct);
	    
	    request.setAttribute("result", result);
		return "/old_product/update";
	}
}
