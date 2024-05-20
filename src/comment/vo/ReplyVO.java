package comment.vo;

import java.time.LocalDate;

import lombok.Data;

/*
 * 코멘트댓글PK
사용자PK
영화코멘트PK
코멘트댓글 내용
코멘트댓글 작성일
 */
@Data
public class ReplyVO {
	int mvcreId;  					
	String memId;
	int mvcId;	
	String mvcreContent;
	LocalDate mvcrecDate;
	
	
	String memNcnm;
	String mempStreNm;
}
