/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Helper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author rafih
 */
public class DateHelper {
    
    public static Date parseDate(String date) throws ParseException {
        String[] text = date.split("-");
        String strNewDate = text[2] + "/" + text[1] + "/" + text[0];
        Date newDate = new SimpleDateFormat("dd/MM/yyyy").parse(strNewDate);
        return newDate;
    }

    public static String dateFormat(String date) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("dd MMMM");
        return sdf.format(parseDate(date));
    }
}
