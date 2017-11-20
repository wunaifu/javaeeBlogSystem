package com.fu.model;

/**
 * Created by wunaifu on 2017/7/5.
 */
public class Discuss {

    private String id;//自增
    private String essayId;

    private String discusserId;
    private String nickname;//昵称
    private String profession;//职业

    private String discussTime;
    private String discussContent;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEssayId() {
        return essayId;
    }

    public void setEssayId(String essayId) {
        this.essayId = essayId;
    }

    public String getDiscusserId() {
        return discusserId;
    }

    public void setDiscusserId(String discusserId) {
        this.discusserId = discusserId;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getDiscussTime() {
        return discussTime;
    }

    public void setDiscussTime(String discussTime) {
        this.discussTime = discussTime;
    }

    public String getDiscussContent() {
        return discussContent;
    }

    public void setDiscussContent(String discussContent) {
        this.discussContent = discussContent;
    }
}
