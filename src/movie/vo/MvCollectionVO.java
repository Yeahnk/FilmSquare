package movie.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class MvCollectionVO {
	private int clId;
	private String memId;
	private String clTitle;
	private LocalDate clDate;
	private String clYn;
	private int likeCnt;
	
	//clcontent table
	private int mvId;

	
}
