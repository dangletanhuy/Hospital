package com.admin.servlet;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServlet;

@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String fullName= req.getParameter("fullname");
            String Dob= req.getParameter("dob");
            String Email= req.getParameter("email");
            String Qualification= req.getParameter("quali");
            String Specialist= req.getParameter("specialist");
            String Phoneno= req.getParameter("phoneno");
            String Password= req.getParameter("password");

            Doctor d = new Doctor(fullName, Email, Password, Dob, Qualification, Specialist, Phoneno);

            DoctorDao dao = new DoctorDao(DBConnect.getConn());

            HttpSession session = req.getSession(); 

            if (dao.RegisterDoctor(d)) {

                session.setAttribute("SuccMsg", "Doctor Successfully Added");
                resp.sendRedirect("admin/add_doctor.jsp");

            } else {
                session.setAttribute("ErrMsg", "Something wrong ");
                resp.sendRedirect("admin/add_doctor.jsp");
            }

        } catch (Exception e) {
                e.printStackTrace();    
        }
    }
    
}
