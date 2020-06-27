/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.util.regex.Pattern;

/**
 *
 * @author long
 */
public class RegexTest {
    public static boolean emailCheck(String mail)
    {
        String regex = "^[a-z][\\w.]+@[\\w]+(\\.[\\w]+)+[^\\.]$";
        
        return Pattern.matches(regex, mail);
    }
      public static boolean nameCheck(String name)
    {
        String regex = "[A-Z][a-z]*";
        
        return Pattern.matches(regex, name);
    }
     public static boolean numberCheck(String name)
     {
     
         String regex = "^[0-9]*$";
        
        return Pattern.matches(regex, name);
     }
     public static void main(String[] args) {
        boolean a = nameCheck("Phamlongan");
         System.out.println(a);
    }
    
}
