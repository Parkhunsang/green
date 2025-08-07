package dao;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Category;
public class CategoryDao {
	private static CategoryDao instance = new CategoryDao();
	private CategoryDao() {}
	public static CategoryDao getInstance() {
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

	public List<Category> list() {
		return session.selectList("categoryns.list");
	}
	
}