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
    public String login = "SELECT * FROM users WHERE Email = ? AND Password = ?";
    public String register = "INSERT INTO users (Email, Password, Name, Gender, Title, DateOfBirth, PhoneNumber) VALUES"
            + "(?, ?, ?, ?, ?, ?, ?)";
}
