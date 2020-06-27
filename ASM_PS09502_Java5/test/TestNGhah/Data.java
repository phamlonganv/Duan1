/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TestNGhah;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author long
 */
public class Data {
    static File file = new File("C:\\Users\\long\\Desktop\\TestCase_Va_DataTest.xlsx");
    XSSFWorkbook xf; // xssf sử dụng cho file .xlxs nếu là .xls thì sử dụng HFFS
    XSSFSheet sheet; //  cac sheet
    XSSFCell cell;

    //  cac shell
    //tao ham lay du lieu
    public Object[][] getData(File file, String sheetName, int maxColumn ) throws IOException {
        Object data[][] = null;

        // tao ra input tu file
        FileInputStream ExcelFile = new FileInputStream(file);
        // tao 1 workbook moi
        xf = new XSSFWorkbook(ExcelFile);
        // lay ten sheet
        sheet = xf.getSheet(sheetName);
        // lay column
        //mang 
        data = new Object[sheet.getLastRowNum()][maxColumn - 1];
        for (int i = 1; i < sheet.getLastRowNum() + 1; i++) { // lap theo hang

            for (int j = 1; j < maxColumn; j++) { // lap theo cot

                cell = sheet.getRow(i).getCell(j); // lay du lieu
                int dataType = cell.getCellType(); // lay kieu du lieu

                if (dataType == 1) {
                    cell.setCellType(Cell.CELL_TYPE_STRING);
                    data[i - 1][j - 1] = cell.getStringCellValue();

                }
                if (dataType == 0) {
                    cell.setCellType(Cell.CELL_TYPE_NUMERIC);
                    data[i - 1][j - 1] = (int) cell.getNumericCellValue();
                }
                if (dataType == 4) {
                    cell.setCellType(Cell.CELL_TYPE_BOOLEAN);

                    data[i - 1][j - 1] = cell.getBooleanCellValue();

                }
                if (dataType == 3) {
                    cell.setCellType(Cell.CELL_TYPE_BLANK);

                    data[i - 1][j - 1] = "";
                }

            }

        }

        return data;
    }
    
    public void writeResult(File file, String sheetName, int row, int column, boolean result) throws FileNotFoundException, IOException
    {
         // tao ra input tu file
        FileInputStream ExcelFile = new FileInputStream(file);
        // tao 1 workbook moi
        xf = new XSSFWorkbook(ExcelFile);
        // lay ten sheet
        sheet = xf.getSheet(sheetName);
        
        Row rowResult = sheet.getRow(row);
        Cell cell = rowResult.createCell(column);
        cell.setCellValue(result);
        
        try { 
            // this Writes the workbook gfgcontribute 
            FileOutputStream out = new FileOutputStream(file); 
            xf.write(out); 
            out.close(); 
        } 
        catch (Exception e) { 
            e.printStackTrace(); 
        } 
    }
    public String excelDate(int days) {
        String result = "";

        Calendar c = Calendar.getInstance();
        c.set(Calendar.YEAR, 1900);
        c.set(Calendar.MONTH, Calendar.JANUARY);
        c.set(Calendar.DATE, 1);
        c.set(Calendar.HOUR, 0);
        c.set(Calendar.MINUTE, 0);
        c.set(Calendar.SECOND, 0);
        c.set(Calendar.MILLISECOND, 0);
        c.add(Calendar.DATE, 36660);
        Date date = c.getTime();
        SimpleDateFormat dp = new SimpleDateFormat("yyyy/MM/dd");
        result = dp.format(date);
        return result;
    }

}
