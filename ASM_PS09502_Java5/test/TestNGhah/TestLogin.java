package TestNGhah;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.simple.parser.ParseException;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import static org.testng.Assert.assertEquals;
import org.testng.Assert;
import org.testng.ITestResult;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author long
 */
public class TestLogin {

    String driverPath = "C:\\chromedriver\\chromedriver.exe";
    WebDriver driver;
    int testCount = 1;
    String excelSheet = "Tc_Login";

    @BeforeMethod
    public void setUp() throws InterruptedException {

        //Mo browser
        System.setProperty("webdriver.chrome.driver", driverPath);
        driver = new ChromeDriver();

        driver.get("http://localhost:8084/ASM_QuanLyNhanVienOld/user/login.html");

        //Tao mot mang 2x2 chua account
        //Account dung
        
    }

    @DataProvider(name = "Authentication")
    public Object[][] credentials() throws IOException, FileNotFoundException, ParseException {
        Data data = new Data();
        Object[][] a = data.getData(Data.file, excelSheet, 3);
        // The number of times data is repeated, test will be executed the same no. of times
        // Here it will execute two times
        return a;
    }

    @Test(dataProvider = "Authentication")
    public void testLogin(String user, String pass) {
        System.out.println("day la test");
        driver.findElement(By.name("username")).sendKeys(user);
        System.out.println(user);
        //truyen password den textbox
        driver.findElement(By.name("password")).sendKeys(pass);
        System.out.println(pass);
        
        //Click button login
        driver.findElement(By.xpath("//*[@id=\"user\"]/fieldset/div[5]/input")).click();
        String expectedUrl = "http://localhost:8084/ASM_QuanLyNhanVienOld/user/edit.html?nameofuser=" + user;
        String actualUrl = driver.getCurrentUrl(); //lay dia chi url sau khi login
        //So sanh
        boolean kq = expectedUrl.equals(actualUrl);      
        assertEquals(actualUrl, expectedUrl);

        try {
            Thread.sleep(4000);
        } catch (InterruptedException ex) {
            Logger.getLogger(TestLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @AfterMethod
    public void afterMethod(ITestResult result) throws IOException {
        boolean resultName;
        
        if(result.getStatus() == ITestResult.SUCCESS)
        {
            resultName = true;
        }
        else if(result.getStatus() == ITestResult.FAILURE)
        {
            resultName = false;
        }
        else
        {
            resultName = false;
        }
        
        
        Data data = new Data();
        data.writeResult(Data.file, excelSheet, testCount, 4, resultName);
        
        driver.close();
        
        testCount++;
    }

}
