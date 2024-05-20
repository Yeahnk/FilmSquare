package movie.vo;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class CalendarVO {
	
	private LocalDate date;
	private List<Map<LocalDate, List<ReleasingMovieVO>>> releasingList;
	
	public CalendarVO(LocalDate date, List<Map<LocalDate, List<ReleasingMovieVO>>> releasingList) {
		super();
		this.date = date;
		this.releasingList = releasingList;
	}
	
}
