package com.lvda.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.lvda.dao.NewsDao;
import com.lvda.domain.News;
import com.lvda.domain.PageBean;

@Transactional
public class NewsServiceImpl implements NewsService {
	
	private NewsDao<News> newsDao;
	public void setNewsDao(NewsDao<News> newsDao) {
		this.newsDao = newsDao;
	}

	public List<News> findAll() {
		return null;
	}

	@Override
	public PageBean<News> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		return newsDao.findByPage(pageCode,pageSize,criteria);
	}

	@Override
	public void save(News news) {
		newsDao.save(news);
	}

	@Override
	public News findById(News news) {
		return newsDao.findById(news);
	}

	@Override
	public void delete(News news) {
		newsDao.delete(news);
	}

	@Override
	public void update(News news) {
		newsDao.update(news);
	}

}
