package com.dtz.controller;

import com.dtz.pojo.College;
import com.dtz.pojo.Term;
import com.dtz.pojo.User;
import com.dtz.service.CollegeService;
import com.dtz.service.TermService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/college")
public class CollegeController {
    @Autowired
    private CollegeService collegeService;
    @RequestMapping("/collegelist")
    public String ollegelist(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null && user.getRole().equals("superadmin")) {
            List<College> collegeList = collegeService.list();
            model.addAttribute("college", collegeList);
            return "collegelist";
        } else {
            // 如果不是管理员角色，重定向到其他页面，或者返回一个错误页面
            return "redirect:error";
        }
    }


}
