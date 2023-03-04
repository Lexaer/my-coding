package Controller;

import java.util.List;
import java.util.Map;

public interface Dao {
    public List<BorrowAndReturn> findAllBorrowAndReturn();

    public void AddUser(User user);
    public void AddBook(Book book);
    public void AddAdmin(Admin admin);
    public User InspectWhenAddUser(User user);
    public Book InspectWhenAddBook(Book book);
    public Admin InspectWhenAddAdmin(Admin admin);
    public Admin Login(Admin admin);

    public void DeleteUser(Integer id);
    public void DeleteBook(Integer id);
    public void DeleteBAR(Integer id);
    public void DeleteAdmin(Integer id);

    public User findUser(Integer id);
    public Book findBook(Integer id);
    public Admin findadmin(Integer id);
    void UpdateUser(User user);
    void UpdateBook(Book book);
    void Updateadmin(Admin admin);
    List<User> FindSearchUser(Map<String, String[]> map);
    List<Book> FindSearchBook(Map<String, String[]> map);
    List<Admin> FindSearchAdmin(Map<String, String[]> map);
    void BorrowBook(Map<String, String[]> map);
    void returnBook(String date,Integer id);
}
