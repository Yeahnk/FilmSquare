package admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import admin.dao.IAdminReportDao;
import admin.dao.AdminReportDaoImpl;
import admin.vo.MvcReportVO;




public class AdminReportServiceImpl implements IAdminReportService{

	private static IAdminReportService adminReportService;
	private IAdminReportDao adminReportDao;
	
	private AdminReportServiceImpl() {
		adminReportDao = AdminReportDaoImpl.getInstance();
		
	}
	public static IAdminReportService getInstance() {
		
		if(adminReportService == null) {
			adminReportService = new AdminReportServiceImpl();
		}
		
		return adminReportService;
	}
	
	@Override
	public List<MvcReportVO> reportList(Map<String, Object> map) {
		List<MvcReportVO> MvcReportList = null;
		try {
			MvcReportList = adminReportDao.reportList(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
				
		return MvcReportList;
	}
	
	@Override
	public List<MvcReportVO> memberReport(String memId) {
		List<MvcReportVO> MvcReportList = adminReportDao.memberReport(memId);
		return MvcReportList;
	}
	@Override
	public int complete(MvcReportVO mrv) {
		return adminReportDao.complete(mrv);
	}
	@Override
	public int mrcountList() {
		int countList = 0;
		try {
			countList = adminReportDao.mrcountList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countList;
	}

}
