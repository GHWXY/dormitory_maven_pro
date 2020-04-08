package com.itlike.domain;

public class AjaxRes {
    private boolean success;
    private String msg;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    @Override
    public String toString() {
        return "AjaxRes{" +
                "success=" + success +
                ", msg='" + msg + '\'' +
                '}';
    }
}
