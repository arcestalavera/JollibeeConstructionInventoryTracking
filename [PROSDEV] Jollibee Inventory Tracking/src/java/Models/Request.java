/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Models;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Arces
 */
public class Request implements Serializable{
    private int requestID;
    private Warehouse sourceWarehouse, destWarehouse;
    private String status, name;
    private Date startDate, endDate;

    /**
     * @return the requestID
     */
    public int getRequestID() {
        return requestID;
    }

    /**
     * @param requestID the requestID to set
     */
    public void setRequestID(int requestID) {
        this.requestID = requestID;
    }

    /**
     * @return the sourceWarehouse
     */
    public Warehouse getSourceWarehouse() {
        return sourceWarehouse;
    }

    /**
     * @param sourceWarehouse the sourceWarehouse to set
     */
    public void setSourceWarehouse(Warehouse sourceWarehouse) {
        this.sourceWarehouse = sourceWarehouse;
    }

    /**
     * @return the destWarehouse
     */
    public Warehouse getDestWarehouse() {
        return destWarehouse;
    }

    /**
     * @param destWarehouse the destWarehouse to set
     */
    public void setDestWarehouse(Warehouse destWarehouse) {
        this.destWarehouse = destWarehouse;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
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
     * @return the startDate
     */
    public Date getStartDate() {
        return startDate;
    }

    /**
     * @param startDate the startDate to set
     */
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    /**
     * @return the endDate
     */
    public Date getEndDate() {
        return endDate;
    }

    /**
     * @param endDate the endDate to set
     */
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    
}
