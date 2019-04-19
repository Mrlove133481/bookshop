package com.mrlove.bookshop.common.domain;

import java.util.List;

public class Shopcart {
    private String shopcartId;

    private String shopcartUser;

    private String shopcartBookNumber;

    private String shopcartCount;

    private String shopcartStatus;

    private String shopcartCreationTime;

    private String shopcartRemark1;

    private String shopcartRemark2;

    private User user;


    private List< Books> books;


    public List<Books> getBooks() {
        return books;
    }

    public void setBooks(List<Books> books) {
        this.books = books;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getShopcartId() {
        return shopcartId;
    }

    public void setShopcartId(String shopcartId) {
        this.shopcartId = shopcartId == null ? null : shopcartId.trim();
    }

    public String getShopcartUser() {
        return shopcartUser;
    }

    public void setShopcartUser(String shopcartUser) {
        this.shopcartUser = shopcartUser == null ? null : shopcartUser.trim();
    }

    public String getShopcartBookNumber() {
        return shopcartBookNumber;
    }

    public void setShopcartBookNumber(String shopcartBookNumber) {
        this.shopcartBookNumber = shopcartBookNumber == null ? null : shopcartBookNumber.trim();
    }

    public String getShopcartCount() {
        return shopcartCount;
    }

    public void setShopcartCount(String shopcartCount) {
        this.shopcartCount = shopcartCount == null ? null : shopcartCount.trim();
    }

    public String getShopcartStatus() {
        return shopcartStatus;
    }

    public void setShopcartStatus(String shopcartStatus) {
        this.shopcartStatus = shopcartStatus == null ? null : shopcartStatus.trim();
    }

    public String getShopcartCreationTime() {
        return shopcartCreationTime;
    }

    public void setShopcartCreationTime(String shopcartCreationTime) {
        this.shopcartCreationTime = shopcartCreationTime == null ? null : shopcartCreationTime.trim();
    }

    public String getShopcartRemark1() {
        return shopcartRemark1;
    }

    public void setShopcartRemark1(String shopcartRemark1) {
        this.shopcartRemark1 = shopcartRemark1 == null ? null : shopcartRemark1.trim();
    }

    public String getShopcartRemark2() {
        return shopcartRemark2;
    }

    public void setShopcartRemark2(String shopcartRemark2) {
        this.shopcartRemark2 = shopcartRemark2 == null ? null : shopcartRemark2.trim();
    }

    public Shopcart() {
    }

    public Shopcart(String shopcartId, String shopcartUser, String shopcartBookNumber, String shopcartCount, String shopcartStatus, String shopcartCreationTime, String shopcartRemark1, String shopcartRemark2, User user, List<Books> books) {
        this.shopcartId = shopcartId;
        this.shopcartUser = shopcartUser;
        this.shopcartBookNumber = shopcartBookNumber;
        this.shopcartCount = shopcartCount;
        this.shopcartStatus = shopcartStatus;
        this.shopcartCreationTime = shopcartCreationTime;
        this.shopcartRemark1 = shopcartRemark1;
        this.shopcartRemark2 = shopcartRemark2;
        this.user = user;
        this.books = books;
    }

    @Override
    public String toString() {
        return "Shopcart{" +
                "shopcartId='" + shopcartId + '\'' +
                ", shopcartUser='" + shopcartUser + '\'' +
                ", shopcartBookNumber='" + shopcartBookNumber + '\'' +
                ", shopcartCount='" + shopcartCount + '\'' +
                ", shopcartStatus='" + shopcartStatus + '\'' +
                ", shopcartCreationTime='" + shopcartCreationTime + '\'' +
                ", shopcartRemark1='" + shopcartRemark1 + '\'' +
                ", shopcartRemark2='" + shopcartRemark2 + '\'' +
                ", user=" + user +
                ", books=" + books +
                '}';
    }


}