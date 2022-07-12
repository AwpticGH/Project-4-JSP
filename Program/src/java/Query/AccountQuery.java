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
    public String getById = "SELECT * FROM users WHERE ID = ?";
    public String update = "UPDATE users SET Email = ?, Password = ?, Name = ?, DateOfBirth = ?, Gender = ?, Title = ?, PhoneNumber = ? WHERE ID = ?";
}
