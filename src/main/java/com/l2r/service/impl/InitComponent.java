package com.l2r.service.impl;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import com.l2r.entity.BlogType;
import com.l2r.entity.Link;
import com.l2r.service.BlogTypeService;
import com.l2r.service.LinkService;

@Component
public class InitComponent implements ServletContextListener,ApplicationContextAware{
	
	private static ApplicationContext applicationContext;

	public void contextInitialized(ServletContextEvent sce) {
		ServletContext application=sce.getServletContext();
		
		LinkService linkService=(LinkService)applicationContext.getBean("linkService");
		List<Link> linkList=linkService.getAllLink();//��ѯ������������
		application.setAttribute("linkList", linkList);
		
		BlogTypeService blogTypeService=(BlogTypeService)applicationContext.getBean("blogTypeService");
		List<BlogType> blogTypeList=blogTypeService.getAllBlogType();//��ѯ���в��ͷ���
		application.setAttribute("blogTypeList", blogTypeList);
		
	}
	
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}

	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext=applicationContext;
		
	}
	
}
