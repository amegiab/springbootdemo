package com.isb.demos.springboot.rest;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class IndexController {


	@GetMapping("/contacts/admin")
	public String welcome(Map<String, Object> model) {		
		return "ContactsAdmin";
	}

}
