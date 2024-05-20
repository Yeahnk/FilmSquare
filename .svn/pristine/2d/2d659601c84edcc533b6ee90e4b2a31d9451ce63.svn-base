package admin.service;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Part;

import admin.dao.AtchFileDaoImpl;
import admin.dao.IAtchFileDao;
import admin.vo.AtchFileVO;



public class AtchFileServiceImpl implements IAtchFileService {

	private static IAtchFileService fileService;
	
	private IAtchFileDao fileDao;
	
	private AtchFileServiceImpl() {
		fileDao = AtchFileDaoImpl.getInstance();
	}
	
	public static IAtchFileService getInstance() {
		
		if(fileService == null) {
			fileService = new AtchFileServiceImpl();
		}
		
		return fileService;
	}
	
	@Override
	public AtchFileVO saveAtchFileList(Collection<Part> parts) {
		
		String uploadPath = "D:\\D_setting\\A_TeachingMaterial\\04_MiddelProject\\workspace\\FilmSquare\\WebContent\\images\\eboard";
		File uploadDir = new File(uploadPath);
		
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		boolean isFirstFile = true;
		AtchFileVO atchFileVO = null;
		
		for (Part part : parts) {
			
			String fileName = part.getSubmittedFileName();
			
			if(fileName != null && !fileName.equals("")) {
				if(isFirstFile) {
					isFirstFile = false;
		
					atchFileVO = new AtchFileVO();
					
				}
				
				String ebiOrgnNm = fileName;  //원본파일명
				long ebiSize = part.getSize();	  //파일사이즈
				String ebiStreNm = "";		  //저장파일명
				String ebiPath = "";		  //저장파일경로
				
				ebiStreNm = UUID.randomUUID().toString().replace("-", "");
				ebiPath = uploadPath + "\\" + ebiStreNm;
				
				
				String ebiExtsn = ebiOrgnNm.lastIndexOf(".") < 0 ? "" :   //뒤에서부터 해당 문자열의 위치
					ebiOrgnNm.substring(ebiOrgnNm.lastIndexOf(".")+1);
				
				String ebiStreNm2 = ebiStreNm + "."+ebiExtsn;
				String ebiPath2 = ebiPath + "." + ebiExtsn;
				
				try {
					part.write(ebiPath2);  //()경로에 저장
				} catch (IOException ex) {
					throw new RuntimeException("업로드 파일 저장 중 예외 발생!", ex);
				}

				atchFileVO.setEbiStreNm(ebiStreNm2);
				atchFileVO.setEbiSize(ebiSize);
				atchFileVO.setEbiOrgnNm(ebiOrgnNm);
				atchFileVO.setEbiPath(ebiPath2);
				atchFileVO.setEbiExtsn(ebiExtsn);
				atchFileVO.setEbiSn(1); //글쓰기 순서 가져와야 함
				
				fileDao.ebiInsert(atchFileVO);
				
				try {
					part.delete();
				} catch (IOException e) {
					throw new RuntimeException("업로드 파일 저장 중 예외 발생!", e);
				}			
			}		
		}
		return atchFileVO;
	}

	@Override
	public List<AtchFileVO> getAtchFileList(AtchFileVO atchFileVO) {
		List<AtchFileVO> atchFileList = fileDao.getAtchFileList(atchFileVO);
		return atchFileList;
	}

	@Override
	public AtchFileVO getAtchFileDetail(AtchFileVO atchFileVO) {

		return fileDao.getAtchFileDetail(atchFileVO);
	}
}
