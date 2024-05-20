package admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import admin.vo.AtchFileVO;
import config.MyBatisUtil;
import util.MyBatisDao;


public class AtchFileDaoImpl extends MyBatisDao implements IAtchFileDao {

	private static IAtchFileDao fileDao;
	
	private AtchFileDaoImpl() {}
	
	public static IAtchFileDao getInstance() {
		
		if(fileDao == null) {
			fileDao = new AtchFileDaoImpl();
		}
		
		return fileDao;
	}
	
	@Override
	public int insertAtchFile(AtchFileVO atchFileVO) {
		
		SqlSession session = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			
			cnt = session.insert("atchFile.insertAtchFile", atchFileVO);
			
			if(cnt > 0) {
				session.commit();
			
			}
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		

		return cnt;
	}

	@Override
	public int insertAtchFileDetail(AtchFileVO atchFileVO) {
		
		SqlSession session = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			
			cnt = session.insert("atchFile.insertAtchFileDetail", atchFileVO);
			
			if(cnt > 0) {
				session.commit();
			
			}
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		

		return cnt;
	}
	
	


	@Override
	public List<AtchFileVO> getAtchFileList(AtchFileVO atchFileVO) {
		
		List<AtchFileVO> atchFileList = new ArrayList<AtchFileVO>();
		
		SqlSession session = MyBatisUtil.getInstance(true);
		
		try {
			
			atchFileList = session.selectList("atchFile.getAtchFileList", atchFileVO);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return atchFileList;
	}

	@Override
	public AtchFileVO getAtchFileDetail(AtchFileVO atchFileVO) {
		
		AtchFileVO atchFileDetail = null;
		
		SqlSession session = MyBatisUtil.getInstance(true);
		
		try {
			atchFileDetail = session.selectOne("atchFile.getAtchFileDetail", atchFileVO);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return atchFileDetail;
	}

	@Override
	public int ebiInsert(AtchFileVO atchFileVO) {

		return insert("adminEditor.ebiInsert", atchFileVO);
	}
}
