package com.mrlove.bookshop.common.domain;

public class Shopcart {
    private String shopcartId;

    private String shopcartUser;

    private String shopcartBookNumber;

    private String shopcartStatus;

    private String shopcartCreationTime;

    private String shopcartRemark1;

    private String shopcartRemark2;

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
}