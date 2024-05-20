package comm.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import character.vo.PersonImageVO;
import character.vo.PersonInfoVO;
import character.vo.PersonVO;
import movie.vo.ActorVO;
import util.MyBatisDao;

public class DBTest extends MyBatisDao {
	
	static int startIdx = 30001;
	static int endIdx = 100000;
	
	List<PersonVO> psList = new ArrayList<PersonVO>();
	List<PersonVO> sameNameList = new ArrayList<PersonVO>();
	
	public static void main(String[] args) {
		
		DBTest dt = new DBTest();
		
		int cnt = 0;
		// person 테이블 처음부터 조회
		for(int i= startIdx; i<=endIdx; i++) {
			HashMap<String, Object> map = new HashMap<>();
			
			System.out.println("ps id : " + i + "인 사람 조회 중");
			
			// 남길 마동석
			PersonVO winPerson = dt.selectOne("dbTest.selectPersonList", i);
			if(winPerson == null) continue;
			map.put("winPerson", winPerson.getPsId());
			
			// 지워질 마동석들
			List<PersonVO> losingPeople = dt.selectList("dbTest.selectSameNameList", winPerson);
			
			for(PersonVO losingPerson : losingPeople) {
				map.put("losingPerson", losingPerson.getPsId());

				// 지워질 마동석의 이미지를 가져오기
				List<PersonImageVO> losePersonImageList = dt.selectList("dbTest.selectImages", map);
				
				// 각 이미지가 남을 마동석에게 있는지 확인
				for(PersonImageVO losePersonImage : losePersonImageList) {
					
					map.put("losePersonImage", losePersonImage.getPsiSrc());
					// 남을 마동석에게 지워질 마동석의 정보 이미 있는지 확인
					if(dt.selectList("dbTest.selectImagesChk", map).size() == 0) {
						
						// 남을 마동석에게 해당 정보가 없으면 지워질 마동석의 정보 남을 마동석으로 바꿔주기
						dt.update("dbTest.updateImages", map);			
						
					}else {
						// 남을 마동석에게 지워질 마동석의 정보가 이미 있으면 지워질 마동석의 정보 삭제
						dt.delete("dbTest.deleteDuplImg", map);
					}
				}
				
				// 지워질 마동석의 인물정보 가져오기
				List<PersonInfoVO> losePersonInfoList = dt.selectList("dbTest.selectLoserPsInfo", map);
				
				// 각 인물정보가 남을 마동석에게 있는지 확인
				for (PersonInfoVO personInfoVOToDelete : losePersonInfoList) {
					
					map.put("losingPersonInfo", personInfoVOToDelete.getPsinfoVal());
					
					// 남을 마동석에게 지워질 마동석의 인물정보 이미 있는지 확인
					if(dt.selectList("dbTest.selectPsInfo", map).size() ==0) {
						
						System.out.println("정보가 없습니다. 남을 사람에게 넘겨줍니다.");
						
						// 남을 마동석에게 해당 인물정보가 없으면 지워질 마동석의 정보를 남을 마동석의 정보로 바꿔주기
						dt.update("dbTest.updatePsInfo", map);
						
					}else {
						// 남을 마동석에게 지워질 마동석의 정보가 이미 있으면 지워질 마동석의 정보 삭제
						
						System.out.println("이미 있는 정보 입니다. 삭제합니다.");
						System.out.println("!!!!!!!!!!!!"+personInfoVOToDelete.getPsId());
						System.out.println("!!!!!!!!!!!!"+personInfoVOToDelete.getPsinfoVal());
						dt.delete("dbTest.deleteDuplPsInfo", personInfoVOToDelete);
					}
				}
				
				
				// 지워질 마동석의 액터 정보 가져오기
				List<ActorVO> loseActorInfoList = dt.selectList("dbTest.selectLoserActorInfo", map);
				
				// 각 액터정보가 남을 마동석에게 있는지 확인
				for (ActorVO actorVO : loseActorInfoList) {
					
					map.put("actorMvId", actorVO.getMvId());
					
					System.out.println("actorRole ==> " + map.get("actorMvId"));
					
					// 남을 마동석에게 지워질 마동석의  액터정보 이미 있는지 확인
					if(dt.selectList("dbTest.selectActorInfo", map).size() == 0) {
						System.out.println("size!!!>>>>" + dt.selectList("dbTest.selectActorInfo", map).size());
						
						// 남을 마동석에게 해당  액터정보가 없으면 지워질 마동석의 정보를 남을 마동석의 정보로 바꿔주기
						int upCnt = dt.update("dbTest.updateActors", map);
						System.out.println("upCnt == > " + upCnt);
						
					}else {
						// 남을 마동석에게 지워질 마동석의 정보가 이미 있으면 지워질 마동석의 정보 삭제
						int delCnt = dt.delete("dbTest.deleteDuplActorInfo", map);
						System.out.println("delCnt == > " + delCnt);
						
						
					}
					
				}
				
				// 최종적으로 진 마동석 삭제
				dt.delete("dbTest.deleteLoser", map);
			}
			cnt ++;
		}
		System.out.println(cnt + " 개 작업완료");
		
	}
	

}
