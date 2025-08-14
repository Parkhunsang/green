package dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.BusinessMember;

public class BusinessMemberDao {
	private static BusinessMemberDao instance = new BusinessMemberDao();
	private BusinessMemberDao() {}
	public static BusinessMemberDao getInstance() {
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

	public int insert(BusinessMember bizMember) {
		return session.insert("businessMemberns.insert",bizMember);
	}
	
	
}
