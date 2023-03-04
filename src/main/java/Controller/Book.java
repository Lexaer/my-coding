package Controller;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Book {
    /*
    书籍id，名称，作者名，出版日期，ISBN编码
     */
    private int id;
    private String name;
    private String author;
    private String publishdate;
    @JsonProperty(value="ISBN")
    private String ISBN;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublishdate() {
        return publishdate;
    }

    public void setPublishdate(String publishdate) {
        this.publishdate = publishdate;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    @Override
    public String toString() {
        return "book{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", publishdate='" + publishdate + '\'' +
                ", ISBN='" + ISBN + '\'' +
                '}';
    }
}
