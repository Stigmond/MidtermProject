package com.skilldistillery.crescendo.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	@RequestMapping(path = { "/" })
	public ModelAndView userProfile() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("UserProfile");
		mv.addObject("user", dao.getTestUser());
		return mv;
	}

	@RequestMapping(path = "home.do")
	public String homePage(Model model) {
		return "NewUser";

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
	// will load splash page and only load error if user is null after login attempt: aka they don't have a profile created yet/password was incorrect/etc...
	@RequestMapping(path = "login.do")
	public ModelAndView userLogin(String username, String password, HttpSession session, RedirectAttributes redir) {
		session.setAttribute("loggedIn", dao.attemptLogin(username, password));
		String loginError = "FAILED: Username does not exist or password is incorrect";
		ModelAndView mv = new ModelAndView();
		mv.setViewName("UserProfile");
		if (session.getAttribute("loggedIn") == null) {
			mv.addObject("loginError", loginError);
		}
		return mv;
	}
	
	@RequestMapping(path= "logout.do")
	public ModelAndView userLogout(HttpSession session) {
		session.setAttribute("loggedIn", null);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("UserProfile");
		mv.addObject("user", dao.getTestUser());
		return mv;
	}

}
