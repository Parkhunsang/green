package service.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDao;
import dao.NewProductDao;
import model.Board;
import model.NewProduct;
import service.CommandProcess;

public class BoardUpdate implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String real = request.getServletContext().getRealPath("/upload");
		int maxSize = 1024 * 1024 * 10;  // 10M
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(request, real,
					maxSize, "utf-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {	}
		
		String np_image = mr.getFilesystemName("fileName");
		int np_no = Integer.parseInt(mr.getParameter("np_no"));
		String np_name = mr.getParameter("np_name");        
		String np_content = mr.getParameter("np_content");
	    int np_price = Integer.parseInt(mr.getParameter("np_price"));      
	    int np_discount = Integer.parseInt(mr.getParameter("np_discount")); ;
  	    int  np_count = Integer.parseInt(mr.getParameter("np_count")); ;      
	    String code = mr.getParameter("code"); 
	    
	    Board Board = new Board();
//	    newProduct.setNp_no(np_no);
//	    newProduct.setNp_name(np_name);
//	    newProduct.setNp_content(np_content);
//	    newProduct.setNp_price(np_price);
//	    newProduct.setNp_discount(np_discount);
//	    newProduct.setNp_count(np_count);
//	    newProduct.setCode(code);
//	    newProduct.setNp_image(np_image);
	    
	    NewProductDao npd = NewProductDao.getInstance();
//	    int result = npd.update(newProduct);
//	    request.setAttribute("result", result);
	    
		return "/new_product/update";
//		return  "/board/boardUpdate";
	}

}
