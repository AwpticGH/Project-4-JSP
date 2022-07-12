/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Helper;

/**
 *
 * @author rafih
 */
public class StringHelper {
    
    public static String castCity(String text) {
        String[] city = text.split(",");
        return city[0];
    }
    
    public static String getPassCount(String text) {
        String[] passenger = text.split(" ");
        return passenger[0];
    }
    
    public static String getSeatClass(String text) {
        String[] seatClass = text.split(" ");
        if (seatClass.length == 3) {
            return seatClass[2];
        }
        else {
            return seatClass[2] + " " + seatClass[3];
        }
    }
}
