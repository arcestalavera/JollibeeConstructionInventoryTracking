/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Models;

import java.io.Serializable;

/**
 *
 * @author Arces
 */
public class Item implements Serializable{
    private String name, unit, description;
    private Integer itemID, count;

    /**
     * @return the itemID
     */
    public int getItemID() {
        return itemID;
    }

    /**
     * @param itemID the itemID to set
     */
    public void setItemID(int itemID) {
        this.itemID = itemID;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the unit
     */
    public String getUnit() {
        return unit;
    }

    /**
     * @param unit the unit to set
     */
    public void setUnit(String unit) {
        this.unit = unit;
    }

    /**
     * @return the count
     */
    public int getCount() {
        return count;
    }

    /**
     * @param count the count to set
     */
    public void setCount(int count) {
        this.count = count;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }
}
