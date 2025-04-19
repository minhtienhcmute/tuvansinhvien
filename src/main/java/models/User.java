package models;

import java.sql.Timestamp;
import java.util.List;

public class User {
    private int id;
    private String email;
    private String password;
    private String name;
    private String google_id;
    private Timestamp created_at;
    private Timestamp updated_at;
    private String avatar;
    private Timestamp deleted_at;
    private int type;

    private List<Role> roles;
    private List<Department> departments;

    public User() {
    }

    public User(String email, String password, String name, int type) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.type = type;
    }


    public User(String email, String password, String name, String avatar, int type) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.avatar = avatar;
        this.type = type;
    }

    public User(int id, String email, String password, String name, String google_id, Timestamp created_at, Timestamp updated_at, String avatar, Timestamp deleted_at) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.name = name;
        this.google_id = google_id;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.avatar = avatar;
        this.deleted_at = deleted_at;
    }

    public List<Department> getDepartments() {
        return departments;
    }

    public void setDepartments(List<Department> departments) {
        this.departments = departments;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setGoogle_id(String google_id) {
        this.google_id = google_id;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public void setDeleted_at(Timestamp deleted_at) {
        this.deleted_at = deleted_at;
    }

    public int getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public String getGoogle_id() {
        return google_id;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public String getAvatar() {
        return avatar;
    }

    public Timestamp getDeleted_at() {
        return deleted_at;
    }
}
