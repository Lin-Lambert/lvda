package com.lvda.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.lvda.domain.News;
import com.lvda.domain.PageBean;

public interface NewsDao<T> {

	public List<News> findAll();
	public PageBean<T> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);
	public void save(News news);
	public News findById(News news);
	public void delete(News news);
	public void update(News news);
}
