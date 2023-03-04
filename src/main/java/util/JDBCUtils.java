package util;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;
import java.sql.Connection;

public class JDBCUtils {
    private static DataSource ds;
    private static String url;
    private static String username;
    private  static String password;
    private static  String Driver;

    static {
        try {
            Properties pro = new Properties();
            InputStream is = JDBCUtils.class.getClassLoader().getResourceAsStream("druid.properties");
            pro.load(is);
            ds=DruidDataSourceFactory.createDataSource(pro);
        }
         catch (Exception e) {
            e.printStackTrace();
        }

    }


    public static DataSource getDataSource() throws SQLException {
            return ds;
    }

    public  static void close(ResultSet rs, Statement stmt, Connection conn){
        if(stmt!=null){
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(conn!=null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(rs!=null){
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
}
