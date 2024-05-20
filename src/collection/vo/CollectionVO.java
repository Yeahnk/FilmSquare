package collection.vo;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.LocalDate;

import lombok.Data;

@Data
public class CollectionVO {
	private BigDecimal clId;
	private String memId;
	private String clTitle;
	private Timestamp clDate;
	private String clYn;
	private int likeCnt;
	
	
	
	
	
	
	public CollectionVO(BigDecimal clId, String memId, String clTitle, Timestamp clDate, String clYn) {
		this.clId = clId;
		this.memId = memId;
		this.clTitle = clTitle;
		this.clDate = clDate;
		this.clYn = clYn;
	}

	public CollectionVO(BigDecimal clId) {
		super();
		this.clId = clId;
	}

	

	
	
	
	
}
