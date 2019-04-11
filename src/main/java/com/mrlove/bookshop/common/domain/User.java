package com.mrlove.bookshop.common.domain;

public class User {
    private String userId;

    private String userName;

    private String userPwd;

    private String userNickName;

    private String userImage;

    private Integer userSex;

    private String userBirthday;

    private String userTelnum;

    private String userEmail;

    private String userOrder;

    private String userAddress;

    private String userCollect;

    private String userShopCart;

    private String userCreationTime;

    private Integer userStatus;

    private String userRemark1;

    private String userRemark2;

    private String userRemark3;

    private String userRemark4;

    public User() {
    }

    public User(String userId, String userName, String userPwd, String userNickName, String userImage, Integer userSex, String userBirthday, String userTelnum, String userEmail, String userOrder, String userAddress, String userCollect, String userShopCart, String userCreationTime, Integer userStatus, String userRemark1, String userRemark2, String userRemark3, String userRemark4) {
        this.userId = userId;
        this.userName = userName;
        this.userPwd = userPwd;
        this.userNickName = userNickName;
        this.userImage = userImage;
        this.userSex = userSex;
        this.userBirthday = userBirthday;
        this.userTelnum = userTelnum;
        this.userEmail = userEmail;
        this.userOrder = userOrder;
        this.userAddress = userAddress;
        this.userCollect = userCollect;
        this.userShopCart = userShopCart;
        this.userCreationTime = userCreationTime;
        this.userStatus = userStatus;
        this.userRemark1 = userRemark1;
        this.userRemark2 = userRemark2;
        this.userRemark3 = userRemark3;
        this.userRemark4 = userRemark4;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd == null ? null : userPwd.trim();
    }

    public String getUserNickName() {
        return userNickName;
    }

    public void setUserNickName(String userNickName) {
        this.userNickName = userNickName == null ? null : userNickName.trim();
    }

    public String getUserImage() {
        return userImage;
    }

    public void setUserImage(String userImage) {
        this.userImage = userImage == null ? null : userImage.trim();
    }

    public Integer getUserSex() {
        return userSex;
    }

    public void setUserSex(Integer userSex) {
        this.userSex = userSex;
    }

    public String getUserBirthday() {
        return userBirthday;
    }

    public void setUserBirthday(String userBirthday) {
        this.userBirthday = userBirthday == null ? null : userBirthday.trim();
    }

    public String getUserTelnum() {
        return userTelnum;
    }

    public void setUserTelnum(String userTelnum) {
        this.userTelnum = userTelnum == null ? null : userTelnum.trim();
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }

    public String getUserOrder() {
        return userOrder;
    }

    public void setUserOrder(String userOrder) {
        this.userOrder = userOrder == null ? null : userOrder.trim();
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress == null ? null : userAddress.trim();
    }

    public String getUserCollect() {
        return userCollect;
    }

    public void setUserCollect(String userCollect) {
        this.userCollect = userCollect == null ? null : userCollect.trim();
    }

    public String getUserShopCart() {
        return userShopCart;
    }

    public void setUserShopCart(String userShopCart) {
        this.userShopCart = userShopCart == null ? null : userShopCart.trim();
    }

    public String getUserCreationTime() {
        return userCreationTime;
    }

    public void setUserCreationTime(String userCreationTime) {
        this.userCreationTime = userCreationTime == null ? null : userCreationTime.trim();
    }

    public Integer getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(Integer userStatus) {
        this.userStatus = userStatus;
    }

    public String getUserRemark1() {
        return userRemark1;
    }

    public void setUserRemark1(String userRemark1) {
        this.userRemark1 = userRemark1 == null ? null : userRemark1.trim();
    }

    public String getUserRemark2() {
        return userRemark2;
    }

    public void setUserRemark2(String userRemark2) {
        this.userRemark2 = userRemark2 == null ? null : userRemark2.trim();
    }

    public String getUserRemark3() {
        return userRemark3;
    }

    public void setUserRemark3(String userRemark3) {
        this.userRemark3 = userRemark3 == null ? null : userRemark3.trim();
    }

    public String getUserRemark4() {
        return userRemark4;
    }

    public void setUserRemark4(String userRemark4) {
        this.userRemark4 = userRemark4 == null ? null : userRemark4.trim();
    }
}