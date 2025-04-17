package models;

import java.util.List;

public class Question {
    private int id;
    private int user_id;
    private int category_id;
    private int department_id;
    private String title;
    private String content;
    private int status;
    private int vote_cnt;
    private int views;
    private String reason;
    private String created_at;
    private List<Comment> comments;

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    private String updated_at;
    private User user;
    private Department department;
    private Category category;

    public Question() {
    }

    public int getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(int department_id) {
        this.department_id = department_id;
    }

    public Question(int id, int user_id, int category_id, String title, String content, int status, int vote_cnt, int views, String reason, String created_at, String updated_at) {
        this.id = id;
        this.user_id = user_id;
        this.category_id = category_id;
        this.title = title;
        this.content = content;
        this.status = status;
        this.vote_cnt = vote_cnt;
        this.views = views;
        this.reason = reason;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public Question(int user_id, int category_id, int department_id, String title, String content) {
        this.user_id = user_id;
        this.category_id = category_id;
        this.department_id = department_id;
        this.title = title;
        this.content = content;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setVote_cnt(int vote_cnt) {
        this.vote_cnt = vote_cnt;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    public int getId() {
        return id;
    }

    public int getUser_id() {
        return user_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public int getStatus() {
        return status;
    }

    public int getVote_cnt() {
        return vote_cnt;
    }

    public int getViews() {
        return views;
    }

    public String getReason() {
        return reason;
    }

    public String getCreated_at() {
        return created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }
}
