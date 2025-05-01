package com.doctor.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.Doctor;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        HttpSession session = req.getSession();

        DoctorDao dao = new DoctorDao(DBConnect.getConn());
        Doctor doctor = dao.login(email, password);

        if(doctor != null){
            session.setAttribute("doctorObj", doctor);
            resp.sendRedirect("doctor/doctor_index.jsp");
        }else {
            session.setAttribute("ErrMsg", "Username or Password not correct");
            resp.sendRedirect("doctor_login.jsp");
        }
    }
}
