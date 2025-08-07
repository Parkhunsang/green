package dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.Date;

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
	// DataBase Connection Pool
	private static SqlSession session; // mybatis 사용할 객체
	static { // 초기화블럭 자바 5장 75page 멤버변수 초기화 방법
		     // {}를 인스탄스 초기화블럭, static { } 클래스 변수 초기화 블럭
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
	
	public int update(Board board) {
		
		return 0;
	}
	public Board select(int b_no) {
		return (Board) session.selectOne("boardns.select", b_no);
	}
	
	
}
