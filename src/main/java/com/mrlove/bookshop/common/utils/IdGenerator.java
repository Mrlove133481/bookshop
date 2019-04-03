package com.mrlove.bookshop.common.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class IdGenerator {
    private static SimpleDateFormat format = new SimpleDateFormat("yyMMddHH");
    private static SimpleDateFormat format1 = new SimpleDateFormat("mmssS");

    public static  String getID(){
        String rs = null;
        rs = UUID.randomUUID().toString().replace("-","").substring(0,10);
        rs = format.format(new Date())+"_"+rs ;
        return rs;
    }

    public static  String getNumber(){
        String rs1 = null;
        rs1 = UUID.randomUUID().toString().replace("-","").substring(0,4);
        rs1 = format1.format(new Date().getTime())+rs1;
        return rs1;
    }

    public static  String getNameAndId(String name){
        String rs1 = null;
        rs1 = UUID.randomUUID().toString().replace("-","").substring(0,10);
        rs1 =name+"_"+rs1;
        return rs1;
    }

    public static void main(String[] args) {
       /* System.out.println(getNumber());
        System.out.println(getID());*/

        String test = "img1_nihao1,img2_nihao2,img3_nihao3";
        String test2 = "";
       /* String test1 = test.substring(test.indexOf("img2"),test.indexOf(","));
        test =test.replaceAll(test1,"img4_nihao4");
        System.out.println(test);*/
       String[] test1 = test.split(",");
       for(int i = 0 ;i<test1.length;i++){
           if(test1[i].indexOf("img1")!=-1){
               test1[i] = "img4_nihao4";
           }
       }
       for (int i = 0 ;i<test1.length;i++){
           test2 = test2+test1[i]+",";
       }
       test2 = test2.substring(0,test2.length()-1);


       String test3 = "D:\\apache-tomcat-8.5.34\\webapps\\ROOT\\fileuploadpath\\\\(23)_1048e204eb.jpg";
       test = test3.substring(test3.indexOf("fileuploadpath")+16,test3.length());
        System.out.println(test);
    }
}
