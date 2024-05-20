package admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import admin.dao.IAdminMboardDao;
import admin.dao.IAdminQboardDao;
import admin.vo.MvcReportVO;
import admin.vo.QnaReplyVO;
import admin.vo.QnaVO;
import admin.dao.AdminMboardDaoImpl;
import admin.dao.AdminQboardDaoImpl;
import member.vo.MemberVO;




public class AdminQboardServiceImpl implements IAdminQboardService{

	private static IAdminQboardService adminQboardService;
	private IAdminQboardDao adminQboardDao;
	
	private AdminQboardServiceImpl() {
		adminQboardDao = AdminQboardDaoImpl.getInstance();
		
	}
	public static IAdminQboardService getInstance() {
		
		if(adminQboardService == null) {
			adminQboardService = new AdminQboardServiceImpl();
		}
		return adminQboardService;
	}
	
	
	@Override
	public List<QnaVO> qnaList(Map<String, Object> map) {
		List<QnaVO> list = null;
		try {
			list = adminQboardDao.qnaList(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int countList() {
		int countList = 0;
		try {
			countList = adminQboardDao.countList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countList;
	}
	@Override
	public List<QnaVO> unQnaList(Map<String, Object> map) {
		List<QnaVO> list = null;
		try {
			list = adminQboardDao.unQnaList(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public QnaVO qnaDetail(int qaId) {
		return adminQboardDao.qnaDetail(qaId);
	}
	@Override
	public int replyInsert(QnaReplyVO qv) {

		return adminQboardDao.replyInsert(qv);
	}
	@Override
	public List<QnaReplyVO> replyList() {
		return adminQboardDao.replyList(); 
	}
	@Override
	public int uncountList() {
		int countList = 0;
		try {
			countList = adminQboardDao.uncountList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countList;
	}



}
