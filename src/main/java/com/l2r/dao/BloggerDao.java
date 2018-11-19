package com.l2r.dao;

import com.l2r.entity.Blogger;

public interface BloggerDao {

	public Blogger findBloggerById(Integer id);
	
	public Blogger getByUserName(String userName);
}
