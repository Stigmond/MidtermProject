package com.skilldistillery.crescendo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.crescendo.data.TestDAO;

@Controller
public class TestController {

	@Autowired
	private TestDAO dao;
	
	@RequestMapping(path="test.do")
	public String home(Model model) {
		model.addAttribute("user", dao.getTestUser());
		return "test";
	}
	
}
