package models;

public class Permission {
    private int id;
    private String code;
    private String module;
    private String action;
    private String created_at;
    private String updated_at;
    private String deleted_at;

    public Permission() {
    }

    public Permission(int id, String code, String module, String action, String created_at, String updated_at, String deleted_at) {
        this.id = id;
        this.code = code;
        this.module = module;
        this.action = action;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.deleted_at = deleted_at;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setModule(String module) {
        this.module = module;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    public void setDeleted_at(String deleted_at) {
        this.deleted_at = deleted_at;
    }

    public int getId() {
        return id;
    }

    public String getCode() {
        return code;
    }

    public String getModule() {
        return module;
    }

    public String getAction() {
        return action;
    }

    public String getCreated_at() {
        return created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public String getDeleted_at() {
        return deleted_at;
    }
}
