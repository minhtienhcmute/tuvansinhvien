package models;

public class User {
    private String id;
    private String email;
    private String password;
    private String name;
    private String google_id;
    private String created_at;
    private String updated_at;
    private String avatar;
    private String deleted_at;

    public User() {
    }

    public User(String id, String email, String password, String name, String google_id, String created_at, String updated_at, String avatar, String deleted_at) {
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

    public void setId(String id) {
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

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public void setDeleted_at(String deleted_at) {
        this.deleted_at = deleted_at;
    }

    public String getId() {
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

    public String getCreated_at() {
        return created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public String getAvatar() {
        return avatar;
    }

    public String getDeleted_at() {
        return deleted_at;
    }
}
