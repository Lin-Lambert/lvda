package com.lvda.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.lvda.domain.Notice;
import com.lvda.domain.PageBean;

public interface NoticeDao {

	List<Notice> findAll(Notice notice);

	PageBean<Notice> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);

	void save(Notice notice);

	Notice findById(Long notice_id);

	void update(Notice notice);

	void delete(Notice notice);

}
