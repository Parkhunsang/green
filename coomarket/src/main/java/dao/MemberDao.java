package dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Member;

public class MemberDao {
	private static MemberDao instance = new MemberDao();
	private MemberDao() {}
	public static MemberDao getInstance() {
		return instance;
	}
	private static SqlSession session;

	static {
//		try {
//			Reader reader = Resources.getResourceAsReader("configuration.xml");
//			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
//			session = ssf.openSession(true);
//		} catch (IOException e) {
//			System.out.println(e.getMessage());
//			//e.printStackTrace();
//		}

	    try {
	        Reader reader = Resources.getResourceAsReader("configuration.xml");
	        SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
	        session = ssf.openSession(true);
	    } catch (IOException e) {
	        System.err.println("MyBatis 설정파일 로드 실패: " + e.getMessage());
	        throw new ExceptionInInitializerError(e);
	    }
		
	}
	

	public Member select(String id) {
		return (Member) session.selectOne("memberns.select",id);
	}
	public int insert(Member member) {
		return session.insert("memberns.insert",member);
	}
	
	public void insertCancel(Member member) {
		session.insert("memberns.insertCancel",member);
	}
}	