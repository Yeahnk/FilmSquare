package admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import admin.dao.IAdminMboardDao;
import admin.vo.MvcReportVO;
import admin.dao.AdminMboardDaoImpl;
import member.vo.MemberVO;




public class AdminMboardServiceImpl implements IAdminMboardService{

	private static IAdminMboardService adminMboardService;
	private IAdminMboardDao adminMboardDao;
	
	private AdminMboardServiceImpl() {
		adminMboardDao = AdminMboardDaoImpl.getInstance();
		
	}
	public static IAdminMboardService getInstance() {
		
		if(adminMboardService == null) {
			adminMboardService = new AdminMboardServiceImpl();
		}
		return adminMboardService;
	}
	
	
	@Override
	public List<MemberVO> blackList(Map<String, Object> map) {
		List<MemberVO> list = null;
		try {
			list = adminMboardDao.blackList(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int countList() {
		int countList = 0;
		try {
			countList = adminMboardDao.countList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countList;
	}
	@Override
	public List<MemberVO> selectAll(Map<String, Object> map) {
		List<MemberVO> list = null;
		try {
			list = adminMboardDao.selectAll(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
}
	@Override
	public MemberVO selectMember(String memId) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int blackUpdate(MemberVO mv) {
		int cnt = adminMboardDao.blackUpdate(mv);
	
		return cnt;
	}
	@Override
	public int listUpdate(MemberVO mv) {
		int cnt = adminMboardDao.listUpdate(mv);
		
		return cnt;
	}
	
	@Override
	public int bcountList() {
		int countList = 0;
		try {
			countList = adminMboardDao.bcountList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countList;
	}
	@Override
	public List<MemberVO> selectAll() {
		return adminMboardDao.selectAll();
	}


}
