package dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Board;

public class BoardDao {
	private static BoardDao instance = new BoardDao();
	private BoardDao() {}
	public static BoardDao getInstance() {
		return instance;		
	}
	
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}		
	}
	public int insert(Board board) {
		return session.insert("boardns.insert", board);
	}
	
	public int getNumber() {
		return (int) session.selectOne("boardns.getNumber");
	}
	
	public List<Board> list(int startRow, int rowPerPage) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("rowPerPage", rowPerPage);
		return session.selectList("boardns.list", map);
	}
	
	public int update(Board board) {
		return session.update("boardns.update", board);
	}
	
	public Board select(int b_no) {
		return (Board) session.selectOne("boardns.select", b_no);
	}
	
	
	
	public int total() {
		return (int) session.selectOne("boardns.total");
	}
	
	
}
