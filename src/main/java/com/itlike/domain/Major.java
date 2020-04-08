package com.itlike.domain;

public class Major {
    private Integer id;

    private String majorid;

    private String majorna;

    private String depaid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMajorid() {
        return majorid;
    }

    public void setMajorid(String majorid) {
        this.majorid = majorid == null ? null : majorid.trim();
    }

    public String getMajorna() {
        return majorna;
    }

    public void setMajorna(String majorna) {
        this.majorna = majorna == null ? null : majorna.trim();
    }

    public String getDepaid() {
        return depaid;
    }

    public void setDepaid(String depaid) {
        this.depaid = depaid == null ? null : depaid.trim();
    }

    @Override
    public String toString() {
        return "Major{" +
                "id=" + id +
                ", majorid='" + majorid + '\'' +
                ", majorna='" + majorna + '\'' +
                ", depaid='" + depaid + '\'' +
                '}';
    }
}