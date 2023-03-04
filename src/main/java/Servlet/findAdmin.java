package Servlet;

import Controller.Admin;
import Controller.Dao;
import Controller.Impl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/findAdmin")
public class findAdmin extends HttpServlet {
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
        Admin admin=dao.findadmin(Integer.valueOf(id));
        request.setAttribute("admin",admin);
        request.getRequestDispatcher("/UpdateAdmin.jsp").forward(request,response);
    }
}