package com.l2r.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.l2r.entity.BlogType;
import com.l2r.service.BlogTypeService;

@Controller
@RequestMapping("/blogType")
public class BlogTypeController {
	
	@Resource
	private BlogTypeService blogTypeService;

	@RequestMapping("addBlogType")
	public String addBlogType(BlogType blogType) {
		blogTypeService.addBlogType(blogType);
		return "/admin/admin";
	}
}
