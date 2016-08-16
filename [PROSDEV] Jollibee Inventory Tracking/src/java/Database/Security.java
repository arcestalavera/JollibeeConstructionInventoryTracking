/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Arces
 */
public class Security {
    private StringBuffer sb = new StringBuffer();
    private MessageDigest md = null;
    private static Security securityInstance = new Security();

    public String encryptString(String string) {
        try {
            md = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Security.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if (md!=null) {
            md.update(string.getBytes());

            byte[] encPass = md.digest();

            //convert the byte to hex
//            sb = new StringBuffer();
            for (int i = 0; i < encPass.length; i++) {
                sb.append(Integer.toString((encPass[i] & 0xff) + 0x100, 16).substring(1));
            }

            return sb.toString();
        } else return null;
    }

    public String createSalt(String string, int type) {
        String salt = "";
        switch (type) {
            //salt for beginning
            case 1:
                salt = encryptString(string.substring(0, 3));
                break;
            //salt for ending
            case 2:
                salt = encryptString(string.substring(string.length() - 3, string.length()));
                break;
        }
        return salt;
    }

    public static Security getInstance() {
        return securityInstance;
    }
}
