package com.l2r.service;

import com.l2r.entity.Blogger;

public interface BloggerService {

	public Blogger findBloggerById(Integer id);
	
	public Blogger getByUserName(String userName);
}
