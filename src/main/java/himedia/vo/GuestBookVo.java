package himedia.vo;

import java.util.Date;

public class GuestBookVo {
	private int no;
	private String name;
	private String content;
	private Date regDate;

	public GuestBookVo(int no, String name, String content, Date regDate) {
		this.no = no;
		this.name = name;
		this.content = content;
		this.regDate = regDate;
	}

	public int getNo() {
		return no;
	}

	public String getName() {
		return name;
	}

	public String getContent() {
		return content;
	}

	public Date getRegDate() {
		return regDate;
	}

	@Override
	public String toString() {
		return "GuestBookVo [no=" + no + ", name=" + name + ", content=" + content + ", regDate=" + regDate + "]";
	}
	
	
}
