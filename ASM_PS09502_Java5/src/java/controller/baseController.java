/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.*;
import entity.Staff;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.transaction.Transactional;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author admin
 */
@Transactional
@Controller
public class baseController {

    private String[] lstColor = {"green", "red", "blue", "yellow"};

    @RequestMapping(value = {"/index"})
    public String index(ModelMap model) {
        List<Object[]> lstReport = null;
        List<Object[]> lstTopStaff = new ArrayList<Object[]>();
        List<Object[]> lstBadStaff = new ArrayList<Object[]>();

        lstReport = staffDao.getStaffReport("Thuong");
        int indexColor = 0;
        for (int i = 0; i < lstReport.size(); i++) {
            Staff s = staffDao.getStaffById(lstReport.get(i)[0].toString());
            s.setDepart(departDao.getDepartById(s.getDepart().getDepartid()));
            lstTopStaff.add(new Object[]{s.getName(), lstReport.get(i)[1].toString(),
                s.getPhoto(), lstColor[indexColor], departDao.getDepartById(s.getDepart().getDepartid()).getName(),
                s.getStaffid()});
            if (indexColor == 3) {
                indexColor = 0;
            } else {
                indexColor++;
            }
        }
        
        lstReport = staffDao.getStaffReport("Phat");
        for (int i = 0; i < lstReport.size(); i++) {
            Staff s = staffDao.getStaffById(lstReport.get(i)[0].toString());
            lstBadStaff.add(new Object[]{s.getName(), lstReport.get(i)[1].toString(),
                s.getPhoto(), lstColor[indexColor], departDao.getDepartById(s.getDepart().getDepartid()).getName(),
            s.getStaffid()});
            if (indexColor == 3) {
                indexColor = 0;
            } else {
                indexColor++;
            }
        }

        model.addAttribute("title", "DashBoard");
        model.addAttribute("lstTopStaff", lstTopStaff);
        model.addAttribute("lstBadStaff", lstBadStaff);
        model.addAttribute("totalUser", userDao.getAllUsers().size());
        model.addAttribute("totalDepart", departDao.getAllDepart().size());
        model.addAttribute("totalStaff", staffDao.getAllStaff().size());

        return "index";
    }
}
