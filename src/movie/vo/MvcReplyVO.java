package movie.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class MvcReplyVO {
	private int mvcreId;
	
	private String memId;
	
	private int mvcId;
	
	private String mvcreContent;
	
	private LocalDate mvcrecDate;
	
}
