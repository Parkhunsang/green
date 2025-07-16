package ch14.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch14.dao.Board;
import ch14.dao.BoardDao;
public class ListAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		final int ROW_PER_PAGE = 10;    // 한 페이지에 보여주는 갯수
		final int PAGE_PER_BLOCK = 10;  // 한 블럭에 보여주는 페이지 갯수
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		// 시작번호	(페이지번호 - 1) * 페이지당 갯수, 건너띌 갯수				
	    int startRow = (currentPage - 1) * ROW_PER_PAGE;
		BoardDao bd = BoardDao.getInstance();
		int total = bd.getTotal();
		int number = total - startRow;
//		시작페이지 : 현재페이지 - (현재페이지 - 1)%10
		int startPage = currentPage - (currentPage - 1)%PAGE_PER_BLOCK;
	// 끝페이지 : 시작페이지 + 블록당페이지 수 -1
		int endPage = startPage + PAGE_PER_BLOCK - 1;
	//  페이지 	Math.ceil(개수/페이지당 개수)			
		int totalPage = (int)Math.ceil((double)total/ROW_PER_PAGE);
	//  endPage는 totalPage와 같거나 작다
		if (totalPage < endPage) endPage = totalPage;
//		List<Board> list = bd.list();
		List<Board> list = bd.list(startRow, ROW_PER_PAGE);
		
//		jsp 에 보낼 데이터를 setAttribute에 저장
		request.setAttribute("list", list); 
		request.setAttribute("number", number);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		return "list";
	
	}
}