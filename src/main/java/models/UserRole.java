package models;

public class UserRole {
    private int user_id;
    private int role_id;

    public UserRole(int user_id, int role_id) {
        this.user_id = user_id;
        this.role_id = role_id;
    }

    public void setUserId(int user_id) {
        this.user_id = user_id;
    }

    public void setRoleId(int role_id) {
        this.role_id = role_id;
    }

    public int getUserId() {
        return user_id;
    }

    public int getRoleId() {
        return role_id;
    }
}
