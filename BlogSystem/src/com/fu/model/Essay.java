package com.fu.model;

import java.util.Date;

/**
 * Created by wunaifu on 2017/7/1.
 */
public class Essay {
    private String essayId;
    private String userId;
    private String userNickname;
    private String essayTitle;
    private String essayContent;
    private String essayImage;
    private Date sendIime;
    private String discussContent;
    private String likesAmount;
    private String discussAmount;
    private String collectAmount;

    public String getDiscussContent() {
        return discussContent;
    }

    public void setDiscussContent(String discussContent) {
        this.discussContent = discussContent;
    }

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname;
    }

    public String getEssayId() {
        return essayId;
    }

    public void setEssayId(String essayId) {
        this.essayId = essayId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getEssayTitle() {
        return essayTitle;
    }

    public void setEssayTitle(String essayTitle) {
        this.essayTitle = essayTitle;
    }

    public String getEssayContent() {
        return essayContent;
    }

    public void setEssayContent(String essayContent) {
        this.essayContent = essayContent;
    }

    public String getEssayImage() {
        return essayImage;
    }

    public void setEssayImage(String essayImage) {
        this.essayImage = essayImage;
    }

    public Date getSendIime() {
        return sendIime;
    }

    public void setSendIime(Date sendIime) {
        this.sendIime = sendIime;
    }

    public String getLikesAmount() {
        return likesAmount;
    }

    public void setLikesAmount(String likesAmount) {
        this.likesAmount = likesAmount;
    }

    public String getDiscussAmount() {
        return discussAmount;
    }

    public void setDiscussAmount(String discussAmount) {
        this.discussAmount = discussAmount;
    }

    public String getCollectAmount() {
        return collectAmount;
    }

    public void setCollectAmount(String collectAmount) {
        this.collectAmount = collectAmount;
    }
}
