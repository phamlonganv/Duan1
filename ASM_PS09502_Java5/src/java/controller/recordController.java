/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.recordDao;
import dao.staffDao;
import entity.Record;
import entity.Staff;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.mail.MessagingException;
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
import util.MailSend;

/**
 *
 * @author admin
 */
@Transactional
@Controller
@RequestMapping("/record")
public class recordController {

    //Show trang index
    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String index(ModelMap model, @RequestParam(value = "idofstaff", required = false) String idofstaff) {
        if(idofstaff==null)
        {
            return "redirect:/staff/index.html";

        }
        
        Staff staff = staffDao.getStaffById(idofstaff);
        if(staff == null)
        {
            return "redirect:/staff/index.html";
        }

        model.addAttribute("title", "Records of staff #" + staff.getStaffid());
        model.addAttribute("listRecord", recordDao.getRecordByStaffId(idofstaff));
        model.addAttribute("staff", staff);

        return "record/index";
    }

    //Show trang insert
    @RequestMapping(value = {"/insert"}, method = RequestMethod.GET)
    public String insert(ModelMap model, @RequestParam(value = "idofstaff", required = false) String idofstaff) {
        
        if(idofstaff==null)
        {
            return "redirect:/staff/index.html";

        }
        
        model.addAttribute("title", "Add new record for staff #" + idofstaff);
        model.addAttribute("idofstaff", idofstaff);
        model.addAttribute("record", new Record());

        return "record/insert";
    }

    //Xu ly trang insert
    @RequestMapping(value = {"/insert"}, method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("record") Record record,
            @RequestParam(value = "idofstaff", required = false) String idofstaff) throws MessagingException {
        
        if(idofstaff==null)
        {
            return "redirect:/staff/index.html";

        }
        
        Date date = new Date();  

        Staff s = staffDao.getStaffById(idofstaff);

        record.setStaff(s);
        record.setDate(date);
        recordDao.Insert(record);
        
        //Send email to staff
        try
        {
            MailSend sendmail = new MailSend();
            sendmail.sendEmail(s, record);
        }
        catch(Exception ex)
                {ex.printStackTrace();}
        
        return "redirect:index.html?idofstaff=" + idofstaff;
    }
    
    //Xu ly trang delete
    @RequestMapping(value = {"/delete"}, method = RequestMethod.GET)
    public String delete(@RequestParam(value = "idofstaff", required = false) String idofstaff, 
            @RequestParam(value = "recordid", required = false) String recordid) {
        
        if(idofstaff==null || recordid==null)
        {
            return "redirect:/staff/index.html";

        }
        
        Staff s = staffDao.getStaffById(idofstaff);
        Record r = recordDao.getRecordById(recordid);

        if (s == null|| r == null || r.getStaff().getStaffid() != s.getStaffid()) {
            //Kiem tra neu khong ton tai thi quay ve trang index
            return "redirect:index.html?idofstaff=" + idofstaff;
        }

        recordDao.Delete(r);
        return "redirect:index.html?idofstaff=" + idofstaff;
    }
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }
}
