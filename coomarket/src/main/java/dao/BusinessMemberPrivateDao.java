package dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.BusinessMemberPrivate;

public class BusinessMemberPrivateDao {
	private static BusinessMemberPrivateDao instance = new BusinessMemberPrivateDao();
	private BusinessMemberPrivateDao() {}
	public static BusinessMemberPrivateDao getInstance() {
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

	public int insert(BusinessMemberPrivate bizMemberPrivate) {
		return session.insert("businessMemberns.insertPrivate",bizMemberPrivate);
	}
}
