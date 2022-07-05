/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Config.DBConnection;
import com.sun.rowset.CachedRowSetImpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;

/**
 *
 * @author rafih
 */
public class BaseController {
    DBConnection conn = new DBConnection();
    
    public ResultSet get(String sql) {
        try {
            Connection con = conn.open();
            
            Statement state = con.createStatement();
            ResultSet rs = state.executeQuery(sql);
            
            CachedRowSetImpl crs = new CachedRowSetImpl();
            crs.populate(rs);
            
            con.close();
            
            return rs;
        }
        catch(Exception e) {
            System.out.println(e);
            return null;
        }
    }
    
    public ResultSet get(Map<Integer, Object> map, String sql) {
        try {
            Connection con = conn.open();
            
            PreparedStatement pst = con.prepareStatement(sql);
            
            for (Map.Entry<Integer, Object> entry : map.entrySet()) {
                pst.setString(entry.getKey(), entry.getValue().toString());
            }
            
            ResultSet rs = pst.executeQuery();
            
            CachedRowSetImpl crs = new CachedRowSetImpl();
            crs.populate(rs);
            
            con.close();
            
            return rs;
        }
        catch(Exception e) {
            System.out.println(e);
            return null;
        }
    }
    
    public boolean preparedStatement(Map<Integer, Object> map, String sql) {
        try {
            Connection con = conn.open();
            
            PreparedStatement pst = con.prepareStatement(sql);
            
            for (Map.Entry<Integer, Object> entry : map.entrySet()) {
                pst.setString(entry.getKey(), entry.getValue().toString());
            }
            
            int rows = pst.executeUpdate();
            con.close();
            
            return rows != 0;
        }
        catch(SQLException e) {
            System.out.println(e);
            return false;
        }
    }
}