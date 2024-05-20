package admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


import admin.vo.EBTextVO;
import admin.vo.EditorBoardVO;
import util.MyBatisDao;




public class AdminEboardDaoImpl extends MyBatisDao implements IAdminEboardDao{
	
	private static IAdminEboardDao adminEboardDao;
	
	private AdminEboardDaoImpl() {
		
	}
	
	public static IAdminEboardDao getInstance() {
		if(adminEboardDao == null) {
			adminEboardDao = new AdminEboardDaoImpl();
		}
		
		return adminEboardDao;
	}

	@Override
	public List<EditorBoardVO> editorList(Map<String, Object> map) throws SQLException{
		
		return selectList("adminEditor.editorList", map);
	}

	@Override
	public EditorBoardVO editorDetail(int ebId) {
		return selectOne("adminEditor.editorDetail", ebId);
	}

	@Override
	public int editorInsert(EditorBoardVO ev) {

		return insert("adminEditor.editorInsert", ev);
	}

	@Override
	public int ebtInsert(EBTextVO etv) {
		return insert("adminEditor.ebtInsert", etv);
	}

	@Override
	public int ecountList() throws SQLException {
		return selectOne("adminEditor.ecountList");
	}

	@Override
	public int deleteEboard(int ebId) {
		
		int cntTxt = 0;
		int cntImg = 0;
		int cntBoard = 0;
		
		cntTxt = delete("adminEditor.deleteEboardTxt", ebId);
		
		if(cntTxt > 0) {
			
			cntImg = delete("adminEditor.deleteEboardImg", ebId);
			
			if(cntImg > 0) {
				
				cntBoard = delete("adminEditor.deleteEboard", ebId);
				
			}
		}		
		return cntBoard;
	}

	@Override
	public List<EditorBoardVO>selectEditor(String ebYn) {
		System.out.println("edidao"+ebYn);
		return selectList("adminEditor.selectEditor",ebYn);
	}


	




}
