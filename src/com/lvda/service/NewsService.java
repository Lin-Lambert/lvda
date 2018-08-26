package com.lvda.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.lvda.domain.News;
import com.lvda.domain.PageBean;

public interface NewsService {
	
	public PageBean<News> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);
	public List<News> findAll();
	public void save(News news);
	public void delete(News news);
	public News findById(News news);
	public void update(News news);
}
