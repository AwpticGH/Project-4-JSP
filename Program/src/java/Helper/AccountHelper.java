/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Helper;

/**
 *
 * @author rafih
 */
public class AccountHelper {
    
    public static String parseDateToSqlDate(String date) {
        String[] splitted = date.split("/");
        
        System.out.println(splitted[0] + splitted[1] + splitted[2]);
        
//        System.out.println(splitted[0]);
//        System.out.println(splitted[1]);
//        System.out.println(splitted[2]);
        
        date = splitted[2] + "-" + splitted[1] + "-" + splitted[0];
        return date;
    }
    
    public void checkPhoneNumber(String phoneNumber) {
        int min = 9;
        int max = 13;
        
        
    }
}
