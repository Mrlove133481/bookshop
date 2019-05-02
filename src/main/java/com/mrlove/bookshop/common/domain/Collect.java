package com.mrlove.bookshop.common.domain;

public class Collect {
    private String collectId;

    private String collectUser;

    private String collectBookNumber;

    private String collectStatus;

    private String collectCreationTime;

    private String collectRemark1;

    private String collectRemark2;

    private Books books;

    public Collect() {
    }

    public Collect(String collectId, String collectUser, String collectBookNumber, String collectStatus, String collectCreationTime, String collectRemark1, String collectRemark2) {
        this.collectId = collectId;
        this.collectUser = collectUser;
        this.collectBookNumber = collectBookNumber;
        this.collectStatus = collectStatus;
        this.collectCreationTime = collectCreationTime;
        this.collectRemark1 = collectRemark1;
        this.collectRemark2 = collectRemark2;
    }

    public Books getBooks() {
        return books;
    }

    public void setBooks(Books books) {
        this.books = books;
    }

    public String getCollectId() {
        return collectId;
    }

    public void setCollectId(String collectId) {
        this.collectId = collectId == null ? null : collectId.trim();
    }

    public String getCollectUser() {
        return collectUser;
    }

    public void setCollectUser(String collectUser) {
        this.collectUser = collectUser == null ? null : collectUser.trim();
    }

    public String getCollectBookNumber() {
        return collectBookNumber;
    }

    public void setCollectBookNumber(String collectBookNumber) {
        this.collectBookNumber = collectBookNumber == null ? null : collectBookNumber.trim();
    }

    public String getCollectStatus() {
        return collectStatus;
    }

    public void setCollectStatus(String collectStatus) {
        this.collectStatus = collectStatus == null ? null : collectStatus.trim();
    }

    public String getCollectCreationTime() {
        return collectCreationTime;
    }

    public void setCollectCreationTime(String collectCreationTime) {
        this.collectCreationTime = collectCreationTime == null ? null : collectCreationTime.trim();
    }

    public String getCollectRemark1() {
        return collectRemark1;
    }

    public void setCollectRemark1(String collectRemark1) {
        this.collectRemark1 = collectRemark1 == null ? null : collectRemark1.trim();
    }

    public String getCollectRemark2() {
        return collectRemark2;
    }

    public void setCollectRemark2(String collectRemark2) {
        this.collectRemark2 = collectRemark2 == null ? null : collectRemark2.trim();
    }
}