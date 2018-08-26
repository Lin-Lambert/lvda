package com.lvda.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.lvda.domain.PageBean;
import com.lvda.domain.Product;

public interface ProductService {

	List<Product> findAll(Product product);

	void save(Product product);

	PageBean<Product> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);

	void delete(Long pro_id);

	Product findById(Long pro_id);

	void update(Product product);


}
