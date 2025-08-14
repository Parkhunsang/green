package service.client;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Board;
import service.CommandProcess;

public class BoardList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int rowPerPage = 10;
		int pagePerBlock = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum==null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		
		BoardDao bd = BoardDao.getInstance();
		int total = bd.total();
		int totalPage = (int)Math.ceil((double)total/rowPerPage);
		int startPage = currentPage - (currentPage - 1) % pagePerBlock;  
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage) endPage = totalPage;
		int startRow = (currentPage - 1) * rowPerPage;
		
		List<Board> board_list = bd.list(startRow, rowPerPage);
		
		request.setAttribute("pageNum", currentPage);
		request.setAttribute("board_list", board_list);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("pagePerBlock", pagePerBlock);
		
		return "/client/boardList";
	}

}
