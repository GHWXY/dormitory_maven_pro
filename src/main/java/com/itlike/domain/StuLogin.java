package com.itlike.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class StuLogin {
    private Integer slId;

    private String slUsername;

    @JsonIgnore
    private String slPassword;

    public Integer getSlId() {
        return slId;
    }

    public void setSlId(Integer slId) {
        this.slId = slId;
    }

    public String getSlUsername() {
        return slUsername;
    }

    public void setSlUsername(String slUsername) {
        this.slUsername = slUsername == null ? null : slUsername.trim();
    }

    public String getSlPassword() {
        return slPassword;
    }

    public void setSlPassword(String slPassword) {
        this.slPassword = slPassword == null ? null : slPassword.trim();
    }

    @Override
    public String toString() {
        return "StuLogin{" +
                "slId=" + slId +
                ", slUsername='" + slUsername + '\'' +
                ", slPassword='" + slPassword + '\'' +
                '}';
    }
}