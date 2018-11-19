package com.l2r.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.l2r.dao.BloggerDao;
import com.l2r.entity.Blogger;
import com.l2r.service.BloggerService;

@Service("bloggerService")
public class BloggerServiceImpl implements BloggerService{

	@Resource
	private BloggerDao bloggerDao;

	public Blogger findBloggerById(Integer id) {
		return bloggerDao.findBloggerById(id);
	}
	
	public Blogger getByUserName(String userName){
		return bloggerDao.getByUserName(userName);
	}

}
	