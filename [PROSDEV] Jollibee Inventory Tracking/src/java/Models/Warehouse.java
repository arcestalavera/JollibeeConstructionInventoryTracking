/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Models;

/**
 *
 * @author Arces
 */
public class Warehouse {
    private int warehouseID;
    private String location;

    /**
     * @return the warehouseID
     */
    public int getWarehouseID() {
        return warehouseID;
    }

    /**
     * @param warehouseID the warehouseID to set
     */
    public void setWarehouseID(int warehouseID) {
        this.warehouseID = warehouseID;
    }

    /**
     * @return the location
     */
    public String getLocation() {
        return location;
    }

    /**
     * @param location the location to set
     */
    public void setLocation(String location) {
        this.location = location;
    }
    
    
}
