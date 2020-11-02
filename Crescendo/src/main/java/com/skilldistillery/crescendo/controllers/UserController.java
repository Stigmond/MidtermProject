package com.skilldistillery.crescendo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.crescendo.data.UserDAO;
import com.skilldistillery.crescendo.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;

	@RequestMapping(path = "test.do")
	public String home(Model model) {
		model.addAttribute("user", dao.getTestUser());
		return "test";
	}

	@RequestMapping(path = "/")
	public ModelAndView userProfile() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("UserProfile");
		mv.addObject("user", dao.getTestUser());
		return mv;
	}

	@RequestMapping(path = "home.do")
	public String homePage(Model model) {
		return "index";

	}

	@RequestMapping(path = "makeUserUpdates.do")
	public ModelAndView updateUser(int id, User user) {
	ModelAndView mv = new ModelAndView();
	mv.addObject("user", dao.updateUser(id, user));
	mv.setViewName("UserProfile");
	return mv;
	}

}
