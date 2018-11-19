package com.l2r.dao;

import java.util.List;

import com.l2r.entity.BlogType;

public interface BlogTypeDao {

	public List<BlogType> getAllBlogType();
	
	/**
	 * 根据Id查询Blog类型
	 * @param id
	 * @return
	 */
	public BlogType getBlogTypeById(Integer id);
	
	/**
	 * 添加分类
	 * @param blogType
	 * @return
	 */
	public Integer addBlogType(BlogType blogType);
}
