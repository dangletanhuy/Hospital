package com.doctor.servlet;

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

@WebServlet("/doctorUpdateProfile")
public class EditProfile extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String fullName= req.getParameter("fullname");
            String Dob= req.getParameter("dob");
            String Qualification= req.getParameter("quali");
            String Specialist= req.getParameter("specialist");
            String Phoneno= req.getParameter("phoneno");

            int id = Integer.parseInt(req.getParameter("id"));

            Doctor d = new Doctor(id, fullName, "", "", Dob, Qualification, Specialist, Phoneno);

            DoctorDao dao = new DoctorDao(DBConnect.getConn());

            HttpSession session = req.getSession(); 

            if (dao.editDoctorProfile(d)) {
                Doctor updateDoctor = dao.getDoctorById(id);
                session.setAttribute("SuccMsgD", "Doctor Update Successfully ");
                session.setAttribute("doctorObj", updateDoctor);
                resp.sendRedirect("doctor/edit_profile.jsp");
            } else {
                session.setAttribute("ErrMsgD", "Something wrong ");
                resp.sendRedirect("doctor/edit_profile.jsp");
            }

        } catch (Exception e) {
                e.printStackTrace();    
        }

    }
}
