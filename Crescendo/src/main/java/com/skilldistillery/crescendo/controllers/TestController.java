package com.skilldistillery.crescendo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@RequestMapping(path="test.do")
	public String home() {
		return "test";
	}
	
}
