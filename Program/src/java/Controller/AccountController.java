/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.AccountModel;
import Query.AccountQuery;
import java.sql.ResultSet;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author rafih
 */
public class AccountController extends BaseController {
    
    AccountQuery query = new AccountQuery();
    
    public ResultSet getAccount(String email, String password) {
        String sql = this.query.getAccount;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, email);
        map.put(2, password);
        
        return super.get(map, sql);
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
