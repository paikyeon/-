package org.sesac.spring_game.vo;

public class JudgeVo {
	private int no;
	private String title,content,relrule,regdate,hapdate;
	
	public JudgeVo(int no, String title, String content, String relrule, String regdate, String hapdate) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.relrule = relrule;
		this.regdate = regdate;
		this.hapdate = hapdate;
	}
	public JudgeVo() {
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRelrule() {
		return relrule;
	}
	public void setRelrule(String relrule) {
		this.relrule = relrule;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getHapdate() {
		return hapdate;
	}
	public void setHapdate(String hapdate) {
		this.hapdate = hapdate;
	}
	@Override
	public String toString() {
		return "ContentVo [no=" + no + ", title=" + title + ", content=" + content + ", relrule=" + relrule
				+ ", regdate=" + regdate + ", hapdate=" + hapdate + "]";
	}

}
