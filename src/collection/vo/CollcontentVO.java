package collection.vo;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class CollcontentVO {
	private BigDecimal mvId;
	private BigDecimal clId;
	
	
	public CollcontentVO(BigDecimal clId) {
		super();
		this.clId = clId;
	}


	public CollcontentVO(BigDecimal mvId, BigDecimal clId) {
		super();
		this.mvId = mvId;
		this.clId = clId;
	}

	
	
}
