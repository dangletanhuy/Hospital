package com.admin.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServlet;

import com.dao.SpecialistDao;
import com.db.DBConnect;

@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String speName= req.getParameter("speName");

            SpecialistDao dao = new SpecialistDao(DBConnect.getConn());

            boolean f = dao.addSpecialist(speName);

            HttpSession session = req.getSession(); 

            if (f) {

                session.setAttribute("SuccMsg", "Specialist Successfully added");
                resp.sendRedirect("admin/adm_index.jsp");

            } else {
                session.setAttribute("ErrMsg", "Something wrong ");
                resp.sendRedirect("admin/adm_index.jsp");

            }

        } catch (Exception e) {
            e.printStackTrace();    
}
    }
}
