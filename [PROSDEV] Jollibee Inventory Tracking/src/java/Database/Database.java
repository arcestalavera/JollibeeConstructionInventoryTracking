/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import Models.Delivery;
import Models.Item;
import Models.Request;
import Models.Supplier;
import Models.Warehouse;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

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
            String uPass = "admin";

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

            sql = "SELECT * FROM warehouses";

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
        String name, unit, description;

        try {
            stmt = con.createStatement();

            sql = "SELECT * FROM items WHERE isDeleted = 0";

            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Item item = new Item();
                itemID = rs.getInt("itemID");
                name = rs.getString("name");
                description = rs.getString("description");
                unit = rs.getString("unit");

                item.setItemID(itemID);
                item.setName(name);
                item.setUnit(unit);
                item.setDescription(description);

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
        String name, location, contactNumber, emailAddress, contactPerson;

        try {
            stmt = con.createStatement();

            sql = "SELECT * FROM suppliers WHERE isDeleted = 0";

            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Supplier supplier = new Supplier();
                supplierID = rs.getInt("supplierID");
                name = rs.getString("name");
                location = rs.getString("location");
                contactNumber = rs.getString("contactNumber");
                emailAddress = rs.getString("emailAddress");
                contactPerson = rs.getString("contactPerson");

                supplier.setSupplierID(supplierID);
                supplier.setName(name);
                supplier.setLocation(location);
                supplier.setContactNumber(contactNumber);
                supplier.setEmailAddress(emailAddress);
                supplier.setContactPerson(contactPerson);

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
        int requestID, sourceWarehouseID, destWarehouseID;
        Warehouse sourceWarehouse, destWarehouse;
        String status, name;
        Date startDate, endDate;

        try {
            stmt = con.createStatement();

            sql = "SELECT * FROM requests";

            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Request request = new Request();
                requestID = rs.getInt("requestID");
                status = rs.getString("status");
                name = rs.getString("name");
                sourceWarehouseID = rs.getInt("sourceWarehouseID");
                destWarehouseID = rs.getInt("destWarehouseID");
                startDate = rs.getDate("startDate");
                endDate = rs.getDate("endDate");

                sourceWarehouse = getWarehouseDetails(sourceWarehouseID);
                destWarehouse = getWarehouseDetails(destWarehouseID);

                request.setRequestID(requestID);
                request.setName(name);
                request.setSourceWarehouse(sourceWarehouse);
                request.setDestWarehouse(destWarehouse);
                request.setStartDate(startDate);
                request.setEndDate(endDate);
                request.setStatus(status);

                requestList.add(request);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return requestList;
    }

    public ArrayList<Delivery> getDeliveries() {
        ArrayList<Delivery> deliveryList = new ArrayList<>();
        Statement stmt;
        ResultSet rs;
        int deliveryID, supplierID, requestID;
        Request request;
        Supplier supplier = null;
        String type, status;

        try {
            stmt = con.createStatement();

            sql = "SELECT * FROM deliveries";

            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Delivery delivery = new Delivery();
                deliveryID = rs.getInt("deliveryID");
                type = rs.getString("type");
                status = rs.getString("status");
                supplierID = rs.getInt("supplierID");
                requestID = rs.getInt("requestID");

                if (supplierID != 0) {
                    supplier = getSupplierDetails(supplierID);
                }
                request = getRequestDetails(requestID);

                delivery.setDeliveryID(deliveryID);
                delivery.setType(type);
                delivery.setStatus(status);
                delivery.setSupplier(supplier);
                delivery.setRequest(request);

                deliveryList.add(delivery);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return deliveryList;
    }

    public ArrayList<Item> getSupplierItems(int supplierID) {
        ArrayList<Item> itemList = new ArrayList<>();
        ResultSet rs;
        int itemID;
        String name, unit, description;

        try {
            sql = "SELECT I.itemID, I.name, I.description, I.unit FROM items I "
                    + " JOIN supplier_of_item SI ON I.itemID = SI.itemID"
                    + " JOIN suppliers S ON SI.supplierID = S.supplierID"
                    + " WHERE I.isDeleted = 0 AND S.supplierID = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, supplierID);

            rs = ps.executeQuery();

            while (rs.next()) {
                Item item = new Item();
                itemID = rs.getInt("itemID");
                name = rs.getString("name");
                description = rs.getString("description");
                unit = rs.getString("unit");

                item.setItemID(itemID);
                item.setName(name);
                item.setUnit(unit);
                item.setDescription(description);

                itemList.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return itemList;
    }

    public ArrayList<Warehouse> getItemWarehouses(int itemID) {
        ArrayList<Warehouse> warehouseList = new ArrayList<>();
        ResultSet rs;
        int warehouseID, count;
        String name, location;

        try {
            sql = "SELECT W.warehouseID, W.location, W.name, PI.count FROM items I "
                    + " JOIN place_of_item PI ON I.itemID = PI.itemID"
                    + " JOIN warehouses W ON PI.warehouseID = W.warehouseID"
                    + " WHERE I.itemID = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, itemID);

            rs = ps.executeQuery();

            while (rs.next()) {
                Warehouse warehouse = new Warehouse();
                Item item = new Item();
                warehouseID = rs.getInt("warehouseID");
                name = rs.getString("name");
                location = rs.getString("location");
                count = rs.getInt("count");

                warehouse.setWarehouseID(warehouseID);
                warehouse.setLocation(location);
                warehouse.setName(name);
                item = getItemDetails(itemID);
                item.setCount(count);

                warehouse.addItem(item);
                warehouseList.add(warehouse);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return warehouseList;
    }

    public ArrayList<Supplier> getItemSuppliers(int itemID) {
        ArrayList<Supplier> supplierList = new ArrayList<>();
        ResultSet rs;
        int supplierID;
        String name, location, contactNumber, emailAddress, contactPerson;

        try {
            sql = "SELECT S.supplierID, S.name, S.location, S.contactNumber, S.emailAddress, S.contactPerson FROM items I "
                    + " JOIN supplier_of_item SI ON I.itemID = SI.itemID"
                    + " JOIN suppliers S ON SI.supplierID = S.supplierID"
                    + " WHERE S.isDeleted = 0 AND I.itemID = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, itemID);

            rs = ps.executeQuery();

            while (rs.next()) {
                Item item = new Item();
                Supplier supplier = new Supplier();
                supplierID = rs.getInt("supplierID");
                name = rs.getString("name");
                location = rs.getString("location");
                contactNumber = rs.getString("contactNumber");
                emailAddress = rs.getString("emailAddress");
                contactPerson = rs.getString("contactPerson");

                supplier.setSupplierID(supplierID);
                supplier.setName(name);
                supplier.setLocation(location);
                supplier.setEmailAddress(emailAddress);
                supplier.setContactPerson(contactPerson);
                supplier.setContactNumber(contactNumber);

                item = getItemDetails(itemID);
                supplier.addItem(item);
                supplierList.add(supplier);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return supplierList;
    }

    /*
     METHODS THAT WILL GET THE DETAILS OF AN OBJECT
     */
    public Item getItemDetails(int itemID) {
        Statement stmt;
        ResultSet rs;
        Item item = new Item();

        String name, description, unit;

        try {
            stmt = con.createStatement();

            sql = "SELECT * FROM items"
                    + " WHERE itemID = " + itemID;

            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                name = rs.getString("name");
                unit = rs.getString("unit");
                description = rs.getString("description");

                item.setItemID(itemID);
                item.setName(name);
                item.setDescription(description);
                item.setUnit(unit);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return item;
    }

    public Supplier getSupplierDetails(int supplierID) {
        Statement stmt;
        ResultSet rs;
        Supplier supplier = new Supplier();
        String name, location, contactNumber, emailAddress, contactPerson;
        try {
            stmt = con.createStatement();

            sql = "SELECT * FROM suppliers"
                    + " WHERE supplierID = " + supplierID;

            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                name = rs.getString("name");
                location = rs.getString("location");
                contactNumber = rs.getString("contactNumber");
                emailAddress = rs.getString("emailAddress");
                contactPerson = rs.getString("contactPerson");

                supplier.setSupplierID(supplierID);
                supplier.setName(name);
                supplier.setLocation(location);
                supplier.setContactNumber(contactNumber);
                supplier.setEmailAddress(emailAddress);
                supplier.setContactPerson(contactPerson);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return supplier;
    }

    public Warehouse getWarehouseDetails(int warehouseID) {
        Warehouse warehouse = new Warehouse();
        Statement stmt;
        ResultSet rs;
        String name, location;
        try {
            stmt = con.createStatement();

            sql = "SELECT * FROM warehouses"
                    + " WHERE warehouseID = " + warehouseID;

            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                name = rs.getString("name");
                location = rs.getString("location");

                warehouse.setWarehouseID(warehouseID);
                warehouse.setName(name);
                warehouse.setLocation(location);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return warehouse;
    }

    public Request getRequestDetails(int requestID) {
        Request request = new Request();
        Statement stmt;
        ResultSet rs;
        int sourceWarehouseID, destWarehouseID;
        Warehouse sourceWarehouse, destWarehouse;
        String status, name;
        Date startDate, endDate;

        try {
            stmt = con.createStatement();

            sql = "SELECT * FROM requests"
                    + " WHERE requestID = " + requestID;

            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                status = rs.getString("status");
                name = rs.getString("name");
                sourceWarehouseID = rs.getInt("sourceWarehouseID");
                destWarehouseID = rs.getInt("destWarehouseID");
                startDate = rs.getDate("startDate");
                endDate = rs.getDate("endDate");

                sourceWarehouse = getWarehouseDetails(sourceWarehouseID);
                destWarehouse = getWarehouseDetails(destWarehouseID);

                request.setRequestID(requestID);
                request.setName(name);
                request.setSourceWarehouse(sourceWarehouse);
                request.setDestWarehouse(destWarehouse);
                request.setStartDate(startDate);
                request.setEndDate(endDate);
                request.setStatus(status);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return request;
    }

    /*
     METHODS THAT WILL ADD AN OBJECT TO DB
     */
    public void addWarehouse(String name, String location) {
        sql = "INSERT INTO warehouse(name, location)"
                + " VALUES(?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, location);

            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addSupplier(String name, String location, String contactNumber, String emailAddress, String contactPerson) {
        sql = "INSERT INTO supplier(name, location, contactNumber, emailAddress, contactPerson)"
                + " VALUES(?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, location);
            ps.setString(3, contactNumber);
            ps.setString(4, emailAddress);
            ps.setString(5, contactPerson);

            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addItem(String name, String description, String unit) {
        sql = "INSERT INTO items(name, description, unit, isDeleted)"
                + " VALUES(?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, unit);
            ps.setBoolean(4, false);

            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /*
     METHODS THAT WILL EDIT THE DETAILS OF AN OBJECT
     */
    public void respondRequest(int id, String response) {
        sql = "UPDATE requests SET status = ?"
                + " WHERE requestID = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, response);
            ps.setInt(2, id);

            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /*
     METHODS THAT WILL DELETE(ARCHIVE) AN OBJECT
     */
    public void deleteItem(int itemID) {
        sql = "UPDATE items SET isDeleted = " + true + ""
                + " WHERE itemID = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, itemID);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /*
     METHODS THAT WILL EDIT THE DETAILS OF AN OBJECT
     */
    public void editItem(int itemID, String name, String description, String unit) {
        sql = "UPDATE items SET name = ?, description = ?, unit = ?"
                + " WHERE itemID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, unit);
            ps.setInt(4, itemID);
            
            ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    /*
     METHODS THAT WILL GENERATE A REPORT
     */

    public int getItemCount(int itemID) {
        int count = 0;
        ResultSet rs;
        sql = "SELECT SUM(count) FROM items I"
                + " JOIN place_of_item PI ON I.itemID = PI.itemID"
                + " WHERE I.itemID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, itemID);

            rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt("SUM(count)");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }
}
