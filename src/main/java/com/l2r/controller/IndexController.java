package com.l2r.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.l2r.entity.Blog;
import com.l2r.service.BlogService;

@Controller
@RequestMapping("/")
public class IndexController {
	
	@Resource
	private BlogService blogService;
	
	@RequestMapping("/index")
	public ModelAndView index(@RequestParam(value="typeId",required=false)Integer typeId){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("typeId", typeId);
		List<Blog> blogList=blogService.getBlogList(map);
		ModelAndView mav=new ModelAndView();
		mav.addObject("blogList",blogList);
		mav.setViewName("index");
		return mav;
	}

}
