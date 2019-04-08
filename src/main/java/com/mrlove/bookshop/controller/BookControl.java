package com.mrlove.bookshop.controller;


import com.mrlove.bookshop.common.domain.Books;
import com.mrlove.bookshop.common.domain.ImgResult;
import com.mrlove.bookshop.common.utils.DateUtil;
import com.mrlove.bookshop.common.utils.IdGenerator;
import com.mrlove.bookshop.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@SuppressWarnings("all")
@RequestMapping("/book")
public class BookControl {
    @Autowired
    private BookService bookService;

    //查询图书事件
    @RequestMapping("selectAll")
    public String selectAll(Model model) {
        List<Books> allBooks = bookService.findAll();
        model.addAttribute("allBooks", allBooks);
        return "/backstagepage/commodity/productlist";
    }

    //上架图书事件
    @RequestMapping("onbook")
    @ResponseBody
    public Object onbook(String bookId) {
        Map<String, Object> map = new HashMap<>();
        try {
            bookService.onbook(bookId);
        } catch (Exception e) {
            map.put("success", false);
        }
        map.put("success", true);
        return map;
    }

    //下架图书事件
    @RequestMapping("offbook")
    @ResponseBody
    public Object offbook(String bookId) {
        Map<String, Object> map = new HashMap<>();
        try {
            bookService.offbook(bookId);
        } catch (Exception e) {
            map.put("success", false);
        }
        map.put("success", true);
        return map;
    }

    //删除图书事件
    @RequestMapping("deleteBook")
    @ResponseBody
    public Object deleteBook(String bookId) {
        Map<String, Object> map = new HashMap<>();
        try {
            bookService.deleteBook(bookId);
        } catch (Exception e) {
            map.put("success", false);
        }
        map.put("success", true);
        return map;
    }


    //图书详情
    @RequestMapping("beforebookparticulars")
    public Object bookParticulars(String bookId, Model model) {
        Books book = bookService.getBookById(bookId);
        book.setBookId(bookId);
        model.addAttribute("book", book);
        if("".equals(book.getBookImage1())==false){
            model.addAttribute("image1", book.getBookImage1().substring(book.getBookImage1().indexOf("fileuploadpath") + 16, book.getBookImage1().length()));
        }
        else {
            model.addAttribute("image1","error.jpg");
        }
        String test1 = book.getBookImage2();
        if("".equals(book.getBookImage2())==false){
            model.addAttribute("image2", book.getBookImage2().substring(book.getBookImage2().indexOf("fileuploadpath") + 16, book.getBookImage2().length()));
        }
        else {
            model.addAttribute("image2","error.jpg");
        }
        if("".equals(book.getBookImage3())==false){
            model.addAttribute("image3", book.getBookImage3().substring(book.getBookImage3().indexOf("fileuploadpath") + 16, book.getBookImage3().length()));
        }
        else {
            model.addAttribute("image3","error.jpg");
        }
        return "/backstagepage/commodity/bookparticulars";
    }


    //编辑图书事件
    @RequestMapping("beforeUpdatebook")
    public Object updateBook(String bookId, Model model) {
        Books book = bookService.getBookById(bookId);
        book.setBookId(bookId);
        model.addAttribute("book", book);
       if("".equals(book.getBookImage1())==false){
           model.addAttribute("image1", book.getBookImage1().substring(book.getBookImage1().indexOf("fileuploadpath") + 16, book.getBookImage1().length()));
       }
       else {
           model.addAttribute("image1","error.jpg");
       }
       String test1 = book.getBookImage2();
        if("".equals(book.getBookImage2())==false){
            model.addAttribute("image2", book.getBookImage2().substring(book.getBookImage2().indexOf("fileuploadpath") + 16, book.getBookImage2().length()));
        }
        else {
            model.addAttribute("image2","error.jpg");
        }
        if("".equals(book.getBookImage3())==false){
            model.addAttribute("image3", book.getBookImage3().substring(book.getBookImage3().indexOf("fileuploadpath") + 16, book.getBookImage3().length()));
        }
        else {
            model.addAttribute("image3","error.jpg");
        }
        return "/backstagepage/commodity/bookupdate";
    }


    //图书添加页面图片上传相应事件
    @RequestMapping("/upload")
    @ResponseBody
    public ImgResult uplpad(MultipartFile file, HttpServletRequest request, String imgId) {
        String desFilePath = "";
        String oriName = "";
        ImgResult result = new ImgResult();
        Map<String, String> dataMap = new HashMap<>();
        ImgResult imgResult = new ImgResult();
        try {
            // 1.获取原文件名
            oriName = file.getOriginalFilename();
            // 2.获取原文件图片后缀，以最后的.作为截取(.jpg)
            String extName = oriName.substring(oriName.lastIndexOf("."));
            //获取图片名
            String imgName = oriName.substring(0, oriName.lastIndexOf("."));
            // 3.生成自定义的新文件名，这里以UUID.jpg|png|xxx作为格式（可选操作，也可以不自定义新文件名）
            //  String newName = imgId + "_" + IdGenerator.getNameAndId(imgName) + extName;
            String newName = IdGenerator.getNameAndId(imgName) + extName;
            // 4.获取要保存的路径文件夹
            String realPath = request.getSession().getServletContext().getRealPath("fileuploadpath/");
            // 5.保存
            desFilePath = realPath + "\\" + newName;
            File desFile = new File(desFilePath);
            file.transferTo(desFile);
            System.out.println(desFilePath);
            // 6.返回保存结果信息
            result.setImgids(imgId);
            System.out.println("Id:" + imgId);
            result.setCode(0);
            dataMap = new HashMap<>();
            dataMap.put("src", desFilePath);
            result.setData(dataMap);
            result.setMsg(oriName + "上传成功！");
            return result;
        } catch (IllegalStateException e) {
            imgResult.setCode(1);
            System.out.println(desFilePath + "图片保存失败");
            return imgResult;
        } catch (IOException e) {
            imgResult.setCode(1);
            System.out.println(desFilePath + "图片保存失败--IO异常");
            return imgResult;
        }
    }

    //图书添加页面表单提交添加按钮响应事件
    @RequestMapping(value = "saveGoods", method = RequestMethod.POST)
    @ResponseBody
    private String saveImgInfo(String bookname, String originalprice, String promotionprice, String cost, String clazz, String subclazz, String auther, String press, String testdate, String plotsummary, String biography, String catalog, String mediacomments, String addcount, String imgUrls) {
        String[] urls = imgUrls.split(",");
        String[] urls1 = new String[3];
        urls1[0] = "";
        urls1[1] = "";
        urls1[2] = "";
        for (int i = 0; i < urls.length; i++) {
            urls1[i] = urls[i];
        }
        try {
            Books books = new Books(IdGenerator.getID(), IdGenerator.getNumber(), bookname, urls1[0], urls1[1], urls1[2], originalprice, promotionprice, cost, clazz, subclazz, null, null, auther, press, testdate, plotsummary, biography, catalog, mediacomments, null, addcount, "1", DateUtil.parseDateToStr(new Date(), DateUtil.DATE_TIME_FORMAT_YYYY_MM_DD_HH_MI_SS), null, null);
            bookService.insertSelective(books);
        } catch (Exception e) {
            //保存失败
            System.out.println(e);
            return "0";
        }
        //保存成功
        return "1";
    }

    //图书编辑页面表单提交添加按钮响应事件
    @RequestMapping(value = "updateGoods", method = RequestMethod.POST)
    @ResponseBody
    private String updateImgInfo(String bookId,String bookname, String originalprice, String promotionprice, String cost, String clazz, String subclazz, String auther, String press, String testdate, String plotsummary, String biography, String catalog, String mediacomments, String addcount, String imgUrls,String image1,String image2,String image3) {
        String[] urls = imgUrls.split(",");
        String[] urls1 = new String[3];
       /* urls1[0] = image1;
        urls1[1] = image2;
        urls1[2] = image3;*/
       urls1[0] = "";
        urls1[1] = "";
        urls1[2] = "";
        for (int i = 0; i < urls.length; i++) {
           if("".equals(urls[i])==false){
               if("img1".equals(urls[i].substring(0,urls[i].indexOf("_D")))){
                   urls1[0] = urls[i].substring(urls[i].indexOf("img1")+5,urls[i].length());
               }
               if("img2".equals(urls[i].substring(0,urls[i].indexOf("_D")))){
                   urls1[1] = urls[i].substring(urls[i].indexOf("img2")+5,urls[i].length());
               }
               if("img3".equals(urls[i].substring(0,urls[i].indexOf("_D")))){
                   urls1[2] = urls[i].substring(urls[i].indexOf("img3")+5,urls[i].length());
               }
           }
        }
        System.out.println("测试:" + urls1[0] + "测试:" + urls1[1] + "测试:" + urls1[2]);
        try {
            Books books = new Books(bookId,null, bookname, urls1[0], urls1[1], urls1[2], originalprice, promotionprice, cost, clazz, subclazz, null, null, auther, press, testdate, plotsummary, biography, catalog, mediacomments, null, addcount, null,null, null, null);
            bookService.updateBookById(books);
        } catch (Exception e) {
            //保存失败
            System.out.println(e);
            return "0";
        }
        //保存成功
        return "1";
    }





















/*
    @RequestMapping("/test")
    public void Test(){
        String path = "1";
        Books books1 = new Books(path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path);
        bookService.insert(books1);
        System.out.println("好了");
    }*/

    /*采用spring提供的上传文件的方法*/

   /* @RequestMapping("springUpload")
    @ResponseBody
    public Object springUpload(@RequestParam("groupNum") String groupNum, HttpServletRequest request) throws IllegalStateException, IOException
    {



        // long  startTime=System.currentTimeMillis();
        Map<String,Object> map = new HashMap<>();
        //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
                request.getSession().getServletContext());
        //检查form中是否有enctype="multipart/form-data"
        if(multipartResolver.isMultipart(request))
        {
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
            //获取multiRequest 中所有的文件名
            Iterator iter=multiRequest.getFileNames();
            while(iter.hasNext())
            {
                //一次遍历所有文件
                MultipartFile file=multiRequest.getFile(iter.next().toString());
                if(file!=null)
                {
                    String path="E:/IJ_codes/bookshop/web/fileuploadpath/"+file.getOriginalFilename();
//                    String path = request.getSession().getServletContext().getRealPath("/fileuploadpath/")+file.getOriginalFilename();
                    //上传
                    file.transferTo(new File(path));
                    map.put("res",true);
                    Date date = new Date();
                    //System.out.println(file);
                    //获取扩展名
                    String expandedName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
                    Books books = new Books(path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path,path);
                    bookService.insert(books);
                }
            }
        }
        //  long  endTime=System.currentTimeMillis();
        //  System.out.println("方法三的运行时间："+String.valueOf(endTime-startTime)+"ms");
        return map;
    }*/
}
