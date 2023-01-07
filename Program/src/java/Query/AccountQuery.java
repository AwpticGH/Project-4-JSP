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
    public String login = "SELECT * FROM users WHERE email = ? AND password = ?";
    public String register = "INSERT INTO users (email, password, name, gender, title, date_of_birth, phone_number) VALUES"
            + "(?, ?, ?, ?, ?, ?, ?)";
    public String getById = "SELECT * FROM users WHERE id = ?";
    public String update = "UPDATE users SET email = ?, password = ?, name = ?, date_of_birth = ?, gender = ?, title = ?, phone_number = ? WHERE id = ?";
}
