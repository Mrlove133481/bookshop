package com.mrlove.bookshop.controller;

import com.mrlove.bookshop.common.domain.Books;
import com.mrlove.bookshop.common.domain.ImgResult;
import com.mrlove.bookshop.common.domain.Result;
import com.mrlove.bookshop.common.domain.User;
import com.mrlove.bookshop.common.utils.IdGenerator;
import com.mrlove.bookshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@SuppressWarnings("all")
@RequestMapping("/user")
public class UserControl {
    @Autowired
    private UserService userService;
    //查找用户信息
    @RequestMapping("finduser")
    @ResponseBody
    public User finduser(String userId){
        return userService.finduser(userId);
    }
    //头像上传事件
    @RequestMapping("/upload")
    @ResponseBody
    public ImgResult uplpad(MultipartFile file, HttpServletRequest request, String imgId) {
        String desFilePath = "";//保存路径
        String oriName = "";//原文件名
        ImgResult result = new ImgResult();
        Map<String, String> dataMap = new HashMap<>();
        ImgResult imgResult = new ImgResult(); //失败返回集
        try {
            // 1.获取原文件名
            oriName = file.getOriginalFilename();
            // 2.获取原文件图片后缀，以最后的.作为截取(.jpg)
            String extName = oriName.substring(oriName.lastIndexOf("."));
            //获取图片名
            String imgName = oriName.substring(0, oriName.lastIndexOf("."));
            // 3.生成自定义的新文件名，这里以UUID.jpg|png|xxx作为格式（可选操作，也可以不自定义新文件名）
            String newName = IdGenerator.getNameAndId(imgName) + extName;
            // 4.获取要保存的路径文件夹
            String realPath = request.getSession().getServletContext().getRealPath("fileuploadpath/useravatar/");
            // 5.保存
            desFilePath = realPath + "\\" + newName;
            File desFile = new File(desFilePath);
            file.transferTo(desFile);
            // 6.返回保存结果信息
            result.setImgids(imgId);
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
    //更新信息
    @RequestMapping(value = "updateinfo", method = RequestMethod.POST)
    @ResponseBody
    private Result updateImgInfo(String userNickName, String userRemark1, String userBirthday, String userSex, String userTelnum, String userEmail, String oldimage, String newimage, String userId, HttpSession httpSession) {
        //System.out.println(userId+userNickName+oldimage+userSex+userBirthday+userTelnum+userEmail+userRemark1);
      //  System.out.println("".equals(newimage));
        if(!"".equals(newimage)){
            oldimage = newimage;
        }
        try {
            //userRemark1:姓名
            userService.updateuser(userId,userNickName,oldimage,Integer.parseInt(userSex),userBirthday,userTelnum,userEmail,userRemark1);
        } catch (Exception e) {
            //保存失败
            return new Result(false,"更新失败");
        }
        //保存成功
        httpSession.setAttribute("userimgs",oldimage.substring(oldimage.indexOf("useravatar")+12,oldimage.length()));
        return new Result(true,"更新成功");
    }

}
