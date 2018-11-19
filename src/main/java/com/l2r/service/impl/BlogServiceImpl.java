package com.l2r.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.l2r.dao.BlogDao;
import com.l2r.entity.Blog;
import com.l2r.service.BlogService;

@Service("blogService")
public class BlogServiceImpl implements BlogService{

	@Resource
	private BlogDao blogDao;
	
	/**
	 * 获取BLog
	 * @return
	 */
	public List<Blog> getBlogList(Map<String,Object> map){
		return blogDao.getBlogList(map);
	}
	
	/**
	 * 根据ID获取博客
	 * @return
	 */
	public Blog getBlogById(Integer id) {
		return blogDao.getBlogById(id);
	}
	
	/**
	 * 添加新Blog
	 * @param blog
	 */
	public Integer addBlog(Blog blog) {
		return blogDao.addBlog(blog);
	}
}
