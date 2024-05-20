package admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import admin.vo.MvcReportVO;


public interface IAdminReportDao {

	/**
	 * DB에 존재하는 미처리 신고글를 조회하기 위한 메서드
	 * @param map
	 * @return 미처리 신고글
	 * @throws SQLException
	 */
	public List<MvcReportVO> reportList(Map<String, Object> map) throws SQLException;
	
	/**
	 * 신고글 중 특정 회원에게 신고된 신고글을 조회하기 위한 메서드
	 * @return 특정 회원의 모든 신고글
	 */
	public List<MvcReportVO> memberReport(String memId);
	
	/**
	 * 미처리 신고글을 처리완료로 변경하는 메서드
	 * @param mrv
	 * @return
	 */
	public int complete(MvcReportVO mrv);
	
	/**
	 * 미처리신고글 개수 반환
	 * @return
	 */
	public int mrcountList() throws SQLException;
}
