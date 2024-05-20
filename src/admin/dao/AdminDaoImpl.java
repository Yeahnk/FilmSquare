package admin.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import admin.vo.AdminVO;
import config.MyBatisUtil;



public class AdminDaoImpl implements IAdminDao{

	private static IAdminDao adminDao;
	
	private AdminDaoImpl() {
		
	}
	
	public static IAdminDao getInstance() {
		if(adminDao == null) {
			adminDao = new AdminDaoImpl();
		}
		
		return adminDao;
	}	
	
	@Override
	public AdminVO getAdminLoginInfo(AdminVO adminLoginInfo) {
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		AdminVO av = null;
		
		try {
			
			av = sqlSession.selectOne("admin.getAdminLoginInfo", adminLoginInfo);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return av;
	}

}
