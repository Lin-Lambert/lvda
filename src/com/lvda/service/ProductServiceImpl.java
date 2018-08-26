package com.lvda.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.lvda.dao.ProductDao;
import com.lvda.domain.PageBean;
import com.lvda.domain.Product;

@Transactional
public class ProductServiceImpl implements ProductService {

	private ProductDao productDao;
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	@Override
	public List<Product> findAll(Product product) {
		return productDao.findAll(product);
	}
	@Override
	public void save(Product product) {
		productDao.save(product);
	}
	@Override
	public PageBean<Product> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		return productDao.findByPage(pageCode, pageSize, criteria);
	}
	@Override
	public void delete(Long pro_id) {
		productDao.delete(pro_id);
	}
	@Override
	public Product findById(Long pro_id) {
		return productDao.findById(pro_id);
	}
	@Override
	public void update(Product product) {
		productDao.update(product);
	}
	

	
	
}
