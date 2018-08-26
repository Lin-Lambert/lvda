package com.lvda.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.lvda.domain.Link;

public class LinkDaoImpl extends HibernateDaoSupport implements LinkDao {

	@Override
	public List<Link> findAll(Link link) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(link.getClass());
		return (List<Link>) this.getHibernateTemplate().findByCriteria(detachedCriteria);
	}

}
