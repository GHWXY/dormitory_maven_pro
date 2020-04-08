package com.itlike.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Wrongmsg {
    private Integer id;

    private Long stuid;

    private String stuname;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date wrongday;

    private String wrongreason;

    private String result;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getStuid() {
        return stuid;
    }

    public void setStuid(Long stuid) {
        this.stuid = stuid;
    }

    public String getStuname() {
        return stuname;
    }

    public void setStuname(String stuname) {
        this.stuname = stuname == null ? null : stuname.trim();
    }

    public Date getWrongday() {
        return wrongday;
    }

    public void setWrongday(Date wrongday) {
        this.wrongday = wrongday;
    }

    public String getWrongreason() {
        return wrongreason;
    }

    public void setWrongreason(String wrongreason) {
        this.wrongreason = wrongreason == null ? null : wrongreason.trim();
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result == null ? null : result.trim();
    }

    @Override
    public String toString() {
        return "Wrongmsg{" +
                "id=" + id +
                ", stuid=" + stuid +
                ", stuname='" + stuname + '\'' +
                ", wrongday=" + wrongday +
                ", wrongreason='" + wrongreason + '\'' +
                ", result='" + result + '\'' +
                '}';
    }
}