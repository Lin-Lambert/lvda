package com.lvda.domain;


public class Notice {

	private Long notice_id;
	
	private String notice_title;
	private String notice_time;
	private String notice_detail;
	public Long getNotice_id() {
		return notice_id;
	}
	public String getNotice_time() {
		return notice_time;
	}
	public void setNotice_time(String notice_time) {
		this.notice_time = notice_time;
	}
	public void setNotice_id(Long notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_detail() {
		return notice_detail;
	}
	public void setNotice_detail(String notice_detail) {
		this.notice_detail = notice_detail;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
}
