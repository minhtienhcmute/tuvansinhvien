package models;

import java.sql.Timestamp;

public class Department {
    private int id;
    private String name;
    private String description;
    private Timestamp created_at;
    private Timestamp updated_at;
    private String deleted_at;

    public Department(int id, String name, String description, Timestamp created_at, Timestamp updated_at, String deleted_at) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.deleted_at = deleted_at;
    }

    public Department() {
    }

    public Department(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

    public void setDeleted_at(String deleted_at) {
        this.deleted_at = deleted_at;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public String getDeleted_at() {
        return deleted_at;
    }
}
