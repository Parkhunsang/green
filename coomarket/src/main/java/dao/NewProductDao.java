package dao;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.NewProduct;
public class NewProductDao {
	private static NewProductDao instance = new NewProductDao();
	private NewProductDao() {}
	public static NewProductDao getInstance() {
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

	public int insert(NewProduct newProduct) {
		return session.insert("newProductns.insert", newProduct);
	}
	public List<NewProduct> list(int startRow, int rowPerPage) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("rowPerPage", rowPerPage);
		return session.selectList("newProductns.list", map);
	}
	public NewProduct select(int np_no) {
		return (NewProduct) session.selectOne("newProductns.select",np_no);
	}
	public int update(NewProduct newProduct) {
		return session.update("newProductns.update", newProduct);
	}
	public int total() {
		return (int) session.selectOne("newProductns.total");
	}
	
}
