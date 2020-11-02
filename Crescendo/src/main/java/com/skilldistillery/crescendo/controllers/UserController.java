package com.skilldistillery.crescendo.controllers;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.crescendo.data.UserDAO;
import com.skilldistillery.crescendo.entities.Album;
import com.skilldistillery.crescendo.entities.Blog;
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

	@RequestMapping(path = { "/" })
	public ModelAndView userProfile() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("UserProfile");
		mv.addObject("user", dao.getTestUser());
		return mv;
	}

	@RequestMapping(path = "home.do")
	public ModelAndView homePage(Model model) {
		ModelAndView mv = new ModelAndView();
		List<Album> albums = dao.getAlbums();
		List<Blog> blogs = dao.getBlogs();
		Collections.shuffle(albums);
		mv.addObject("albums", albums);
		mv.addObject("blogs", blogs);
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping(path = "makeUserUpdates.do")
	public ModelAndView updateUser(User user) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", dao.updateUser(user));
		mv.setViewName("UserProfile");
		return mv;
	}

	@RequestMapping(path = "newUser.do")
	public ModelAndView createUser(User user, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();

		redir.addFlashAttribute("user", dao.createUser(user));
		mv.setViewName("redirect:makeUserUpdates.do");

		return mv;

	}

}
