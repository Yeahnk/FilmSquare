package admin.service;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.Part;

import admin.vo.AtchFileVO;



public interface IAtchFileService {
	
	public AtchFileVO saveAtchFileList(Collection<Part> parts);
	
	public List<AtchFileVO> getAtchFileList(AtchFileVO atchFileVO);

	public AtchFileVO getAtchFileDetail(AtchFileVO atchFileVO);
	
}
