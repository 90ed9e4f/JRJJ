package com.l2r.service;

import java.util.List;
import java.util.Map;

import com.l2r.entity.Blog;

public interface BlogService {

	/**
	 * 获取BLog
	 * @return
	 */
	public List<Blog> getBlogList(Map<String,Object> map);
	
	/**
	 * 根据ID获取博客
	 * @return
	 */
	public Blog getBlogById(Integer id);
	
	/**
	 * 添加新Blog
	 * @param blog
	 */
	public Integer addBlog(Blog blog);
}
