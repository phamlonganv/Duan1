/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.userDao;
import entity.Users;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author admin
 */
@Transactional
@Controller
@RequestMapping("/user")
public class userController {

    //Show trang index
    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String index(ModelMap model) {

        model.addAttribute("title", "User Management");
        model.addAttribute("listUser", userDao.getAllUsers());

        return "user/index";
    }

    //Show trang login
    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login(ModelMap model, HttpSession session) {
        if (session.getAttribute("loggedUser") != null) {
            return "redirect:index.html";
        }
        model.addAttribute("user", new Users());
        return "user/login";
    }

    //Xu ly login
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(ModelMap model, HttpSession session, @ModelAttribute("user") Users user, BindingResult errors) throws IllegalAccessException {
        Users u = userDao.getUserByUsername(user.getUsername());
        if (u == null) {
            errors.rejectValue("username", "element.login.error");
            return "user/login";
        } else {
            if (!user.getPassword().equals(u.getPassword())) {
                errors.rejectValue("username", "element.login.error");
                return "user/login";
            }
        }

        session.setAttribute("loggedUser", u);
        return "redirect:/user/edit.html?nameofuser=" + user.getUsername();
    }

    //Show trang edit
    @RequestMapping(value = {"/edit"}, method = RequestMethod.GET)
    public String edit(ModelMap model, @RequestParam(value = "nameofuser", required = false) String nameofuser) {
        
        if(nameofuser==null)
        {
            return "redirect:/user/index.html";
        }
        
        Users user = userDao.getUserByUsername(nameofuser);

        if (user == null) {
            //Kiem tra neu user khong ton tai thi quay ve trang index
            return "redirect:index.html";
        }

        model.addAttribute("title", "Edit user");
        model.addAttribute("nameofuser", nameofuser);
        model.addAttribute("user", user);
        return "user/edit";
    }

    //Xu ly trang edit
    @RequestMapping(value = {"/edit"}, method = RequestMethod.POST)
    public String edit(ModelMap model, @ModelAttribute("user") Users user, BindingResult errors) {
        if (user.getImage().equals("")) {
            //Anh mac dinh
            user.setImage("noavatar.jpg");
        }
        
        if(user.getPassword() == "")
        {
            user.setPassword(userDao.getUserByUsername(user.getUsername()).getPassword());
        }
        
        userDao.Update(user);
        return "redirect:index.html";
    }

    //Show trang insert
    @RequestMapping(value = {"/insert"}, method = RequestMethod.GET)
    public String insert(ModelMap model) {

        model.addAttribute("title", "Add new User");
        model.addAttribute("user", new Users());

        return "user/insert";
    }

    //Xu ly trang insert
    @RequestMapping(value = {"/insert"}, method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("user") Users user) throws IllegalAccessException {
        if (user.getImage().equals("")) {
            user.setImage("noavatar.jpg");
        }

        userDao.Insert(user);
        return "redirect:index.html";
    }

    //Xu ly trang delete
    @RequestMapping(value = {"/delete"}, method = RequestMethod.GET)
    public String delete(@RequestParam(value = "nameofuser", required = false) String nameofuser) {
        
        if(nameofuser==null)
        {
            return "redirect:/user/index.html";
        }
        
        Users u = userDao.getUserByUsername(nameofuser);

        if (u == null) {
            //Kiem tra neu user khong ton tai thi quay ve trang index
            return "redirect:index.html";
        }

        userDao.Delete(u);
        return "redirect:index.html";
    }

    //Xu ly trang logout
    @RequestMapping(value = {"/logout"}, method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:index.html";
    }
}
