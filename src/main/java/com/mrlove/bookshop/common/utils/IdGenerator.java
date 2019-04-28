package com.mrlove.bookshop.common.utils;

import com.mrlove.bookshop.common.domain.User;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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

    public static Object hh(){
        User user = new User();
        user.setUserId("1");
        List<User> m = new ArrayList<>();
        m.add(user);
        return m;
    }

    public static String getMD5String(String str) {
        try {
            // 生成一个MD5加密计算摘要
            MessageDigest md = MessageDigest.getInstance("MD5");
            // 计算md5函数
            md.update(str.getBytes());
            // digest()最后确定返回md5 hash值，返回值为8位字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
            // BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
            //一个byte是八位二进制，也就是2位十六进制字符（2的8次方等于16的2次方）
            return new BigInteger(1, md.digest()).toString(16);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static void main(String[] args) {
       /* System.out.println(getNumber());
        System.out.println(getID());*/
       /* String test1 = test.substring(test.indexOf("img2"),test.indexOf(","));
        test =test.replaceAll(test1,"img4_nihao4");
        System.out.println(test);*/
      /* String[] test1 = test.split(",");
       for(int i = 0 ;i<test1.length;i++){
           if(test1[i].indexOf("img1")!=-1){
               test1[i] = "img4_nihao4";
           }
       }
       for (int i = 0 ;i<test1.length;i++){
           test2 = test2+test1[i]+",";
       }*/
        /*String test = "img1_nihao1,img2_nihao2,img3_nihao3";
        String test2 = "";
       test2 = test2.substring(0,test2.length()-1);
       String test3 = "D:\\apache-tomcat-8.5.34\\webapps\\ROOT\\fileuploadpath\\\\(23)_1048e204eb.jpg";
       test = test3.substring(test3.indexOf("fileuploadpath")+16,test3.length());
       test3="img2_D:\\apache-tomcat-8.5.34\\webapps\\ROOT\\fileuploadpath\\\\(13)_2663b029fe.jpg";
        test = test3.substring(test3.indexOf("img2")+5,test3.length());*/
        /*if(hh() instanceof List){
            List<User>  t = ((List) hh());
            for (User j:t
                 ) {
                System.out.println(j.getUserId());
            }

        }else {
            System.out.println("失败");
        }*/
/*         String md5 =  getMD5String("1");
         String md6 = getMD5String("1");
         System.out.println(md5);
         System.out.println(md6);
        System.out.println(md5.equals(md6));*/
        System.out.println(getNumber());
    }
}
