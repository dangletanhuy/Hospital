package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;


@WebServlet("/user_register")

public class UserRegister extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try {
            String fullName = req.getParameter("fullname");
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            User u = new User(fullName, email, password);

            UserDao dao = new UserDao(DBConnect.getConn());

            HttpSession session = req.getSession();
            
           boolean f = dao.register(u);

              if(f){

                session.setAttribute("SucMsg", "Successfully registered");
                resp.sendRedirect(req.getContextPath() + "/component/signup.jsp");


            }else {
                session.setAttribute("ErrMsg", "Failed to register");
              resp.sendRedirect(req.getContextPath() + "/component/signup.jsp");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    


}

