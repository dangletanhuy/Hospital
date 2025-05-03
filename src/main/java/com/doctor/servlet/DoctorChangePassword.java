package com.doctor.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/doctorChangePassword")
public class DoctorChangePassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int uid = Integer.parseInt(req.getParameter("uid"));
        String oldPassword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");

        DoctorDao dao = new DoctorDao(DBConnect.getConn());
        HttpSession session = req.getSession();

        if(dao.checkOldPassword(uid, oldPassword)) {
            if(dao.changePassword(uid, newPassword)) {
                session.setAttribute("SuccMsg", "Password Changed Successfully");
                resp.sendRedirect("doctor/edit_profile.jsp");
            } else {
                session.setAttribute("ErrMsg", "Something went wrong");
                resp.sendRedirect("doctor/edit_profile.jsp");
            }
        } else {
            session.setAttribute("ErrMsg", "Old Password is incorrect");
            resp.sendRedirect("doctor/edit_profile.jsp");
        }
    }
}
