/*
 * Copyright © 2018 Dennis Schulmeister-Zimolong
 * 
 * E-Mail: dhbw@windows3.de
 * Webseite: https://www.wpvs.de/
 * 
 * Dieser Quellcode ist lizenziert unter einer
 * Creative Commons Namensnennung 4.0 International Lizenz.
 */
package dhbwka.wwi.vertsys.javaee.wastebin.web;

import dhbwka.wwi.vertsys.javaee.wastebin.ejb.WasteBean;
import dhbwka.wwi.vertsys.javaee.wastebin.jpa.Waste;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Startseite: Zeigt eine Übersicht der vorhandenen Textschnippsel sowie einen
 * Link zum Anlegen neuer Schnippsel.
 */
@WebServlet(urlPatterns="/index.html")
public class IndexServlet extends HttpServlet {
    
    public static final String URL = "/index.html";

    @EJB
    WasteBean wasteBean;
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        // TODO: Vorhandene Schnippsel von der Datenbank einlesen
        // TODO: Vorhandene Schnippsel unter "allWaste" im Request Context ablegen
        List<Waste> schnippsel = this.wasteBean.findAllWaste();
        request.setAttribute("allWaste", schnippsel);
        
        // TODO: Anfrage an die /WEB-INF/index.jsp weiterleiten
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }
    
}
