package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.javaex.service.UserService;
import com.javaex.util.JsonResult;
import com.javaex.vo.UserVo;

@RestController
public class UserController {

    @Autowired
    private UserService userService;
    

    @GetMapping(value="/api/movie", produces = "application/json")
    public JsonResult userList() {
    	
    	System.out.println("UserController.userList()");
    	List<UserVo> userList = userService.exeMovieList();
        return JsonResult.success(userList);
    }
}



	
	


