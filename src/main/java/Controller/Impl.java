package Controller;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;
import java.sql.SQLException;
import java.util.*;

public class Impl implements Dao {
    private JdbcTemplate template=new JdbcTemplate( JDBCUtils.getDataSource());

    public Impl() throws SQLException {
    }





    @Override
    public List<BorrowAndReturn> findAllBorrowAndReturn() {
        String sql="select * from borrowandreturnbook";
        return template.query(sql, new BeanPropertyRowMapper<BorrowAndReturn>(BorrowAndReturn.class));

    }

    @Override
    public void AddUser(User user) {
        String sql="insert into user values(null,?,?,?,?)";
        template.update(sql,user.getName(),user.getSex(),user.getAge(),user.getPhone());
    }
    @Override
    public void AddBook(Book book) {
        String sql="insert into book values(null,?,?,?,?)";
        template.update(sql,book.getName(),book.getAuthor(),book.getPublishdate(),book.getISBN());
    }

    @Override
    public void AddAdmin(Admin admin) {
        String sql="insert into admin values(null,?,?)";
        template.update(sql,admin.getName(),admin.getPassword());
    }

    @Override
    public User InspectWhenAddUser(User user) {
        String sql="select * from user where name = ? and sex = ? and age = ? and phone = ?";
        try {
            return template.queryForObject(sql,new BeanPropertyRowMapper<>(User.class),user.getName(),user.getSex(),user.getAge(),user.getPhone());
        } catch (DataAccessException e) {
            return null;
        }
    }

    @Override
    public Book InspectWhenAddBook(Book book) {
        String sql="select * from book where name = ? and author = ? and publishdate = ? and ISBN = ?";
        try {
            return template.queryForObject(sql,new BeanPropertyRowMapper<>(Book.class),book.getName(),book.getAuthor(),book.getPublishdate(),book.getISBN());
        } catch (DataAccessException e) {
            return null;
        }
    }

    @Override
    public Admin InspectWhenAddAdmin(Admin admin) {
        String sql="select * from admin where name = ?";
        try {
            return template.queryForObject(sql,new BeanPropertyRowMapper<>(Admin.class),admin.getName());
        } catch (DataAccessException e) {
            return null;
        }
    }

    @Override
    public Admin Login(Admin admin) {
        String sql="select * from admin where  name = ? and password = ?";
        try {
            return template.queryForObject(sql,new BeanPropertyRowMapper<>(Admin.class),admin.getName(),admin.getPassword());
        } catch (DataAccessException e) {
            return null;
        }
    }

    @Override
    public void DeleteUser(Integer id) {
    String sql="delete from user where id = ?";
    template.update(sql,id);
    }
    @Override
    public void DeleteBook(Integer id) {
        String sql="delete from book where id = ?";
        template.update(sql,id);
    }

    @Override
    public void DeleteBAR(Integer id) {
        String sql="delete from borrowandreturnbook where id = ?";
        template.update(sql,id);
    }

    @Override
    public void DeleteAdmin(Integer id) {
        String sql="delete from admin where id = ?";
        template.update(sql,id);
    }

    /*
    编辑的时候找出user用于回显
     */
    @Override
    public User findUser(Integer id) {
    String sql="select * from user where id = ?";
    return template.queryForObject(sql,new BeanPropertyRowMapper<User>(User.class),id);
    }
    @Override
    public Book findBook(Integer id) {
        String sql="select * from book where id = ?";
        return template.queryForObject(sql,new BeanPropertyRowMapper<Book>(Book.class),id);
    }

    @Override
    public Admin findadmin(Integer id) {
        String sql="select * from admin where id = ?";
        return template.queryForObject(sql,new BeanPropertyRowMapper<Admin>(Admin.class),id);
    }

    @Override
    public void UpdateUser(User user) {
    String sql="update user set name = ?,sex = ?,age = ?,phone = ? where id = ?";
    template.update(sql,user.getName(),user.getSex(),user.getAge(),user.getPhone(),user.getId());
    }
    @Override
    public void UpdateBook(Book book) {
        String sql="update book set name = ?,author = ?,publishdate = ?,ISBN = ? where id = ?";
        template.update(sql,book.getName(),book.getAuthor(),book.getPublishdate(),book.getISBN(),book.getId());
    }

    @Override
    public void Updateadmin(Admin admin) {
        String sql="update admin set name = ?,password = ? where id = ?";
        template.update(sql,admin.getName(),admin.getPassword(),admin.getId());
    }

    @Override
    public List<User> FindSearchUser(Map<String, String[]> map) {
        String sql="select * from user where 1 = 1 ";
        StringBuilder sb=new StringBuilder(sql);
        Set<String> keySet = map.keySet();
        List<Object> params=new ArrayList<Object>();
        for (String key : keySet) {
            String value = map.get(key)[0];
            if(value!=null &&!"".equals(value)){
                sb.append(" and "+key+" like ? ");
                params.add("%"+value+"%");
            }
        }

        return template.query(sb.toString(), new BeanPropertyRowMapper<>(User.class),params.toArray());
    }
    @Override
    public List<Book> FindSearchBook(Map<String, String[]> map) {
        String sql="select * from book where 1 = 1 ";
        StringBuilder sb=new StringBuilder(sql);
        Set<String> keySet = map.keySet();
        List<Object> params=new ArrayList<Object>();
        for (String key : keySet) {
            String value = map.get(key)[0];
            if(value!=null &&!"".equals(value)){
                sb.append(" and "+key+" like ? ");
                params.add("%"+value+"%");
            }
        }
        return template.query(sb.toString(), new BeanPropertyRowMapper<Book>(Book.class),params.toArray());
    }

    @Override
    public List<Admin> FindSearchAdmin(Map<String, String[]> map) {
        String sql="select * from admin where 1 = 1 ";
        StringBuilder sb=new StringBuilder(sql);
        Set<String> keySet = map.keySet();
        List<Object> params=new ArrayList<Object>();
        for (String key : keySet) {
            String value = map.get(key)[0];
            if(value!=null &&!"".equals(value)){
                sb.append(" and "+key+" like ? ");
                params.add("%"+value+"%");
            }
        }
        return template.query(sb.toString(), new BeanPropertyRowMapper<Admin>(Admin.class),params.toArray());
    }

    @Override
    public void BorrowBook(Map<String, String[]> map){
        String sql="insert into borrowandreturnbook values(null,?,?,?,null)";
        Set<String> keySet = map.keySet();
        List<Object> params=new ArrayList<Object>();
        for (String key : keySet) {
            String value = map.get(key)[0];
                params.add(value);
        }
        template.update(sql,params.toArray());
    }

    @Override
    public void returnBook(String date,Integer id) {
        String sql="update borrowandreturnbook set returndate = ? where id = ? ";
        template.update(sql,date,id);
    }
}
