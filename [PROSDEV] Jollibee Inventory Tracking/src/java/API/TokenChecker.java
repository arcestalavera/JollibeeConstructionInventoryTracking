/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package API;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Arces
 */
public interface TokenChecker {
    public boolean checkToken(HttpServletRequest req);
}
