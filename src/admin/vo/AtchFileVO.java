package admin.vo;

import lombok.Data;

@Data
public class AtchFileVO {
	
	private int ebiId;
	private int ebId;
	private int ebiSn;
	private String ebiPath;
	private String ebiStreNm;
	private String ebiOrgnNm;
	private String ebiExtsn;
	private long ebiSize;
}  
