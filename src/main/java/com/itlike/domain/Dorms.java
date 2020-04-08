package com.itlike.domain;

public class Dorms {
    private Integer id;

    private String dormna;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDormna() {
        return dormna;
    }

    public void setDormna(String dormna) {
        this.dormna = dormna == null ? null : dormna.trim();
    }

    @Override
    public String toString() {
        return "Dorms{" +
                "id=" + id +
                ", dormna='" + dormna + '\'' +
                '}';
    }
}