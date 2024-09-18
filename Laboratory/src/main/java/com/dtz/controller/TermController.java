package com.dtz.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.dtz.mapper.TermMapper;
import com.dtz.pojo.Term;
import com.dtz.pojo.User;
import com.dtz.service.TermService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/term")
public class TermController {
    @Autowired
    private TermService termService;
    @RequestMapping("/termlist")
    public String termList(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null && user.getRole().equals("superadmin")) {
            List<Term> termList = termService.list();
            model.addAttribute("term", termList);
            return "termlist";
        } else {
            // 如果不是管理员角色，重定向到其他页面，或者返回一个错误页面
            return "redirect:error";
        }
    }
    @RequestMapping("/deleteterm/{Id}")
    public String deleteTerm(@PathVariable Integer Id) {
        LambdaQueryWrapper<Term> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Term::getId, Id); // 指定删除条件
        termService.remove(wrapper); // 使用服务方法删除
        return "redirect:/user/superadmin";
    }
    @GetMapping("/edit")
    public String editterm(@RequestParam("Id") Integer Id, Model model) {
        Term term = termService.getById(Id); // 根据用户ID获取文章
        model.addAttribute("term", term);
        return "updateterm"; // 返回编辑页面
    }

    @PostMapping("/save")
    public String saveterm(@ModelAttribute Term term) {
        termService.updateById(term); // 更新文章内容
        return "redirect:/user/superadmin";
    }
}
