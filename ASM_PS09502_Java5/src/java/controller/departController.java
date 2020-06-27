/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.departDao;
import entity.Depart;
import javax.transaction.Transactional;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
@RequestMapping("/depart")
public class departController {
    
    //Show trang index
    @RequestMapping(value = { "/", "/index"}, method = RequestMethod.GET)
    public String index(ModelMap model) {

        model.addAttribute("title", "Depart Management");
        model.addAttribute("listDepart", departDao.getAllDepart());

        return "depart/index";
    }
    
    //Show trang edit
    @RequestMapping(value = {"/edit"}, method = RequestMethod.GET)
    public String edit(ModelMap model, @RequestParam(value = "idofdepart", required = false) String idofdepart) {
        
        if(idofdepart==null)
        {
            return "redirect:/user/index.html";
        }
        
        Depart depart = departDao.getDepartById(idofdepart);
        
        if (depart == null) {
            //Kiem tra neu depart khong ton tai thi quay ve trang index
            return "redirect:index.html";
        }
        
        //Set trạng thái cho radio button
        if(depart.getStatus())
            model.addAttribute("isCheckedA", "checked");
        else
            model.addAttribute("isCheckedB", "checked");

        
        model.addAttribute("title", "Edit department");
        model.addAttribute("idofdepart", idofdepart);
        model.addAttribute("depart", depart);
        return "depart/edit";
    }
    
    //Xu ly trang edit
    @RequestMapping(value = {"/edit"}, method = RequestMethod.POST)
    public String edit(ModelMap model, @ModelAttribute("depart") Depart depart) {
        if(depart.getPhoto().equals("")) depart.setPhoto("noavatar.jpg");
        
        departDao.Update(depart);
        return "redirect:index.html";
    }
    
    //Show trang insert
    @RequestMapping(value = {"/insert"}, method = RequestMethod.GET)
    public String insert(ModelMap model) {

        model.addAttribute("title", "Add new Department");
        model.addAttribute("depart", new Depart());

        return "depart/insert";
    }
    
    //Xu ly trang insert
    @RequestMapping(value = {"/insert"}, method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("depart") Depart depart) {
        if(depart.getPhoto().equals("")) depart.setPhoto("noavatar.jpg");
        
        departDao.Insert(depart);
        return "redirect:index.html";
    }
    
    //Xu ly trang delete
    @RequestMapping(value = {"/delete"}, method = RequestMethod.GET)
    public String delete(@RequestParam(value = "idofdepart", required = false) String idofdepart) {
        
        if(idofdepart==null)
        {
            return "redirect:/user/index.html";
        }
        
        Depart d = departDao.getDepartById(idofdepart);
        
        if (d == null) {
            //Kiem tra neu depart khong ton tai thi quay ve trang index
            return "redirect:index.html";
        }
        
        departDao.Delete(d);
        return "redirect:index.html";
    }

}
