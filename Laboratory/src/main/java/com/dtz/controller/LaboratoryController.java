package com.dtz.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.dtz.pojo.Laboratory;
import com.dtz.pojo.User;
import com.dtz.service.LaboratoryService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/laboratory")
public class LaboratoryController {
    @Autowired
    private LaboratoryService laboratoryService;

    @RequestMapping("/laboratorylist")
    public String laboratoryList(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null && user.getRole().equals("superadmin")) {
            List<Laboratory> laboratorylist = laboratoryService.listAll();
            model.addAttribute("laboratory", laboratorylist);
            return "laboratorylist";
        } else {
            // 如果不是管理员角色，重定向到其他页面，或者返回一个错误页面
            return "redirect:error";
        }
    }
    @RequestMapping("/deletelaboratory/{Id}")
    public String deleteLaboratory(@PathVariable Integer Id) {
        LambdaQueryWrapper<Laboratory> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Laboratory::getId, Id); // 指定删除条件
        laboratoryService.remove(wrapper); // 使用服务方法删除
        return "redirect:/user/superadmin";
    }
    @GetMapping("/edit")
    public String editLaboratory(@RequestParam("Id") Integer Id, Model model) {
        Laboratory laboratory = laboratoryService.getById(Id); // 根据用户ID获取文章
        model.addAttribute("laboratory", laboratory);
        return "updatelabora"; // 返回编辑页面
    }

    @PostMapping("/save")
    public String saveLaboratory(@ModelAttribute Laboratory laboratory) {
        laboratoryService.updateById(laboratory);
        return "redirect:/user/superadmin";
    }


}
