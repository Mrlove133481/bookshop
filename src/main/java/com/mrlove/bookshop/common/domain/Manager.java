package com.mrlove.bookshop.common.domain;

public class Manager {
    private String managerId;

    private String managerName;

    private String managerPwd;

    private String managerStatus;

    private String managerCreationTime;

    private String managerRemark1;

    private String managerRemark2;

    public Manager() {
    }

    public Manager(String managerId, String managerName, String managerPwd, String managerStatus, String managerCreationTime, String managerRemark1, String managerRemark2) {
        this.managerId = managerId;
        this.managerName = managerName;
        this.managerPwd = managerPwd;
        this.managerStatus = managerStatus;
        this.managerCreationTime = managerCreationTime;
        this.managerRemark1 = managerRemark1;
        this.managerRemark2 = managerRemark2;
    }

    public String getManagerId() {
        return managerId;
    }

    public void setManagerId(String managerId) {
        this.managerId = managerId == null ? null : managerId.trim();
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName == null ? null : managerName.trim();
    }

    public String getManagerPwd() {
        return managerPwd;
    }

    public void setManagerPwd(String managerPwd) {
        this.managerPwd = managerPwd == null ? null : managerPwd.trim();
    }

    public String getManagerStatus() {
        return managerStatus;
    }

    public void setManagerStatus(String managerStatus) {
        this.managerStatus = managerStatus == null ? null : managerStatus.trim();
    }

    public String getManagerCreationTime() {
        return managerCreationTime;
    }

    public void setManagerCreationTime(String managerCreationTime) {
        this.managerCreationTime = managerCreationTime == null ? null : managerCreationTime.trim();
    }

    public String getManagerRemark1() {
        return managerRemark1;
    }

    public void setManagerRemark1(String managerRemark1) {
        this.managerRemark1 = managerRemark1 == null ? null : managerRemark1.trim();
    }

    public String getManagerRemark2() {
        return managerRemark2;
    }

    public void setManagerRemark2(String managerRemark2) {
        this.managerRemark2 = managerRemark2 == null ? null : managerRemark2.trim();
    }
}