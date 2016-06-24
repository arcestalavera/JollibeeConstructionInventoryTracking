/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import Models.Item;
import Models.Request;
import Models.Supplier;
import Models.Warehouse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Arces
 */
public class Database {

    private Connection con;
    private String sql;
    private static Database databaseInstance = new Database();

    private Database() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String host = "jdbc:mysql://127.0.0.1:3306/inventory_tracking?user=root";
            String uUser = "root";
            String uPass = "";

            con = DriverManager.getConnection(host, uUser, uPass);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Database getInstance() {
        return databaseInstance;
    }

    /* insert methods below */
    /*
     METHODS THAT WILL GET THE LIST OF OBJECTS
     */
    //method to get list of all warehouses
    public ArrayList<Warehouse> getWarehouses() {
        ArrayList<Warehouse> warehouseList = new ArrayList<>();
        Statement stmt;
        ResultSet rs;
        int warehouseID;
        String location, name;

        try {
            stmt = con.createStatement();

            sql = "SELECT * FROM warehouse";

            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Warehouse warehouse = new Warehouse();
                warehouseID = rs.getInt("warehouseID");
                location = rs.getString("location");
                name = rs.getString("name");

                warehouse.setWarehouseID(warehouseID);
                warehouse.setLocation(location);
                warehouse.setName(name);

                warehouseList.add(warehouse);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return warehouseList;
    }

    //method to get list of all items
    public ArrayList<Item> getItems() {
        ArrayList<Item> itemList = new ArrayList<>();
        Statement stmt;
        ResultSet rs;
        int itemID;
        String name, unit;

        try {
            stmt = con.createStatement();

            sql = "SELECT * FROM items";

            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Item item = new Item();
                itemID = rs.getInt("itemID");
                name = rs.getString("name");
                unit = rs.getString("unit");

                item.setItemID(itemID);
                item.setName(name);
                item.setUnit(unit);

                itemList.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return itemList;
    }

    //method to get list of all suppliers
    public ArrayList<Supplier> getSuppliers() {
        ArrayList<Supplier> supplierList = new ArrayList<>();
        Statement stmt;
        ResultSet rs;
        int supplierID;
        String name, location, contactNumber, emailAddress;

        try {
            stmt = con.createStatement();

            sql = "SELECT * FROM supplier";

            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Supplier supplier = new Supplier();
                supplierID = rs.getInt("supplierID");
                name = rs.getString("name");
                location = rs.getString("location");
                contactNumber = rs.getString("contactNumber");
                emailAddress = rs.getString("emailAddress");

                supplier.setSupplierID(supplierID);
                supplier.setName(name);
                supplier.setLocation(location);
                supplier.setContactNumber(contactNumber);
                supplier.setEmailAddress(emailAddress);

                supplierList.add(supplier);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return supplierList;
    }

    //method to get list of all requests
    public ArrayList<Request> getRequests() {
        ArrayList<Request> requestList = new ArrayList<>();
        Statement stmt;
        ResultSet rs;
        int requestID, count, itemID;
        Item item;
        String status, requestName;

        try {
            stmt = con.createStatement();

            sql = "SELECT * FROM requests";

            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Request request = new Request();
                requestID = rs.getInt("requestID");
                count = rs.getInt("count");
                status = rs.getString("status");
                requestName = rs.getString("requestName");
                itemID = rs.getInt("itemID");

                item = getItemDetails(itemID);
                
                
                request.setRequestID(requestID);
                request.setCount(count);
                request.setStatus(status);
                request.setRequestName(requestName);
                request.setItem(item);
                
                requestList.add(request);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return requestList;
    }
    
    /*
        METHODS THAT WILL GET DETAILS OF AN OBJECT
    */
    
    public Item getItemDetails(int itemID){
        Statement stmt;
        ResultSet rs;
        Item item = new Item();
        
        String name, unit;
        
        try{
            stmt = con.createStatement();

            sql = "SELECT * FROM items"
                    + " WHERE itemID = " + itemID;

            rs = stmt.executeQuery(sql);
            
            if(rs.next()){
                name = rs.getString("name");
                unit = rs.getString("unit");
                
                item.setName(name);
                item.setUnit(unit);
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        
        return item;
    }
}
