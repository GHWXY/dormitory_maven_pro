package com.itlike.domain;

public class Product {
    private Integer pid;

    private String pname;

    private Double pprice;

    private Integer ptotal;

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
    }

    public Double getPprice() {
        return pprice;
    }

    public void setPprice(Double pprice) {
        this.pprice = pprice;
    }

    public Integer getPtotal() {
        return ptotal;
    }

    public void setPtotal(Integer ptotal) {
        this.ptotal = ptotal;
    }
}