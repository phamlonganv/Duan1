/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TestNGhah;

import dao.recordDao;
import dao.staffDao;
import dao.userDao;
import entity.Record;
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
public class TestRecordInsert {
    
    
    Record rd;
    int testCount = 1;

    @BeforeMethod
    public void setUp() {
        rd = new Record();

    }

    @Test(dataProvider = "dp")
    public void testInsert(int id,int idStaff,boolean type,int date,String note) throws IllegalAccessException {
         Staff staff = staffDao.getStaffById(String.valueOf(idStaff));
         Date date1 = new Date(new Data().excelDate(date));
        
        rd = new Record(id, staff, type, date1, note);
        boolean ins = recordDao.Insert(rd);
        Assert.assertTrue(ins, "User Test");

    }

    @DataProvider(name = "dp")
    public Object[][] dataTest() throws IOException {
        Data data = new Data();
        Object[][] a = data.getData(Data.file, "Tc_Rc_In", 6);
        
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
        data.writeResult(Data.file, "Tc_Rc_In", testCount, 7, resultName);

        testCount++;
    }

}
