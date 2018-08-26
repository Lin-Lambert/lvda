package com.lvda.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.lvda.domain.News;
import com.lvda.domain.PageBean;

public class NewsDaoImpl<T> extends HibernateDaoSupport implements NewsDao<T> {

	@Override
	public List<News> findAll() {
		return null;
	}

	@SuppressWarnings("unchecked")
	public PageBean<T> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		// 创建分页的对象
		PageBean<T> page = new PageBean<T>();
		// 一个一个设置
		page.setPageCode(pageCode);
		page.setPageSize(pageSize);
		
		// 设置查询聚合函数：SQL已经变成了 select count(*) from 
		criteria.setProjection(Projections.rowCount());
		List<Number> list = (List<Number>) this.getHibernateTemplate().findByCriteria(criteria);
		if(list != null && list.size() > 0){
			int totalCount = list.get(0).intValue();
			// 总记录数
			page.setTotalCount(totalCount);
		}
		
		// 清除SQL select * from xxx
		criteria.setProjection(null);
		criteria.addOrder(Order.desc("nt_time"));
		List<T> beanList = (List<T>) this.getHibernateTemplate().findByCriteria(criteria, (pageCode-1)*pageSize, pageSize);
		// 每页显示的数据
		page.setBeanList(beanList);
		return page;
	}

	@Override
	public void save(News news) {
		this.getHibernateTemplate().save(news);
	}

	@Override
	public News findById(News news) {
		return this.getHibernateTemplate().get(news.getClass(), news.getNt_id());
	}

	@Override
	public void delete(News news) {
		this.getHibernateTemplate().delete(news);
	}

	@Override
	public void update(News news) {
		this.getHibernateTemplate().update(news);
	}

}
