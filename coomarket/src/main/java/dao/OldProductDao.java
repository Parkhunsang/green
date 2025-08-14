package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.OldProduct;

public class OldProductDao {
	private static OldProductDao instance = new OldProductDao();
	private OldProductDao() {}
	public static OldProductDao getInstance() {
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
	}public List<OldProduct> list(String keyword) {
		return session.selectList("oldProductns.serchList",keyword);
	}
	
	
	public int insert(OldProduct oldProduct) {
		return session.insert("newProductns.insert", oldProduct);
	}
	
	public List<OldProduct> list(int startRow, int rowPerPage) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("rowPerPage", rowPerPage);
		return session.selectList("oldProductns.list", map);
	}
	public OldProduct select(int op_no) {
		return (OldProduct) session.selectOne("oldProductns.select",op_no);
	}
	public int update(OldProduct oldProduct) {
		return session.update("oldProductns.update", oldProduct);
	}
	public int total() {
		return (int) session.selectOne("oldProductns.total");
	}
	
	
}
