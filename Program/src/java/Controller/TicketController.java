/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.TicketModel;
import Query.TicketQuery;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author rafih
 */
public class TicketController extends BaseController {
    
    TicketQuery query = new TicketQuery();
    
    public ResultSet getTicket(String accountId) {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, accountId);
        
        String sql = this.query.getTicket;
        
        return super.get(map, sql);
    }
    
    public ResultSet getReservation(String flightId, String accountId) {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, flightId);
        map.put(2, accountId);
        
        String sql = this.query.getReservation;
        
        return super.get(map, sql);
    }
    
    public boolean cancelTicket(String flightId, String accountId) {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, flightId);
        map.put(2, accountId);
        
        String sql = this.query.cancel;
        
        return super.preparedStatement(map, sql);
    }
    
    public boolean deleteReservationInfo(String reservationId) {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, reservationId);
        
        String sql = this.query.delete;
        
        return super.preparedStatement(map, sql);
    }
    
    public boolean createReservation(String flightId, String accountId) {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, flightId);
        map.put(2, accountId);
        
        String sql = this.query.createReservation;
        
        return super.preparedStatement(map, sql);
    }
    
    public boolean createReservationInfo(int i, TicketModel model) {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getReservationId());
        map.put(2, model.getSeatClass());
        map.put(3, model.getName(i));
        map.put(4, model.getAge(i));
        map.put(5, model.getGender(i));
        map.put(6, model.getPhoneNumber(i));
        
        String sql = this.query.createReservationInfo;
        
        return super.preparedStatement(map, sql);
    }
}
