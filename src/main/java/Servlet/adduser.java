package Servlet;

import Controller.User;
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

@WebServlet("/adduser")
public class adduser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> map = request.getParameterMap();
        User user=new User();
        try {
            BeanUtils.populate(user,map);
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
        User user1 = dao.InspectWhenAddUser(user);
        ObjectMapper mapper=new ObjectMapper();
        String add_msg;
        if(user1==null){
            dao.AddUser(user);
            add_msg="添加成功";
            response.setContentType("application/json;charset=UTF-8");
            mapper.writeValue(response.getWriter(),add_msg);
        }else{
            add_msg="添加失败，用户重复";
            response.setContentType("application/json;charset=UTF-8");
            mapper.writeValue(response.getWriter(),add_msg);
        }
    }
}