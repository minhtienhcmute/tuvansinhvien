package models;

public class Book {
    private int id;
    private String name;
    private Boolean status;
    private int category_id;

    public Book() {
    }

    public Book(int id, String name, Boolean status, int category_id) {
        this.id = id;
        this.name = name;
        this.status = status;
        this.category_id = category_id;
    }

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

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }
}
