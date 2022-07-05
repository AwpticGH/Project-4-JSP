/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Query;

/**
 *
 * @author rafih
 */
public class AccountQuery {
    public String getAccount = "SELECT * FROM user WHERE email = ? AND password = ?";
    public String register = "INSERT INTO 'user' (Email, Password, Name, Gender, Title, DateOfBirth, PhoneNumber) VALUES"
            + "(?, ?, ?, ?, ?, ?, ?)";
}
