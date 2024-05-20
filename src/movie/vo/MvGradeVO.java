package movie.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class MvGradeVO {
	private int mvgId;

	private int mvId;
	
	private String memId;
	
	private int mvgRating; // = 별점 *10
	
	private LocalDate mvgDate;
	
	private int gradeAvg; // = 일반 평점 *10

	private int gradeCAvg; // = 평론가 평점 *10

	public MvGradeVO(String memId, int mvgRating) {
		super();
		this.memId = memId;
		this.mvgRating = mvgRating;
	}

	public MvGradeVO() {
		// TODO Auto-generated constructor stub
	}

	public MvGradeVO(String memId, LocalDate mvgDate) {
		super();
		this.memId = memId;
		this.mvgDate = mvgDate;
	}
	
	
	
}
