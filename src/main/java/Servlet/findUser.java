package Servlet;

import Controller.User;
import Controller.Dao;
import Controller.Impl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/findUser")
public class findUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Dao dao= null;
        try {
            dao = new Impl();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        User user = dao.findUser(Integer.valueOf(id));
        request.setAttribute("user",user);
        request.getRequestDispatcher("/UpdateUser.jsp").forward(request,response);

    }
}