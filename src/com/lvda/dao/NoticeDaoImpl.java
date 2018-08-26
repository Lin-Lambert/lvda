package com.lvda.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.lvda.domain.Notice;
import com.lvda.domain.PageBean;

public class NoticeDaoImpl extends HibernateDaoSupport implements NoticeDao {


	@Override
	public List<Notice> findAll(Notice notice) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(notice.getClass());
		return (List<Notice>) this.getHibernateTemplate().findByCriteria(detachedCriteria);
	}

	@Override
	public PageBean<Notice> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		// 创建分页的对象
				PageBean<Notice> page = new PageBean<Notice>();
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
				criteria.addOrder(Order.desc("notice_time"));
				List<Notice> beanList = (List<Notice>) this.getHibernateTemplate().findByCriteria(criteria, (pageCode-1)*pageSize, pageSize);
				// 每页显示的数据
				page.setBeanList(beanList);
				return page;
	}

	@Override
	public void save(Notice notice) {
		getHibernateTemplate().save(notice);
	}

	@Override
	public Notice findById(Long notice_id) {
		return (Notice) getHibernateTemplate().get(Notice.class, notice_id);
	}

	@Override
	public void update(Notice notice) {
		getHibernateTemplate().update(notice);
	}

	@Override
	public void delete(Notice notice) {
		getHibernateTemplate().delete(notice);
	}

}
