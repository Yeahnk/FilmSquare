package admin.service;

import admin.dao.IAdminDao;
import admin.dao.AdminDaoImpl;
import admin.vo.AdminVO;

public class AdminServiceImpl implements IAdminService {
	private static IAdminService adminService;
	private IAdminDao adminDao;
	
	private AdminServiceImpl() {
		adminDao = AdminDaoImpl.getInstance();	
	}
	
	public static IAdminService getInstance() {
		
		if(adminService == null) {
			adminService = new AdminServiceImpl();
		}
		return adminService;
	}
	
	@Override
	public AdminVO getAdminLoginInfo(AdminVO adminLoginInfo) {
		AdminVO av = adminDao.getAdminLoginInfo(adminLoginInfo);
		return av;
	}

}
