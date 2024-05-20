package util;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;

public class MyBatisDao {
	
	public <T> T selectOne(String statement) {
		
		// 세션 열기
		SqlSession session = config.MyBatisUtil.getInstance();
		
		T obj = null;
		
		try {
			
			obj = session.selectOne(statement);
			
		}catch(PersistenceException ex) {
			throw new RuntimeException("데이터 조회작업 중 예외발생!!!", ex);
			
		}finally {
			session.close(); // 세션 닫기
		}
		
		return obj;
	}

	public <T> T selectOne(String statement, Object parameter) {
		
		// 세션 열기
		SqlSession session = MyBatisUtil.getInstance();
		
		T obj = null;
		
		try {
			
			obj = session.selectOne(statement, parameter);
			
		}catch(PersistenceException ex) {
			throw new RuntimeException("데이터 조회작업 중 예외발생!!!", ex);
			
		}finally {
			session.close(); // 세션 닫기
		}
		
		return obj;
	}
	
	public <T> List<T> selectList(String statement) {
		
		// 세션 열기
		SqlSession session = MyBatisUtil.getInstance();
		
		List<T> list = null;
		
		try {
			
			list = session.selectList(statement);
			
		}catch(PersistenceException ex) {
			throw new RuntimeException("데이터 목록조회 작업 중 예외발생!!!", ex);
			
		}finally {
			session.close(); // 세션 닫기
		}
		
		return list;
		
	}

	public <T> List<T> selectList(String statement, Object parameter) {
		
		// 세션 열기
		SqlSession session = MyBatisUtil.getInstance();
		
		List<T> list = null;
		
		try {
			
			list = session.selectList(statement, parameter);
			
		}catch(PersistenceException ex) {
			throw new RuntimeException("데이터 목록조회 작업 중 예외발생!!!", ex);
			
		}finally {
			session.close(); // 세션 닫기
		}
		
		return list;
		
	}
	
	
	public int insert(String statement, Object parameter) {
		
		// 세션 열기
		SqlSession session = MyBatisUtil.getInstance(); 
		
		int cnt = 0;
		
		try {
			
			cnt = session.insert(statement, parameter);
			if(cnt > 0) {
				session.commit();
			}
			
		}catch(PersistenceException ex) {
			session.rollback();
			throw new RuntimeException("데이터 등록작업 중 예외발생!!!", ex);
			
		}finally {
			session.close(); // 세션 닫기
		}
		
		return cnt;
		
	}

	public int update(String statement, Object parameter) {
		
		// 세션 열기
		SqlSession session = MyBatisUtil.getInstance(); 
		
		int cnt = 0;
		
		try {
			
			cnt = session.update(statement, parameter);
			if(cnt > 0) {
				session.commit();
			}
			
		}catch(PersistenceException ex) {
			session.rollback();
			throw new RuntimeException("데이터 수정작업 중 예외발생!!!", ex);
			
		}finally {
			session.close(); // 세션 닫기
		}
		
		return cnt;
		
	}

	public int delete(String statement, Object parameter) {
		
		// 세션 열기
		SqlSession session = MyBatisUtil.getInstance(); 
		
		int cnt = 0;
		
		try {
			
			cnt = session.delete(statement, parameter);
			if(cnt > 0) {
				session.commit();
			}
			
		}catch(PersistenceException ex) {
			session.rollback();
			throw new RuntimeException("데이터 삭제작업 중 예외발생!!!", ex);
			
		}finally {
			session.close(); // 세션 닫기
		}
		
		return cnt;
		
	}
}
