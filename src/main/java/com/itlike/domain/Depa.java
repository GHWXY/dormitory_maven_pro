package com.itlike.domain;

public class Depa {
    private Integer id;

    private String depaid;

    private String depana;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDepaid() {
        return depaid;
    }

    public void setDepaid(String depaid) {
        this.depaid = depaid == null ? null : depaid.trim();
    }

    public String getDepana() {
        return depana;
    }

    public void setDepana(String depana) {
        this.depana = depana == null ? null : depana.trim();
    }

    @Override
    public String toString() {
        return "Depa{" +
                "id=" + id +
                ", depaid='" + depaid + '\'' +
                ", depana='" + depana + '\'' +
                '}';
    }
}