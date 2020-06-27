/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TestNGhah;

import dao.userDao;
import entity.Users;
import java.io.File;
import java.io.IOException;
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
public class TestUserDelete {
    Users us;
    int testCount = 1;

    @BeforeMethod
    public void setUp() {
        us = new Users();

    }

    @Test(dataProvider = "dp")
    public void testInsert(String username, String pass, String fullname, String image) throws IllegalAccessException {
        us = new Users(username, pass, fullname, image);        
        boolean ins = userDao.Delete(us);
        Assert.assertTrue(ins, "User Test");

    }

    @DataProvider(name = "dp")
    public Object[][] dataTest() throws IOException {
        Data data = new Data();
        Object[][] a = data.getData(Data.file, "Tc_User_De", 5);
        
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
        data.writeResult(Data.file, "Tc_User_De", testCount, 6, resultName);

        testCount++;
    }
}
