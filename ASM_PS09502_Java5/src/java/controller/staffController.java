/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.departDao;
import dao.staffDao;
import entity.Depart;
import entity.Staff;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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
@RequestMapping("/staff")
public class staffController {

    //Show trang index
    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String index(ModelMap model) {

        model.addAttribute("title", "Staff Management");
        model.addAttribute("listStaff", staffDao.getAllStaff());

        return "staff/index";
    }

    //Show trang edit
    @RequestMapping(value = {"/edit"}, method = RequestMethod.GET)
    public String edit(ModelMap model, @RequestParam(value = "idofstaff", required = false) String idofstaff) {
        
        if(idofstaff==null)
        {
            return "redirect:/staff/index.html";

        }
        
        Staff staff = staffDao.getStaffById(idofstaff);
        List<Depart> lstDepart = departDao.getAllDepart();

        if (staff == null) {
            //Kiem tra neu staff khong ton tai thi quay ve trang index
            return "redirect:index.html";
        }

        //Set trạng thái cho radio button
        if (staff.getGender()) {
            model.addAttribute("isCheckedA", "checked");
        } else {
            model.addAttribute("isCheckedB", "checked");
        }
        if (staff.getDeleted()==false) {
            model.addAttribute("isCheckedC", "checked");
        } else {
            model.addAttribute("isCheckedD", "checked");
        }

        model.addAttribute("departidOfStaff", staff.getDepart().getDepartid());
        model.addAttribute("lstDepart", lstDepart);
        model.addAttribute("title", "Edit staff");
        model.addAttribute("idofstaff", idofstaff);
        model.addAttribute("staff", staff);
        return "staff/edit";
    }

    //Xu ly trang edit
    @RequestMapping(value = {"/edit"}, method = RequestMethod.POST)
    public String edit(ModelMap model, @ModelAttribute("staff") Staff staff, 
            @RequestParam(value = "departid", required = false) String departid) {
        
        if(departid==null)
        {
            return "redirect:/staff/index.html";
        }
        
        if (staff.getPhoto().equals("")) {
            staff.setPhoto("noavatar.jpg");
        }
        
        Depart d = departDao.getDepartById(departid);
        
        staff.setDepart(d);
        staffDao.Update(staff);
        return "redirect:index.html";
    }

    //Show trang insert
    @RequestMapping(value = {"/insert"}, method = RequestMethod.GET)
    public String insert(ModelMap model) {
        List<Depart> lstDepart = departDao.getAllDepart();

        model.addAttribute("lstDepart", lstDepart);
        model.addAttribute("title", "Add new Staff");
        model.addAttribute("staff", new Staff());

        return "staff/insert";
    }

    //Xu ly trang insert
    @RequestMapping(value = {"/insert"}, method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("staff") Staff staff, 
            @RequestParam(value = "departid", required = false) String departid) {
        
        if(departid==null)
        {
            return "redirect:/staff/index.html";
        }
        
        if (staff.getPhoto().equals("")) {
            staff.setPhoto("noavatar.jpg");
        }
        
        Depart d = departDao.getDepartById(departid);
        
        staff.setDepart(d);
        staff.setDeleted(false);
        staffDao.Insert(staff);
        return "redirect:index.html";
    }

    //Xu ly trang delete
    @RequestMapping(value = {"/delete"}, method = RequestMethod.GET)
    public String delete(@RequestParam(value = "staff", required = false) String idofstaff) {
        
        if(idofstaff==null)
        {
            return "redirect:/staff/index.html";
        }
        
        Staff s = staffDao.getStaffById(idofstaff);

        if (s == null) {
            //Kiem tra neu staff khong ton tai thi quay ve trang index
            return "redirect:index.html";
        }

        staffDao.Delete(s);
        return "redirect:index.html";
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }
}
