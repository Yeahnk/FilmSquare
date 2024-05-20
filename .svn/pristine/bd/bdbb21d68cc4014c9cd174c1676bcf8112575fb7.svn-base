package movie.vo;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.LocalDate;

public class ReleasingMovieVO {
	
	private BigDecimal mvId;
	private int mvIdInt;
	private String mvTitle;
	private String mvUrl;
	private String mvKmid;
	private String mvKmseq;
	private String mvCode;
	private BigDecimal mvRtime;
	private int mvRtimeInt;
	private LocalDate mvRelDate;
	private String mvDirector;
	private String mvRyear;
	private String mvPlot;
	private String mvGenre;
	private String mvAgelimit;
	private String mvEngtitle;
	private String mvNation;
	private Timestamp mvRdate;
	private String mvBackground;
	
	
	
	public ReleasingMovieVO(BigDecimal mvId, String mvTitle, String mvUrl, String mvKmid, String mvKmseq, String mvCode,
			BigDecimal mvRtime, Timestamp mvRdate, String mvDirector, String mvRyear, String mvPlot, String mvGenre,
			String mvAgelimit, String mvEngtitle, String mvNation, String mvBackground) {
		super();
		this.mvId = mvId;
		this.mvIdInt = mvId.intValue();
		this.mvTitle = mvTitle;
		this.mvUrl = mvUrl;
		this.mvKmid = mvKmid;
		this.mvKmseq = mvKmseq;
		this.mvCode = mvCode;
		this.mvRtime = mvRtime;
		this.mvRtimeInt = mvRtime.intValue();
		this.mvRdate = mvRdate;
		this.mvDirector = mvDirector;
		this.mvRyear = mvRyear;
		this.mvPlot = mvPlot;
		this.mvGenre = mvGenre;
		this.mvAgelimit = mvAgelimit;
		this.mvEngtitle = mvEngtitle;
		this.mvNation = mvNation;
		this.mvRelDate = mvRdate.toLocalDateTime().toLocalDate();
		this.mvBackground = mvBackground;
	}
	
	


	public LocalDate getMvRelDate() {
		return mvRelDate;
	}

	public void setMvRelDate(LocalDate mvRelDate) {
		this.mvRelDate = mvRelDate;
		this.mvRdate = Timestamp.valueOf(mvRelDate.atStartOfDay());
	}

	public Timestamp getMvRdate() {
		return mvRdate;
	}

	public void setMvRdate(Timestamp mvRdate) {
		this.mvRdate = mvRdate;
	}

	public BigDecimal getMvId() {
		return mvId;
	}

	public void setMvId(BigDecimal mvId) {
		this.mvId = mvId;
		this.mvIdInt = mvId.intValue();
	}

	public String getMvTitle() {
		return mvTitle;
	}

	public void setMvTitle(String mvTitle) {
		this.mvTitle = mvTitle;
	}

	public String getMvUrl() {
		return mvUrl;
	}

	public void setMvUrl(String mvUrl) {
		this.mvUrl = mvUrl;
	}

	public String getMvKmid() {
		return mvKmid;
	}

	public void setMvKmid(String mvKmid) {
		this.mvKmid = mvKmid;
	}

	public String getMvKmseq() {
		return mvKmseq;
	}

	public void setMvKmseq(String mvKmseq) {
		this.mvKmseq = mvKmseq;
	}

	public String getMvCode() {
		return mvCode;
	}

	public void setMvCode(String mvCode) {
		this.mvCode = mvCode;
	}

	public BigDecimal getMvRtime() {
		return mvRtime;
	}

	public void setMvRtime(BigDecimal mvRtime) {
		this.mvRtime = mvRtime;
		this.mvRtimeInt = mvRtime.intValue();
	}

	public String getMvDirector() {
		return mvDirector;
	}

	public void setMvDirector(String mvDirector) {
		this.mvDirector = mvDirector;
	}

	public String getMvRyear() {
		return mvRyear;
	}

	public void setMvRyear(String mvRyear) {
		this.mvRyear = mvRyear;
	}

	public String getMvPlot() {
		return mvPlot;
	}

	public void setMvPlot(String mvPlot) {
		this.mvPlot = mvPlot;
	}

	public String getMvGenre() {
		return mvGenre;
	}

	public void setMvGenre(String mvGenre) {
		this.mvGenre = mvGenre;
	}

	public String getMvAgelimit() {
		return mvAgelimit;
	}

	public void setMvAgelimit(String mvAgelimit) {
		this.mvAgelimit = mvAgelimit;
	}

	public String getMvEngtitle() {
		return mvEngtitle;
	}

	public void setMvEngtitle(String mvEngtitle) {
		this.mvEngtitle = mvEngtitle;
	}

	public String getMvNation() {
		return mvNation;
	}

	public void setMvNation(String mvNation) {
		this.mvNation = mvNation;
	}
	
	

}
