package com.lvda.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.lvda.dao.NoticeDao;
import com.lvda.domain.Notice;
import com.lvda.domain.PageBean;

@Transactional
public class NoticeServiceImpl implements NoticeService {

	private NoticeDao noticeDao;
	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}
	

	@Override
	public List<Notice> findAll(Notice notice) {
		return noticeDao.findAll(notice);
	}


	@Override
	public PageBean<Notice> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		return noticeDao.findByPage(pageCode, pageSize, criteria);
	}


	@Override
	public void save(Notice notice) {
		noticeDao.save(notice);
	}


	@Override
	public Notice findById(Long notice_id) {
		return noticeDao.findById(notice_id);
	}


	@Override
	public void update(Notice notice) {
		noticeDao.update(notice);
	}


	@Override
	public void delete(Notice notice) {
		noticeDao.delete(notice);
	}
	
	
}
