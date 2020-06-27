/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TestNGhah;

import dao.departDao;
import entity.Depart;
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
public class TestDepartUpdate {
    Depart depart;
    int testCount = 1;

    @BeforeMethod
    public void setUp() {
        depart = new Depart();

    }

    @Test(dataProvider = "dp")
    public void testInsert(String idDepart, String nameDepart) throws IllegalAccessException {
        depart = new Depart(idDepart, nameDepart, true, "", null);
        boolean kt = departDao.Update(depart);
        Assert.assertTrue(kt, "User Test");

    }

    @DataProvider(name = "dp")
    public Object[][] dataTest() throws IOException {
        Data data = new Data();
        Object[][] a = data.getData(Data.file, "Tc_Depart_Up", 3);

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
        data.writeResult(Data.file, "Tc_Depart_Up", testCount, 4, resultName);

        testCount++;
    }
}
