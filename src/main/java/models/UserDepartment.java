package models;

public class UserDepartment {
    private int user_id;
    private int department_id;

    public UserDepartment(int user_id, int department_id) {
        this.user_id = user_id;
        this.department_id = department_id;
    }

    public void setUserId(int user_id) {
        this.user_id = user_id;
    }

    public void setDepartmentId(int department_id) {
        this.department_id = department_id;
    }

    public int getUserId() {
        return user_id;
    }

    public int getDepartmentId() {
        return department_id;
    }
}
