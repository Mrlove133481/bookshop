package com.mrlove.bookshop.common.domain;

public class Pageinfo {
    private String pageinfoId;

    private String pageinfoName;

    private String pageinfoLocation;

    private String pageinfoCount;

    private String pageinfoImg;

    private String pageinfoInfo;

    private String pageinfoStatus;

    private String pageinfoCreationTime;

    private String pageinfoRemark1;

    private String pageinfoRemark2;

    public String getPageinfoId() {
        return pageinfoId;
    }

    public void setPageinfoId(String pageinfoId) {
        this.pageinfoId = pageinfoId == null ? null : pageinfoId.trim();
    }

    public String getPageinfoName() {
        return pageinfoName;
    }

    public void setPageinfoName(String pageinfoName) {
        this.pageinfoName = pageinfoName == null ? null : pageinfoName.trim();
    }

    public String getPageinfoLocation() {
        return pageinfoLocation;
    }

    public void setPageinfoLocation(String pageinfoLocation) {
        this.pageinfoLocation = pageinfoLocation == null ? null : pageinfoLocation.trim();
    }

    public String getPageinfoCount() {
        return pageinfoCount;
    }

    public void setPageinfoCount(String pageinfoCount) {
        this.pageinfoCount = pageinfoCount == null ? null : pageinfoCount.trim();
    }

    public String getPageinfoImg() {
        return pageinfoImg;
    }

    public void setPageinfoImg(String pageinfoImg) {
        this.pageinfoImg = pageinfoImg == null ? null : pageinfoImg.trim();
    }

    public String getPageinfoInfo() {
        return pageinfoInfo;
    }

    public void setPageinfoInfo(String pageinfoInfo) {
        this.pageinfoInfo = pageinfoInfo == null ? null : pageinfoInfo.trim();
    }

    public String getPageinfoStatus() {
        return pageinfoStatus;
    }

    public void setPageinfoStatus(String pageinfoStatus) {
        this.pageinfoStatus = pageinfoStatus == null ? null : pageinfoStatus.trim();
    }

    public String getPageinfoCreationTime() {
        return pageinfoCreationTime;
    }

    public void setPageinfoCreationTime(String pageinfoCreationTime) {
        this.pageinfoCreationTime = pageinfoCreationTime == null ? null : pageinfoCreationTime.trim();
    }

    public String getPageinfoRemark1() {
        return pageinfoRemark1;
    }

    public void setPageinfoRemark1(String pageinfoRemark1) {
        this.pageinfoRemark1 = pageinfoRemark1 == null ? null : pageinfoRemark1.trim();
    }

    public String getPageinfoRemark2() {
        return pageinfoRemark2;
    }

    public void setPageinfoRemark2(String pageinfoRemark2) {
        this.pageinfoRemark2 = pageinfoRemark2 == null ? null : pageinfoRemark2.trim();
    }
}