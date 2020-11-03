package com.skilldistillery.crescendo.controllers;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.crescendo.data.UserDAO;
import com.skilldistillery.crescendo.entities.Album;
import com.skilldistillery.crescendo.entities.AlbumComment;
import com.skilldistillery.crescendo.entities.Blog;
import com.skilldistillery.crescendo.entities.Parent;
import com.skilldistillery.crescendo.entities.User;
import com.skilldistillery.crescendo.entities.Thread;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;

	@RequestMapping(path = "test.do")
	public String home(Model model) {
		model.addAttribute("user", dao.getTestUser());
		return "test";
	}
	
	@RequestMapping(path = "getUserProfile.do")
	public ModelAndView getUserProfile(int id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", dao.getUser(id));
		mv.setViewName("UserProfile");
		return mv;
	}
	@RequestMapping(path = {"userProfile.do"})
	public ModelAndView userProfile() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("UserProfile");
		mv.addObject("user", dao.getTestUser());
		return mv;
	}

	@RequestMapping(path = {"/", "home.do"})
	public ModelAndView homePage(Model model) {
		ModelAndView mv = new ModelAndView();
		
		List<Album> albums = dao.getAlbums();
		Collections.shuffle(albums);
		mv.addObject("album1", albums.get(0));
		mv.addObject("album2", albums.get(1));
		mv.addObject("album3", albums.get(2));

		List<Blog> blogs = dao.getBlogs();
		Collections.shuffle(blogs);
		mv.addObject("blogs", blogs.get(0));
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

	@RequestMapping(path = "createUser.do")
	public ModelAndView createUser(User user, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();

		redir.addFlashAttribute("user", dao.createUser(user));
		mv.setViewName("redirect:makeUserUpdates.do");

		return mv;

	}

	// will load splash page and only load error if user is null after login
	// attempt: aka they don't have a profile created yet/password was
	// incorrect/etc...
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

	@RequestMapping(path = "logout.do")
	public ModelAndView userLogout(HttpSession session) {
		session.setAttribute("loggedIn", null);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("UserProfile");
		mv.addObject("user", dao.getTestUser());
		return mv;
	}

	@RequestMapping(path = "viewAlbum.do")
	public ModelAndView displaySingleAlbum(int id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("AlbumInfo");
		Album album = dao.getAlbumById(id);
		mv.addObject("album", album);
		List<AlbumComment> commentSample = album.getAlbumComments();
		Collections.shuffle(commentSample);
		if (commentSample.size() > 2) {
			commentSample = commentSample.subList(0, 3);
		}
		mv.addObject("commentSample", commentSample);
		return mv;
	}
	
	@RequestMapping(path= "viewComments.do")
	public ModelAndView showCommentThread(String type, int id) {
		Parent parent = null;
		Object parentObject = null;
		if (type.equals("blog")) {
			parent = Parent.BLOG;
//			parentObject = em.find(Blog.class, id);
		} else if (type.equals("thread")) {
			parent = Parent.THREAD;
//			parentObject = em.find(Thread.class, id);
		} else if (type.equals("album")) {
			parent = Parent.ALBUM;
			parentObject = dao.getAlbumById(id);
		} 
		ModelAndView mv = new ModelAndView();
		mv.addObject("parentType", parent);
		switch (parent) {
		case BLOG:
			mv.addObject("commentList", ((Blog) parentObject).getBlogComments());
			mv.addObject("parentObject", (Blog) parentObject);
			break;
		case THREAD:
			mv.addObject("commentList", ((Thread) parentObject).getThreadComments());
			mv.addObject("parentObject", (Thread) parentObject);
			break;
		case ALBUM:
			mv.addObject("commentList", ((Album) parentObject).getAlbumComments());
			mv.addObject("parentObject", (Album) parentObject);
			break;
		}
		return mv;
	}

}
