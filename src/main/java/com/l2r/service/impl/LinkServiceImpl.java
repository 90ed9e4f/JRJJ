package com.l2r.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.l2r.dao.LinkDao;
import com.l2r.entity.Link;
import com.l2r.service.LinkService;

@Service("linkService")
public class LinkServiceImpl implements LinkService{
	
	@Resource
	private LinkDao linkDao;
	
	public List<Link> getAllLink(){
		return linkDao.getAllLink();
	}

}
