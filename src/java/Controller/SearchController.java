/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import Helper.IntegerHelper;
import Helper.StringHelper;
import Model.SearchModel;
import Query.SearchQuery;

/**
 *
 * @author rafih
 */
public class SearchController extends BaseController {

    SearchQuery query = new SearchQuery();
    
    public boolean enoughSeats(int reservedSeats, int totalSeats, int passCount) {
        int availableSeats = IntegerHelper.countAvailableSeats(reservedSeats, totalSeats);
        boolean enoughSeats;
        if (availableSeats >= passCount) {
            enoughSeats = true;
        }
        else {
            enoughSeats = false;
        }

        return enoughSeats;
    }

    public ResultSet search(SearchModel model) {
        String sql = this.query.searchFlights;

        Map<Integer, Object> map = new HashMap<>();
        map.put(1, StringHelper.castCity(model.getFromCity()));
        map.put(2, StringHelper.castCity(model.getToCity()));
        map.put(3, model.getDepartDate());

        return super.get(map, sql);
    }
}
