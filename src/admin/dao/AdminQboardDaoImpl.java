package admin.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import admin.vo.MvcReportVO;
import admin.vo.QnaReplyVO;
import admin.vo.QnaVO;
import config.MyBatisUtil;
import member.vo.MemberVO;
import util.MyBatisDao;




public class AdminQboardDaoImpl extends MyBatisDao implements IAdminQboardDao{
	
	private static IAdminQboardDao adminQboardDao;
	
	private AdminQboardDaoImpl() {
		
	}
	
	public static IAdminQboardDao getInstance() {
		if(adminQboardDao == null) {
			adminQboardDao = new AdminQboardDaoImpl();
		}
		
		return adminQboardDao;
	}
	
	

	
	@Override
	public List<QnaVO> qnaList(Map<String, Object> map) throws SQLException {
		return selectList("adminQna.qnaList", map);
	}

	@Override
	public int countList() throws SQLException {
		return selectOne("adminQna.countQnaList");
	}

	@Override
	public List<QnaVO> unQnaList(Map<String, Object> map) throws SQLException {
		return selectList("adminQna.unQnaList", map);
	}

	@Override
	public QnaVO qnaDetail(int qaId) {
		return selectOne("adminQna.qnaDetail", qaId);
	}

	@Override
	public int replyInsert(QnaReplyVO qv) {
		return insert("adminQna.replyInsert", qv);
	}

	@Override
	public List<QnaReplyVO> replyList() {
		return selectList("adminQna.replyList");
	}

	@Override
	public int uncountList() throws SQLException {
		return selectOne("adminQna.countUnQnaList");
	}



}
