package Servlet;

import Controller.Admin;
import Controller.Dao;
import Controller.Impl;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet("/FindSearchAdmin")
public class FindSearchAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> map = request.getParameterMap();
        Dao dao= null;
        try {
            dao = new Impl();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        List<Admin> admins = dao.FindSearchAdmin(map);
        ObjectMapper mapper=new ObjectMapper();
        response.setContentType("application/json;charset=UTF-8");
        mapper.writeValue(response.getWriter(),admins);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> map = request.getParameterMap();
        Dao dao= null;
        try {
            dao = new Impl();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        List<Admin> admins = dao.FindSearchAdmin(map);
        request.setAttribute("admins",admins);
        request.getRequestDispatcher("/DisplaySearchAdmin.jsp").forward(request,response);
    }
}