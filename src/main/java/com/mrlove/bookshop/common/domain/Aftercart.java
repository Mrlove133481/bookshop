package com.mrlove.bookshop.common.domain;

public class Aftercart {

    private String shopcartId;

    private String shopcartUser;

    private String shopcartBookNumber;

    private String shopcartCount;

    private String shopcartStatus;

    private String shopcartCreationTime;

    private String shopcartRemark1;

    private String shopcartRemark2;

    private User user;

    private Books bookss;

    public Aftercart() {
    }

    public Aftercart(String shopcartId, String shopcartUser, String shopcartBookNumber, String shopcartCount, String shopcartStatus, String shopcartCreationTime, String shopcartRemark1, String shopcartRemark2, User user, Books bookss) {
        this.shopcartId = shopcartId;
        this.shopcartUser = shopcartUser;
        this.shopcartBookNumber = shopcartBookNumber;
        this.shopcartCount = shopcartCount;
        this.shopcartStatus = shopcartStatus;
        this.shopcartCreationTime = shopcartCreationTime;
        this.shopcartRemark1 = shopcartRemark1;
        this.shopcartRemark2 = shopcartRemark2;
        this.user = user;
        this.bookss = bookss;
    }

    public String getShopcartId() {
        return shopcartId;
    }

    public void setShopcartId(String shopcartId) {
        this.shopcartId = shopcartId;
    }

    public String getShopcartUser() {
        return shopcartUser;
    }

    public void setShopcartUser(String shopcartUser) {
        this.shopcartUser = shopcartUser;
    }

    public String getShopcartBookNumber() {
        return shopcartBookNumber;
    }

    public void setShopcartBookNumber(String shopcartBookNumber) {
        this.shopcartBookNumber = shopcartBookNumber;
    }

    public String getShopcartCount() {
        return shopcartCount;
    }

    public void setShopcartCount(String shopcartCount) {
        this.shopcartCount = shopcartCount;
    }

    public String getShopcartStatus() {
        return shopcartStatus;
    }

    public void setShopcartStatus(String shopcartStatus) {
        this.shopcartStatus = shopcartStatus;
    }

    public String getShopcartCreationTime() {
        return shopcartCreationTime;
    }

    public void setShopcartCreationTime(String shopcartCreationTime) {
        this.shopcartCreationTime = shopcartCreationTime;
    }

    public String getShopcartRemark1() {
        return shopcartRemark1;
    }

    public void setShopcartRemark1(String shopcartRemark1) {
        this.shopcartRemark1 = shopcartRemark1;
    }

    public String getShopcartRemark2() {
        return shopcartRemark2;
    }

    public void setShopcartRemark2(String shopcartRemark2) {
        this.shopcartRemark2 = shopcartRemark2;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Books getBookss() {
        return bookss;
    }

    public void setBookss(Books bookss) {
        this.bookss = bookss;
    }

    @Override
    public String toString() {
        return "Aftercart{" +
                "shopcartId='" + shopcartId + '\'' +
                ", shopcartUser='" + shopcartUser + '\'' +
                ", shopcartBookNumber='" + shopcartBookNumber + '\'' +
                ", shopcartCount='" + shopcartCount + '\'' +
                ", shopcartStatus='" + shopcartStatus + '\'' +
                ", shopcartCreationTime='" + shopcartCreationTime + '\'' +
                ", shopcartRemark1='" + shopcartRemark1 + '\'' +
                ", shopcartRemark2='" + shopcartRemark2 + '\'' +
                ", user=" + user +
                ", bookss=" + bookss +
                '}';
    }
}
