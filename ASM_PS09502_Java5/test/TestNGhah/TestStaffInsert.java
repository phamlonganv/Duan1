/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TestNGhah;

import dao.departDao;
import dao.staffDao;
import dao.userDao;
import entity.Depart;
import entity.Staff;
import entity.Users;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import org.testng.Assert;
import org.testng.ITestResult;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

/**
 *
 * @author long
 */
public class TestStaffInsert {
    Staff staff;
    int testCount = 1;

    @BeforeMethod
    public void setUp() {
        staff = new Staff();

    }

    @Test(dataProvider = "dp")
    public void testInsert(int idStaff, String depart,String name ,String mail, boolean Gt,int Date,int salary, String photo,String note ) throws IllegalAccessException {
        Depart dp = departDao.getDepartById(depart);
        Date date = new Date(new Data().excelDate(Date));
        staff = new Staff(idStaff, dp, name, Gt, date, mail, (double)salary, photo, note, null, null);
        Assert.assertTrue(staffDao.Insert(staff), "User Test");

    }

    @DataProvider(name = "dp")
    public Object[][] dataTest() throws IOException {
        Data data = new Data();
        Object[][] a = data.getData(Data.file, "Tc_Staff_In", 10);
        
        return a;

    }

    @AfterMethod
    public void afterMethod(ITestResult result) throws IOException {
        boolean resultName;

        if (result.getStatus() == ITestResult.SUCCESS) {
            resultName = true;
        } else if (result.getStatus() == ITestResult.FAILURE) {
            resultName = false;
        } else {
            resultName = false;
        }

        Data data = new Data();
        data.writeResult(Data.file, "Tc_Staff_In", testCount, 11, resultName);

        testCount++;
    }
}
