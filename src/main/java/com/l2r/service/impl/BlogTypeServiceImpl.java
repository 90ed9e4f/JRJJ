package com.l2r.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.l2r.dao.BlogTypeDao;
import com.l2r.entity.BlogType;
import com.l2r.service.BlogTypeService;

@Service("blogTypeService")
public class BlogTypeServiceImpl implements BlogTypeService{
	
	@Resource
	private BlogTypeDao blogTypeDao;

	public List<BlogType> getAllBlogType(){
		return blogTypeDao.getAllBlogType();
	}
	
	/**
	 * 根据Id查询Blog类型
	 * @param id
	 * @return
	 */
	public BlogType getBlogTypeById(Integer id) {
		return blogTypeDao.getBlogTypeById(id);
	}
	
	/**
	 * 添加分类
	 * @param blogType
	 * @return
	 */
	public Integer addBlogType(BlogType blogType) {
		return blogTypeDao.addBlogType(blogType);
	}
	
}
