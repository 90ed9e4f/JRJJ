package com.l2r.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.l2r.entity.Blog;
import com.l2r.lucene.BlogIndex;
import com.l2r.service.BlogService;

@Controller
@RequestMapping("/blog")
public class BlogController {
	
	@Resource
	private BlogService blogService;
	
	private BlogIndex blogIndex=new BlogIndex();

	@RequestMapping("/detail/{id}")
	public ModelAndView detail(@PathVariable("id")Integer id) {
		ModelAndView mav=new ModelAndView();
		Blog blog=blogService.getBlogById(id);
		mav.addObject("blog", blog);
		mav.setViewName("detail");
		return mav;
	}
	
	@RequestMapping("/addBlog")
	public String addBlog(Blog blog) throws Exception {
		blogService.addBlog(blog);
		blogIndex.addIndex(blog);
		return "/admin/writeBlog";
	}
	
	@RequestMapping("/all")
	public ModelAndView all(@RequestParam(value="typeId",required=false)Integer typeId) {
		ModelAndView mav=new ModelAndView();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("typeId", typeId);
		List<Blog> blogList=blogService.getBlogList(map);
		mav.addObject("blogList",blogList);
		mav.setViewName("allBlog");
		return mav;
	}
//	public String addBlog(Blog blog,HttpServletResponse response) throws Exception {
//		Integer resultTotal=0;
//		if(blog.getId()==null) {
//			resultTotal=blogService.addBlog(blog);
//		}
//		JSONObject result=new JSONObject();
//		if(resultTotal>0) {
//			result.put("success", true);
//		}else {
//			result.put("success", false);
//		}
//		ResponseUtil.write(response, result);
//		return null;
//	}
	
	
	@RequestMapping("/query")
	public ModelAndView search(@RequestParam(value="query",required=false) String query,HttpServletRequest request)throws Exception{
		ModelAndView mav=new ModelAndView();
		List<Blog> blogList=blogIndex.searchblog(query);
//		Integer toIndex=projectList.size()>=Integer.parseInt(page)*pageSize?Integer.parseInt(page)*pageSize:projectList.size();
//		mav.addObject("proList", projectList.subList((Integer.parseInt(page)-1)*pageSize, toIndex));
//		mav.addObject("pageCode",this.genUpAndDownPageCode(Integer.parseInt(page), projectList.size(), q, pageSize, request.getServletContext().getContextPath()));
		mav.addObject("query", query);
//		mav.addObject("resultTotal", projectList.size());
		mav.addObject("blogList",blogList);
		mav.setViewName("allBlog");
		return mav;
	}
	
	
}
