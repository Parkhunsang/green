package dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.MemberPrivate;

public class MemberPrivateDao {
	private static MemberPrivateDao instance = new MemberPrivateDao();
	private MemberPrivateDao() {}
	public static MemberPrivateDao getInstance() {
		return instance;
	}
	private static SqlSession session;

	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public int insert(MemberPrivate memberPrivate) {
		return session.insert("memberns.insertPrivate",memberPrivate);
	}
	public MemberPrivate select(String id) {
		return (MemberPrivate) session.selectOne("memberns.selectPrivate",id);
	}
	public MemberPrivate selectTel(String tel) {
		return (MemberPrivate) session.selectOne("memberns.selectPrivateTel",tel);
	}
	public int addressUpdate(MemberPrivate memberPrivate) {
		return session.update("memberns.addressUpdate",memberPrivate);
	}
	
	
}
