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
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;

@WebServlet("/addadmin")
public class addadmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> map = request.getParameterMap();
        Admin admin=new Admin();
        try {
            BeanUtils.populate(admin,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        Dao dao=null;
        try {
            dao=new Impl();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Admin admin1 = dao.InspectWhenAddAdmin(admin);
        ObjectMapper mapper=new ObjectMapper();
        String add_msg;
        if(admin1==null){
            dao.AddAdmin(admin);
            add_msg="添加成功";
            response.setContentType("application/json;charset=UTF-8");
            mapper.writeValue(response.getWriter(),add_msg);
        }else{
            add_msg="添加失败，管理员重复";
            response.setContentType("application/json;charset=UTF-8");
            mapper.writeValue(response.getWriter(),add_msg);
        }
    }
}