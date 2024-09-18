package com.dtz.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.dtz.pojo.User;
import com.dtz.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    @RequestMapping("/admin")
    public String admin(){
        return "admin";
    }
    @RequestMapping("/toregister")
    public String register(){
        return "register";
    }
    @RequestMapping("/superadmin")
    public String superadmin() {
        return "superadmin";
    }
    @RequestMapping("/laboratorylist")
    public String laboratory() {
        return "laboratorylist";
    }
    @RequestMapping("/authenticate")
    public String authenticate(@RequestParam("username") String username,
                               @RequestParam("password") String password,
                               HttpSession session,
                               RedirectAttributes redirectAttributes) {
        User user = userService.getByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            session.setAttribute("user", user);
            // 根据用户角色进行重定向
            if (user.getRole().equals("superadmin")) {
                return "redirect:superadmin";
            }  else {
                return "redirect:admin";
            }
        } else {
            redirectAttributes.addFlashAttribute("error", "用户名或密码错误");
            return "redirect:login"; // 返回到登录页面
        }
    }
    @PostMapping("/register")
    public String processRegistration(@RequestParam("username") String username,
                                      @RequestParam("password") String password,
                                      @RequestParam("role") String role,
                                      RedirectAttributes redirectAttributes) {
        User existingUser = userService.getByUsername(username);

        if(existingUser != null) {
            redirectAttributes.addFlashAttribute("error", "用户名已存在");
            return "redirect:/user/register";
        }

        User newUser = new User();
        newUser.setUserName(username);
        newUser.setPassword(password);
        newUser.setRole(role);

        userService.save(newUser);

        redirectAttributes.addFlashAttribute("success", "成功注册新用户");
        return "redirect:/user/login";
    }

       @RequestMapping("/r")
    public String r(){
        return "register";
    }
    
    @RequestMapping("/userlist")
    public String userList(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null && user.getRole().equals("superadmin")) {
            List<User> userList = userService.listAll();
            model.addAttribute("user", userList);
            return "userlist";
        } else {
            // 如果不是管理员角色，重定向到其他页面，或者返回一个错误页面
            return "redirect:error";
        }
    }

    @RequestMapping("/deleteuser/{Id}")
    public String deleteUser(@PathVariable Integer Id) {
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(User::getId, Id); // 指定删除条件
        userService.remove(wrapper); // 使用服务方法删除
        return "redirect:/user/superadmin";
    }
    @GetMapping("/edit")
    public String editUser(@RequestParam("Id") Integer Id, Model model) {
        User user = userService.getById(Id); // 根据用户ID获取文章
        model.addAttribute("user", user);
        return "update"; // 返回编辑页面
    }

    @PostMapping("/save")
    public String saveUser(@ModelAttribute User user) {
        userService.updateById(user); // 更新文章内容
        return "redirect:/user/superadmin";
    }
    @GetMapping("/insert")
    public String insertUser(Model model) {
        model.addAttribute("user", new User()); // 这里传递一个空的User对象到模板，用于绑定表单
        return "insertuser"; // 返回HTML模板文件名
    }
    @PostMapping("/saveinsert")
    public String saveUserinsert(@ModelAttribute("user") User user) {
        // 在此处保存用户到数据库
        userService.save(user);
        return "redirect:/user/superadmin"; // 重定向到用户列表页面
    }
}
