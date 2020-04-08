package com.itlike.util;

public class MessageResult {
    public static <T> ResponseData<T> success(String code, String message) {
        return new ResponseData<T>(code, message);
    }

    public static <T> ResponseData<T> success(String code, String message, T data) {
        return new ResponseData<T>(code, message, data);
    }
}
