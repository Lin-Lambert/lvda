package com.lvda.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.lvda.dao.LinkDao;
import com.lvda.domain.Link;

@Transactional
public class LinkServiceImpl implements LinkService {

	private LinkDao linkDao;
	public void setLinkDao(LinkDao linkDao) {
		this.linkDao = linkDao;
	}
	
	@Override
	public List<Link> findAll(Link link) {
		return linkDao.findAll(link);
	}
	
	
}
