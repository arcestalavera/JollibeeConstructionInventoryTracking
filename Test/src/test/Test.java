/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package test;

import java.util.ArrayList;

/**
 *
 * @author Arces
 */
public class Test {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String a = "hehehe";
        ArrayList<String> woo = new ArrayList<>();
        ArrayList<String> wee = new ArrayList<>();
        
        woo.add(a);
        wee.add(woo.get(0));
        
        woo.set(0, "hahaha");
        
        System.out.println("woo " + woo.get(0) + " wee " + wee.get(0));
    }
    
}
