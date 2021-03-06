package bbsDto;

import java.sql.Timestamp;


public class Article {

	private int bbsID;
	private String title;
	private String userID;
	private Timestamp regdate;
	private String content;
	private int readcnt;
	private int bGroup;


	private int bStep;
	private int bIndent;
	

	public Article() {
	
	}


	public Article(int bbsID, String title, String userID, Timestamp regdate, String content, int readcnt, int bGroup,
			int bStep, int bIndent) {
		super();
		this.bbsID = bbsID;
		this.title = title;
		this.userID = userID;
		this.regdate = regdate;
		this.content = content;
		this.readcnt = readcnt;
		this.bGroup = bGroup;
		this.bStep = bStep;
		this.bIndent = bIndent;
	}


	public int getBbsID() {
		return bbsID;
	}


	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getUserID() {
		return userID;
	}


	public void setUserID(String userID) {
		this.userID = userID;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getReadcnt() {
		return readcnt;
	}


	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}


	public int getbGroup() {
		return bGroup;
	}


	public void setbGroup(int bGroup) {
		this.bGroup = bGroup;
	}


	public int getbStep() {
		return bStep;
	}


	public void setbStep(int bStep) {
		this.bStep = bStep;
	}


	public int getbIndent() {
		return bIndent;
	}


	public void setbIndent(int bIndent) {
		this.bIndent = bIndent;
	}

	
	
	
}