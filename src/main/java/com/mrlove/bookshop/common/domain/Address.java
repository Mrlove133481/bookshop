package com.mrlove.bookshop.common.domain;

public class Address {
    private String addressId;

    private String addressUser;

    private String addressReceiver;

    private String addressTelnum;

    private String addressProvince;

    private String addressCity;

    private String addressTown;

    private String addressLocation;

    private String addressDefault;

    private String addressStatus;

    private String addressCreationTime;

    private String addressRemark1;

    private String addressRemark2;

    public Address() {
    }

    public Address(String addressId, String addressUser, String addressReceiver, String addressTelnum, String addressProvince, String addressCity, String addressTown, String addressLocation, String addressDefault, String addressStatus, String addressCreationTime, String addressRemark1, String addressRemark2) {
        this.addressId = addressId;
        this.addressUser = addressUser;
        this.addressReceiver = addressReceiver;
        this.addressTelnum = addressTelnum;
        this.addressProvince = addressProvince;
        this.addressCity = addressCity;
        this.addressTown = addressTown;
        this.addressLocation = addressLocation;
        this.addressDefault = addressDefault;
        this.addressStatus = addressStatus;
        this.addressCreationTime = addressCreationTime;
        this.addressRemark1 = addressRemark1;
        this.addressRemark2 = addressRemark2;
    }

    public String getAddressId() {
        return addressId;
    }

    public void setAddressId(String addressId) {
        this.addressId = addressId == null ? null : addressId.trim();
    }

    public String getAddressUser() {
        return addressUser;
    }

    public void setAddressUser(String addressUser) {
        this.addressUser = addressUser == null ? null : addressUser.trim();
    }

    public String getAddressReceiver() {
        return addressReceiver;
    }

    public void setAddressReceiver(String addressReceiver) {
        this.addressReceiver = addressReceiver == null ? null : addressReceiver.trim();
    }

    public String getAddressTelnum() {
        return addressTelnum;
    }

    public void setAddressTelnum(String addressTelnum) {
        this.addressTelnum = addressTelnum == null ? null : addressTelnum.trim();
    }

    public String getAddressProvince() {
        return addressProvince;
    }

    public void setAddressProvince(String addressProvince) {
        this.addressProvince = addressProvince == null ? null : addressProvince.trim();
    }

    public String getAddressCity() {
        return addressCity;
    }

    public void setAddressCity(String addressCity) {
        this.addressCity = addressCity == null ? null : addressCity.trim();
    }

    public String getAddressTown() {
        return addressTown;
    }

    public void setAddressTown(String addressTown) {
        this.addressTown = addressTown == null ? null : addressTown.trim();
    }

    public String getAddressLocation() {
        return addressLocation;
    }

    public void setAddressLocation(String addressLocation) {
        this.addressLocation = addressLocation == null ? null : addressLocation.trim();
    }

    public String getAddressDefault() {
        return addressDefault;
    }

    public void setAddressDefault(String addressDefault) {
        this.addressDefault = addressDefault == null ? null : addressDefault.trim();
    }

    public String getAddressStatus() {
        return addressStatus;
    }

    public void setAddressStatus(String addressStatus) {
        this.addressStatus = addressStatus == null ? null : addressStatus.trim();
    }

    public String getAddressCreationTime() {
        return addressCreationTime;
    }

    public void setAddressCreationTime(String addressCreationTime) {
        this.addressCreationTime = addressCreationTime == null ? null : addressCreationTime.trim();
    }

    public String getAddressRemark1() {
        return addressRemark1;
    }

    public void setAddressRemark1(String addressRemark1) {
        this.addressRemark1 = addressRemark1 == null ? null : addressRemark1.trim();
    }

    public String getAddressRemark2() {
        return addressRemark2;
    }

    public void setAddressRemark2(String addressRemark2) {
        this.addressRemark2 = addressRemark2 == null ? null : addressRemark2.trim();
    }
}