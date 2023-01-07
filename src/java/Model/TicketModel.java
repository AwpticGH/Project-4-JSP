/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author rafih
 */
public class TicketModel extends SearchModel {
    
    private String reservationId;
    private String[] name;
    private String[] age;
    private String[] gender;
    private String[] phoneNumber;
    
    public void instantiateName(int passCount) {
        name = new String[passCount];
    }
    
    public void instantiateAge(int passCount) {
        age = new String[passCount];
    }
    
    public void instantiateGender(int passCount) {
        gender = new String[passCount];
    }
    
    public void instantiatePhoneNumber(int passCount) {
        phoneNumber = new String[passCount];
    }
    
    public void setReservationId(String reservationId) {
        this.reservationId = reservationId;
    }
    
    public String getReservationId() {
        return reservationId;
    }
    
    public void setName(int i, String name) {
        this.name[i] = name;
    }
    
    public String getName(int i) {
        return name[i];
    }
    
    public void setAge(int i, String age) {
        this.age[i] = age;
    }
    
    public String getAge(int i) {
        return age[i];
    }
    
    public void setGender(int i, String gender) {
        this.gender[i] = gender;
    }
    
    public String getGender(int i) {
        return gender[i];
    }
    
    public void setPhoneNumber(int i, String phoneNumber) {
        this.phoneNumber[i] = phoneNumber;
    }
    
    public String getPhoneNumber(int i) {
        return phoneNumber[i];
    }
}
