package com.itlike.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import javax.servlet.http.HttpSession;
import java.util.Locale;

@Controller
public class LocaleController {
    @RequestMapping(value = "/changelocale",method = RequestMethod.GET)
    public String change(@RequestParam("login")String param, HttpSession session){
        if ("zh_CN".equals(param)){
            Locale zh = new Locale("zh", "CN");
            session.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME,zh);
        }
        else if ("en_US".equals(param)){
            Locale en = new Locale("en", "US");
            session.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME,en);
        }
        return "login3";


    }
}
