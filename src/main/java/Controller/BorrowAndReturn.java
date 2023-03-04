package Controller;

public class BorrowAndReturn {
    /*
    借阅记录的id，借阅者，借阅书，借阅日期，归还日期
     */
    private int id;
    private String username;
    private String bookname;
    private String createdate;
    private String returndate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getReturndate() {
        return returndate;
    }

    public void setReturndate(String returndate) {
        this.returndate = returndate;
    }



    @Override
    public String toString() {
        return "BorrowAndReturn{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", bookname='" + bookname + '\'' +
                ", createdate='" + createdate + '\'' +
                ", returndate='" + returndate + '\'' +
                '}';
    }
}
