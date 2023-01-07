/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.AccountModel;
import Query.AccountQuery;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rafih
 */
public class AccountController extends BaseController {
    
    AccountQuery query = new AccountQuery();
    
    public ResultSet login(AccountModel model) {
        String sql = this.query.login;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getEmail());
        map.put(2, model.getPassword());
        
        return super.get(map, sql);
    }
    
    public void setAccount(HttpSession session, AccountModel model) {
        session.setAttribute("accountId", model.getId());
        session.setAttribute("username", model.getUsername());
        session.setAttribute("email", model.getEmail());
        session.setAttribute("password", model.getPassword());
        session.setAttribute("name", model.getName());
        session.setAttribute("gender", model.getGender());
        session.setAttribute("title", model.getTitle());
        session.setAttribute("dob", model.getDob());
        session.setAttribute("phoneNumber", model.getPhoneNumber());
        session.setAttribute("status", true);
    }
    
    public ResultSet getAccount(String ID) {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, ID);
        
        String sql = this.query.getById;
        
        return super.get(sql);
    }
    
    public boolean updateAccount(AccountModel model) {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getEmail());
        map.put(2, model.getPassword());
        map.put(3, model.getName());
        map.put(4, model.getDob());
        map.put(5, model.getGender());
        map.put(6, model.getTitle());
        map.put(7, model.getPhoneNumber());
        map.put(8, model.getId());
        
        String sql = this.query.update;
        
        return super.preparedStatement(map, sql);
    }
    
    public boolean register(AccountModel model) throws ParseException {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getEmail());
        map.put(2, model.getPassword());
        map.put(3, model.getName());
        map.put(4, model.getGender());
        map.put(5, model.getTitle());
        map.put(6, model.getDob());
        map.put(7, model.getPhoneNumber());
        
        String sql = this.query.register;
        
        return super.preparedStatement(map, sql);
    }
    
    
}
