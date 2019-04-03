package com.mrlove.bookshop.common.utils;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MyDateConverter implements Converter<String, Date> {
    private static SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");


    @Override
    public Date convert(String s) {//"  2018-10-20  "  null
        try {
            if(s!=null && s.trim().length()>0){
                return dataFormat.parse(s.trim());
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return  null;
    }
}
