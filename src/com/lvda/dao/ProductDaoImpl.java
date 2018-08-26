package com.lvda.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.lvda.domain.PageBean;
import com.lvda.domain.Product;

public class ProductDaoImpl extends HibernateDaoSupport implements ProductDao {

	@Override
	public List<Product> findAll(Product product) {
		DetachedCriteria criteria = DetachedCriteria.forClass(product.getClass());
		return (List<Product>) getHibernateTemplate().findByCriteria(criteria);
	}

	@Override
	public void save(Product product) {
		getHibernateTemplate().save(product);
	}

	@SuppressWarnings("all")
	@Override
	public PageBean<Product> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		PageBean<Product> page = new PageBean<Product>();
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
		criteria.addOrder(Order.desc("pro_time"));
		List<Product> beanList = (List<Product>) this.getHibernateTemplate().findByCriteria(criteria, (pageCode-1)*pageSize, pageSize);
		// 每页显示的数据
		page.setBeanList(beanList);
		return page;
	}

	@Override
	public void delete(Long pro_id) {
		Product product = getHibernateTemplate().get(Product.class, pro_id);
		getHibernateTemplate().delete(product);
	}

	@Override
	public Product findById(Long pro_id) {
		return getHibernateTemplate().get(Product.class, pro_id);
	}

	@Override
	public void update(Product product) {
		getHibernateTemplate().update(product);
	}


}
