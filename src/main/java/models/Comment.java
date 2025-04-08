package models;

public class Comment {
    private int id;
    private int user_id;
    private int question_id;
    private String content;
    private int vote_cnt;
    private String created_at;
    private String updated_at;

    public Comment() {
    }

    public Comment(int id, int user_id, int question_id, String content, int vote_cnt, String created_at, String updated_at) {
        this.id = id;
        this.user_id = user_id;
        this.question_id = question_id;
        this.content = content;
        this.vote_cnt = vote_cnt;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setVote_cnt(int vote_cnt) {
        this.vote_cnt = vote_cnt;
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

    public int getQuestion_id() {
        return question_id;
    }

    public String getContent() {
        return content;
    }

    public int getVote_cnt() {
        return vote_cnt;
    }

    public String getCreated_at() {
        return created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }
}
