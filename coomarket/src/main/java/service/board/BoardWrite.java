package service.board;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDao;
import model.Board;
import service.CommandProcess;

public class BoardWrite implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String real = request.getServletContext().getRealPath("/boardUpload");
		int maxSize = 1024 * 1024 * 10;  // 10M
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(request, real,
					maxSize, "utf-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {	}
		String b_image = mr.getFilesystemName("fileName");
		if (b_image==null) b_image="";
		String id = mr.getParameter("id");
		String b_title = mr.getParameter("b_title");
		String b_content = mr.getParameter("b_content");

		BoardDao bd = BoardDao.getInstance();
		Board board = new Board();

		board.setB_content(b_content);
		board.setB_title(b_title);
		board.setB_image(b_image);
		board.setId(id);
		int result = bd.insert(board);
		request.setAttribute("result", result);
		
		return "/board/boardWrite";
	}

}
