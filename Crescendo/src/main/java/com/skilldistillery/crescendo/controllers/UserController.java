package com.skilldistillery.crescendo.controllers;

import java.util.ArrayList;
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

import com.skilldistillery.crescendo.entities.Genre;
import com.skilldistillery.crescendo.entities.Parent;

import com.skilldistillery.crescendo.entities.BlogComment;

import com.skilldistillery.crescendo.entities.ResultType;
import com.skilldistillery.crescendo.entities.SearchType;
import com.skilldistillery.crescendo.entities.Topic;
import com.skilldistillery.crescendo.entities.TopicComment;
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

	@RequestMapping(path = "getUserProfile.do")
	public ModelAndView getUserProfile(int id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", dao.getUser(id));
		mv.setViewName("UserProfile");
		return mv;
	}

	@RequestMapping(path = { "userProfile.do" })
	public ModelAndView userProfile() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("UserProfile");
		mv.addObject("user", dao.getTestUser());
		return mv;
	}

	@RequestMapping(path = { "/", "home.do" })
	public ModelAndView homePage() {
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

	@RequestMapping(path = "editAlbum.do")
	public ModelAndView editAlbum(int id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("album", dao.getAlbumById(id));
		mv.setViewName("editAlbum");
		return mv;
	}

	@RequestMapping(path = "updateAlbum.do")
	public ModelAndView updateAlbum(Album album, String artistName, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();

//		mv.addObject("album", dao.editAlbum(album, artistName));

		redir.addFlashAttribute("album", dao.editAlbum(album, artistName));

		mv.setViewName("redirect:viewAlbum.do?id=" + album.getId());

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
			mv.addObject("warningMessage", loginError);
		} else {
			mv.addObject("user", session.getAttribute("loggedIn"));
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

	@RequestMapping(path = "viewComments.do")
	public ModelAndView showCommentThread(String type, int id) {
		Object parentObject = null;
		ModelAndView mv = new ModelAndView();
		if (type.toLowerCase().equals("blog")) {
			parentObject = dao.getBlogById(id);
			mv.addObject("commentList", ((Blog) parentObject).getBlogComments());
			mv.addObject("parentObject", (Blog) parentObject);
		} else if (type.toLowerCase().equals("topic")) {
			parentObject = dao.getTopicById(id);
			mv.addObject("commentList", ((Topic) parentObject).getThreadComments());
			mv.addObject("parentObject", (Topic) parentObject);
			mv.addObject("firstComment", dao.getFirstCommentOnTopic(id));
		} else if (type.toLowerCase().equals("album")) {
			parentObject = dao.getAlbumById(id);
			mv.addObject("commentList", ((Album) parentObject).getAlbumComments());
			mv.addObject("parentObject", (Album) parentObject);
		}
		return mv;
	}

	@RequestMapping(path = "search.do")
	public ModelAndView searchResults(String val, String resultType, String searchType) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("searchResult");
		switch (SearchType.get(searchType)) {
		case KEYWORD:
			switch (ResultType.get(resultType.toLowerCase())) {
			case BLOG:
				mv.addObject("resultList", dao.getBlogsByKeyword(val));
				break;
			case ALBUM:
				mv.addObject("resultList", dao.getAlbumsByKeyword(val));
				break;
			case TOPIC:
				mv.addObject("resultList", dao.getTopicsByKeyword(val));
				break;
			case BLOG_COMMENT:
				mv.addObject("resultList", dao.getBlogCommentsByKeyword(val));
				break;
			case ALBUM_COMMENT:
				mv.addObject("resultList", dao.getAlbumCommentsByKeyword(val));
				break;
			case TOPIC_COMMENT:
				mv.addObject("resultList", dao.getTopicCommentsByKeyword(val));
				break;
			case BUYSELLTRADE:
				mv.addObject("resultList", dao.getBSTByKeyword(val));
				break;
			}
			break;
		case USERNAME:
			switch (ResultType.get(resultType.toLowerCase())) {
			case BLOG:
				mv.addObject("resultList", dao.getBlogsByUser(val));
				break;
			case ALBUM:
				mv.addObject("resultList", null);
				mv.addObject("albumError", "...");
				break;
			case TOPIC:
				mv.addObject("resultList", dao.getTopicsByUser(val));
				break;
			case BLOG_COMMENT:
				mv.addObject("resultList", dao.getBlogCommentsByUser(val));
				break;
			case ALBUM_COMMENT:
				mv.addObject("resultList", dao.getAlbumCommentsByUser(val));
				break;
			case TOPIC_COMMENT:
				mv.addObject("resultList", dao.getTopicCommentsByUser(val));
				break;
			case BUYSELLTRADE:
				mv.addObject("resultList", dao.getBSTByUser(val));
			}
			break;
		}
		return mv;
	}

	@RequestMapping(path = "newTopic.do")
	public String startPost(HttpSession session) {
		return session.getAttribute("loggedIn") == null ? "index" : "NewTopic";
	}

	@RequestMapping(path = "createAlbum.do")
	public ModelAndView createAlbum(Album album, String artistName, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();

		redir.addFlashAttribute("album", album = dao.createAlbum(album, artistName));
		mv.setViewName("redirect:viewAlbum.do?id=" + album.getId());

		return mv;

	}

	@RequestMapping(path = "newAlbum.do")
	public ModelAndView newAlbum() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("AddAlbum");
		return mv;
	}

	@RequestMapping(path = "openTrades.do")
	public ModelAndView showAllTrades() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("openTrades");
		mv.addObject("buySellList", dao.getBuySell());
		mv.addObject("tradeList", dao.getTrades());

		return mv;
	}

	@RequestMapping(path = "tradePage.do")
	public ModelAndView showSingleTrade(int id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("tradePage");
		mv.addObject("t", dao.getTradeById(id));

		return mv;
	}

	@RequestMapping(path = "tradeSearch.do", params = "cid")
	public ModelAndView showTradesByCreator(int cid) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("tradeList");
		mv.addObject("resultList", dao.getTradesByUser(cid));

		return mv;
	}

	@RequestMapping(path = "tradeDelete.do")
	public String deleteTradeByCreator(int id, RedirectAttributes redir) {
		String succ = "deletion successful";
		String fail = "deletion failed";
		ModelAndView mv = new ModelAndView();
		redir.addFlashAttribute("warningMessage", dao.deleteBST(id) ? succ : fail);
		return "redirect:openTrades.do";
	}
	@RequestMapping(path = "commentReply.do")
	public ModelAndView postCommentReply(String body, HttpSession session, RedirectAttributes redir) {

		ModelAndView mv = new ModelAndView();

//		mv.setViewName("viewComments");
		if (session.getAttribute("replyingTo").getClass().getSimpleName().toLowerCase().equals("album")) {
			mv.setViewName(String.format("redirect:viewComments.do?type=%s&id=%s",
					session.getAttribute("replyingTo").getClass().getSimpleName().toLowerCase(),
					((Album) session.getAttribute("replyingTo")).getId()));
			AlbumComment comment = new AlbumComment();
			comment.setUser(dao.getUser(((User) session.getAttribute("loggedIn")).getId()));
			comment.setBody(body);
			comment.setEdited(0);
			comment.setAlbum(dao.getAlbumById(((Album) session.getAttribute("replyingTo")).getId()));
			comment = dao.addReplyToAlbum(comment);
			redir.addFlashAttribute("parentObject",
					dao.getAlbumById(((Album) session.getAttribute("replyingTo")).getId()));
			redir.addFlashAttribute("commentList",
					dao.getAlbumById(((Album) session.getAttribute("replyingTo")).getId()).getAlbumComments());

//			mv.addObject("commentList", ((Album) session.getAttribute("replyingTo")).getAlbumComments());
//			mv.addObject("parentObject", (Album) session.getAttribute("replyingTo"));

		} else if (session.getAttribute("replyingTo").getClass().getSimpleName().toLowerCase().equals("topic")) {
			mv.setViewName(String.format("redirect:viewComments.do?type=%s&id=%s",
					session.getAttribute("replyingTo").getClass().getSimpleName().toLowerCase(),
					((Topic) session.getAttribute("replyingTo")).getId()));
			TopicComment comment = new TopicComment();
			comment.setUser(dao.getUser(((User) session.getAttribute("loggedIn")).getId()));
			comment.setBody(body);
			comment.setEdited(0);
			comment.setThread(dao.getTopicById(((Topic) session.getAttribute("replyingTo")).getId()));
			comment = dao.addReplyToTopic(comment);
			redir.addFlashAttribute("parentObject",
					dao.getTopicById(((Topic) session.getAttribute("replyingTo")).getId()));
			redir.addFlashAttribute("commentList",
					dao.getTopicById(((Topic) session.getAttribute("replyingTo")).getId()).getThreadComments());

//			mv.addObject("commentList", ((Topic) session.getAttribute("replyingTo")).getThreadComments());
//			mv.addObject("parentObject", (Topic) session.getAttribute("replyingTo"));

		} else if (session.getAttribute("replyingTo").getClass().getSimpleName().toLowerCase().equals("blog")) {
			mv.setViewName(String.format("redirect:viewComments.do?type=%s&id=%s",
					session.getAttribute("replyingTo").getClass().getSimpleName().toLowerCase(),
					((Blog) session.getAttribute("replyingTo")).getId()));
			BlogComment comment = new BlogComment();
			comment.setUser(dao.getUser(((User) session.getAttribute("loggedIn")).getId()));
			comment.setBody(body);
			comment.setEdited(0);
			comment.setBlog(dao.getBlogById(((Blog) session.getAttribute("replyingTo")).getId()));
			comment = dao.addReplyToBlog(comment);
			redir.addFlashAttribute("parentObject",
					dao.getBlogById(((Blog) session.getAttribute("replyingTo")).getId()));
			redir.addFlashAttribute("commentList",
					dao.getBlogById(((Blog) session.getAttribute("replyingTo")).getId()).getBlogComments());

//			mv.addObject("commentList", ((Blog) session.getAttribute("replyingTo")).getBlogComments());
//			mv.addObject("parentObject", (Blog) session.getAttribute("replyingTo"));

		}

//		session.setAttribute("replyingTo", null);
//		if (type.toLowerCase().equals("blog")) {
//			parentObject = dao.getBlogById(id);
//			mv.addObject("commentList", ((Blog) parentObject).getBlogComments());
//			mv.addObject("parentObject", (Blog) parentObject);}

		return mv;

	}

	@RequestMapping(path = "reply.do")
	public String startReply(String parent, int id, HttpSession session) {
		if (session.getAttribute("loggedIn") == null) {
			return "index";
		}
		if (parent.toLowerCase().equals("album")) {
			session.setAttribute("replyingTo", dao.getAlbumById(id));
		} else if (parent.toLowerCase().equals("blog")) {
			session.setAttribute("replyingTo", dao.getBlogById(id));

		} else if (parent.toLowerCase().equals("topic")) {
			session.setAttribute("replyingTo", dao.getTopicById(id));
		}

		return "Reply";
	}

	@RequestMapping(path = "showBlog.do")
	public ModelAndView showBlog(int id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("showBlog");
		mv.addObject("blog", dao.getBlogById(id));

		return mv;
	}
	
	@RequestMapping(path = "showTopic.do")
	public ModelAndView showTopic(int id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("showTopic");
		mv.addObject("topic", dao.getTopicById(id));
		return mv;
	}

	@RequestMapping(path = "newPost.do")
	public ModelAndView addPost(String postType, String body, String[] genre, String postTitle, String headerMediaUrl,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("loggedIn");

		if (postType.equals("blog")) {
			Blog newBlog = new Blog();

			List<Genre> genreList = new ArrayList<>();
			for (String gId : genre) {
				genreList.add(dao.getGenreById(Integer.parseInt(gId)));
			}

			newBlog.setBody(body);
			newBlog.setTitle(postTitle);
			newBlog.setHeaderMediaUrl(headerMediaUrl);
			newBlog.setUser(dao.getUser(user.getId()));
			newBlog.setGenres(genreList);
			mv.addObject("blog", dao.addBlog(newBlog));
			mv.setViewName("showBlog");
		}
		if (postType.equals("topic")) {
			TopicComment topicPost = new TopicComment();
			Topic topic = dao.getTopicByTitle(postTitle);
			if (topic == null) {
				topic = dao.createTopic(user, postTitle);
			}
			topicPost.setThread(topic);
			topicPost.setBody(body);
			topicPost.setUser(dao.getUser(user.getId()));
			dao.addTopicComment(topicPost);
			mv.addObject("topic", topic);
			mv.setViewName("showTopic");
		}
		
		return mv;
	}

	@RequestMapping(path = "delete.do")
	public ModelAndView deleteTopic(String parent, int id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		String succ = "deletion successful";
		String fail = "deletion failed";
		if (parent.equals("topic")) {
			Topic toDelete = dao.getTopicById(id);
			mv.addObject("warningMessage", dao.deleteDiscussionTopic(toDelete) ? succ : fail);
		} else if (parent.equals("album")) {
			Album toDelete = dao.getAlbumById(id);
			mv.addObject("warningMessage", dao.deleteAlbum(toDelete) ? succ : fail);
		} else if (parent.equals("blog")) {
			Blog toDelete = dao.getBlogById(id);
			mv.addObject("warningMessage", dao.deleteBlog(toDelete) ? succ : fail);
		}
		return mv;

	}

}
