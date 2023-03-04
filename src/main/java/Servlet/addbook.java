package Servlet;

import Controller.Book;
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

@WebServlet("/addbook")
public class addbook extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> map = request.getParameterMap();
        Book book=new Book();
        try {
            BeanUtils.populate(book,map);
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
        Book book1 = dao.InspectWhenAddBook(book);
        ObjectMapper mapper=new ObjectMapper();
        String add_msg;
        if(book1==null){
            dao.AddBook(book);
            add_msg="添加成功";
            response.setContentType("application/json;charset=UTF-8");
            mapper.writeValue(response.getWriter(),add_msg);
        }else{
            add_msg="添加失败，书籍重复";
            response.setContentType("application/json;charset=UTF-8");
            mapper.writeValue(response.getWriter(),add_msg);
        }
    }
}