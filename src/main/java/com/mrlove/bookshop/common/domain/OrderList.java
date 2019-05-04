package com.mrlove.bookshop.common.domain;

import java.util.List;

public class OrderList {
    private Userorder userorder;
    private List<Userorder> userorders;

    public OrderList() {
    }

    public OrderList(Userorder userorder, List<Userorder> userorders) {
        this.userorder = userorder;
        this.userorders = userorders;
    }

    public Userorder getUserorder() {
        return userorder;
    }

    public void setUserorder(Userorder userorder) {
        this.userorder = userorder;
    }

    public List<Userorder> getUserorders() {
        return userorders;
    }

    public void setUserorders(List<Userorder> userorders) {
        this.userorders = userorders;
    }

    @Override
    public String toString() {
        return "OrderList{" +
                "userorder=" + userorder +
                ", userorders=" + userorders +
                '}';
    }
}
