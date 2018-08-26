package com.lvda.dao;

import java.util.List;

import com.lvda.domain.Link;

public interface LinkDao {

	List<Link> findAll(Link link);

}
