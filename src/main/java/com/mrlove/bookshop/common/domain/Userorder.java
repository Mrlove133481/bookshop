package com.mrlove.bookshop.common.domain;

public class Userorder {
    private String orderId;

    private String orderUserid;

    private String orderReceiverlocation;

    private String orderReceiverphone;

    private String orderReceiver;

    private String orderNumber;

    private String orderBookNumber;

    private String orderBookName;

    private String oderBookImage1;

    private String orderPrice;

    private String orderAmount;

    private String orderRefund;

    private String orderRefundStatus;

    private String orderRefundStartTime;

    private String orderRefundDisposeTime;

    private String orderRefundEndTime;

    private String orderSalesReturn;

    private String orderSalesReturnStatus;

    private String orderSalesReturnStartTime;

    private String orderSalesReturnEndTime;

    private String orderPaymentStatus;

    private String orderReceiveStatus;

    private String orderEvaluationLevel;

    private String orderEvalutionDescription;

    private String orderEvaluationImage;

    private String orderCreationTime;

    private String orderCreationBatch;

    private String orderStatus;

    private String orderRemark1;

    private String orderRemark2;

    public Userorder() {
    }

    public Userorder(String orderId, String orderUserid, String orderReceiverlocation, String orderReceiverphone, String orderReceiver, String orderNumber, String orderBookNumber, String orderBookName, String oderBookImage1, String orderPrice, String orderAmount, String orderRefund, String orderRefundStatus, String orderRefundStartTime, String orderRefundDisposeTime, String orderRefundEndTime, String orderSalesReturn, String orderSalesReturnStatus, String orderSalesReturnStartTime, String orderSalesReturnEndTime, String orderPaymentStatus, String orderReceiveStatus, String orderEvaluationLevel, String orderEvalutionDescription, String orderEvaluationImage, String orderCreationTime, String orderCreationBatch, String orderStatus, String orderRemark1, String orderRemark2) {
        this.orderId = orderId;
        this.orderUserid = orderUserid;
        this.orderReceiverlocation = orderReceiverlocation;
        this.orderReceiverphone = orderReceiverphone;
        this.orderReceiver = orderReceiver;
        this.orderNumber = orderNumber;
        this.orderBookNumber = orderBookNumber;
        this.orderBookName = orderBookName;
        this.oderBookImage1 = oderBookImage1;
        this.orderPrice = orderPrice;
        this.orderAmount = orderAmount;
        this.orderRefund = orderRefund;
        this.orderRefundStatus = orderRefundStatus;
        this.orderRefundStartTime = orderRefundStartTime;
        this.orderRefundDisposeTime = orderRefundDisposeTime;
        this.orderRefundEndTime = orderRefundEndTime;
        this.orderSalesReturn = orderSalesReturn;
        this.orderSalesReturnStatus = orderSalesReturnStatus;
        this.orderSalesReturnStartTime = orderSalesReturnStartTime;
        this.orderSalesReturnEndTime = orderSalesReturnEndTime;
        this.orderPaymentStatus = orderPaymentStatus;
        this.orderReceiveStatus = orderReceiveStatus;
        this.orderEvaluationLevel = orderEvaluationLevel;
        this.orderEvalutionDescription = orderEvalutionDescription;
        this.orderEvaluationImage = orderEvaluationImage;
        this.orderCreationTime = orderCreationTime;
        this.orderCreationBatch = orderCreationBatch;
        this.orderStatus = orderStatus;
        this.orderRemark1 = orderRemark1;
        this.orderRemark2 = orderRemark2;
    }

    @Override
    public String toString() {
        return "Userorder{" +
                "orderId='" + orderId + '\'' +
                ", orderUserid='" + orderUserid + '\'' +
                ", orderReceiverlocation='" + orderReceiverlocation + '\'' +
                ", orderReceiverphone='" + orderReceiverphone + '\'' +
                ", orderReceiver='" + orderReceiver + '\'' +
                ", orderNumber='" + orderNumber + '\'' +
                ", orderBookNumber='" + orderBookNumber + '\'' +
                ", orderBookName='" + orderBookName + '\'' +
                ", oderBookImage1='" + oderBookImage1 + '\'' +
                ", orderPrice='" + orderPrice + '\'' +
                ", orderAmount='" + orderAmount + '\'' +
                ", orderRefund='" + orderRefund + '\'' +
                ", orderRefundStatus='" + orderRefundStatus + '\'' +
                ", orderRefundStartTime='" + orderRefundStartTime + '\'' +
                ", orderRefundDisposeTime='" + orderRefundDisposeTime + '\'' +
                ", orderRefundEndTime='" + orderRefundEndTime + '\'' +
                ", orderSalesReturn='" + orderSalesReturn + '\'' +
                ", orderSalesReturnStatus='" + orderSalesReturnStatus + '\'' +
                ", orderSalesReturnStartTime='" + orderSalesReturnStartTime + '\'' +
                ", orderSalesReturnEndTime='" + orderSalesReturnEndTime + '\'' +
                ", orderPaymentStatus='" + orderPaymentStatus + '\'' +
                ", orderReceiveStatus='" + orderReceiveStatus + '\'' +
                ", orderEvaluationLevel='" + orderEvaluationLevel + '\'' +
                ", orderEvalutionDescription='" + orderEvalutionDescription + '\'' +
                ", orderEvaluationImage='" + orderEvaluationImage + '\'' +
                ", orderCreationTime='" + orderCreationTime + '\'' +
                ", orderCreationBatch='" + orderCreationBatch + '\'' +
                ", orderStatus='" + orderStatus + '\'' +
                ", orderRemark1='" + orderRemark1 + '\'' +
                ", orderRemark2='" + orderRemark2 + '\'' +
                '}';
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getOrderUserid() {
        return orderUserid;
    }

    public void setOrderUserid(String orderUserid) {
        this.orderUserid = orderUserid == null ? null : orderUserid.trim();
    }

    public String getOrderReceiverlocation() {
        return orderReceiverlocation;
    }

    public void setOrderReceiverlocation(String orderReceiverlocation) {
        this.orderReceiverlocation = orderReceiverlocation == null ? null : orderReceiverlocation.trim();
    }

    public String getOrderReceiverphone() {
        return orderReceiverphone;
    }

    public void setOrderReceiverphone(String orderReceiverphone) {
        this.orderReceiverphone = orderReceiverphone == null ? null : orderReceiverphone.trim();
    }

    public String getOrderReceiver() {
        return orderReceiver;
    }

    public void setOrderReceiver(String orderReceiver) {
        this.orderReceiver = orderReceiver == null ? null : orderReceiver.trim();
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber == null ? null : orderNumber.trim();
    }

    public String getOrderBookNumber() {
        return orderBookNumber;
    }

    public void setOrderBookNumber(String orderBookNumber) {
        this.orderBookNumber = orderBookNumber == null ? null : orderBookNumber.trim();
    }

    public String getOrderBookName() {
        return orderBookName;
    }

    public void setOrderBookName(String orderBookName) {
        this.orderBookName = orderBookName == null ? null : orderBookName.trim();
    }

    public String getOderBookImage1() {
        return oderBookImage1;
    }

    public void setOderBookImage1(String oderBookImage1) {
        this.oderBookImage1 = oderBookImage1 == null ? null : oderBookImage1.trim();
    }

    public String getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(String orderPrice) {
        this.orderPrice = orderPrice == null ? null : orderPrice.trim();
    }

    public String getOrderAmount() {
        return orderAmount;
    }

    public void setOrderAmount(String orderAmount) {
        this.orderAmount = orderAmount == null ? null : orderAmount.trim();
    }

    public String getOrderRefund() {
        return orderRefund;
    }

    public void setOrderRefund(String orderRefund) {
        this.orderRefund = orderRefund == null ? null : orderRefund.trim();
    }

    public String getOrderRefundStatus() {
        return orderRefundStatus;
    }

    public void setOrderRefundStatus(String orderRefundStatus) {
        this.orderRefundStatus = orderRefundStatus == null ? null : orderRefundStatus.trim();
    }

    public String getOrderRefundStartTime() {
        return orderRefundStartTime;
    }

    public void setOrderRefundStartTime(String orderRefundStartTime) {
        this.orderRefundStartTime = orderRefundStartTime == null ? null : orderRefundStartTime.trim();
    }

    public String getOrderRefundDisposeTime() {
        return orderRefundDisposeTime;
    }

    public void setOrderRefundDisposeTime(String orderRefundDisposeTime) {
        this.orderRefundDisposeTime = orderRefundDisposeTime == null ? null : orderRefundDisposeTime.trim();
    }

    public String getOrderRefundEndTime() {
        return orderRefundEndTime;
    }

    public void setOrderRefundEndTime(String orderRefundEndTime) {
        this.orderRefundEndTime = orderRefundEndTime == null ? null : orderRefundEndTime.trim();
    }

    public String getOrderSalesReturn() {
        return orderSalesReturn;
    }

    public void setOrderSalesReturn(String orderSalesReturn) {
        this.orderSalesReturn = orderSalesReturn == null ? null : orderSalesReturn.trim();
    }

    public String getOrderSalesReturnStatus() {
        return orderSalesReturnStatus;
    }

    public void setOrderSalesReturnStatus(String orderSalesReturnStatus) {
        this.orderSalesReturnStatus = orderSalesReturnStatus == null ? null : orderSalesReturnStatus.trim();
    }

    public String getOrderSalesReturnStartTime() {
        return orderSalesReturnStartTime;
    }

    public void setOrderSalesReturnStartTime(String orderSalesReturnStartTime) {
        this.orderSalesReturnStartTime = orderSalesReturnStartTime == null ? null : orderSalesReturnStartTime.trim();
    }

    public String getOrderSalesReturnEndTime() {
        return orderSalesReturnEndTime;
    }

    public void setOrderSalesReturnEndTime(String orderSalesReturnEndTime) {
        this.orderSalesReturnEndTime = orderSalesReturnEndTime == null ? null : orderSalesReturnEndTime.trim();
    }

    public String getOrderPaymentStatus() {
        return orderPaymentStatus;
    }

    public void setOrderPaymentStatus(String orderPaymentStatus) {
        this.orderPaymentStatus = orderPaymentStatus == null ? null : orderPaymentStatus.trim();
    }

    public String getOrderReceiveStatus() {
        return orderReceiveStatus;
    }

    public void setOrderReceiveStatus(String orderReceiveStatus) {
        this.orderReceiveStatus = orderReceiveStatus == null ? null : orderReceiveStatus.trim();
    }

    public String getOrderEvaluationLevel() {
        return orderEvaluationLevel;
    }

    public void setOrderEvaluationLevel(String orderEvaluationLevel) {
        this.orderEvaluationLevel = orderEvaluationLevel == null ? null : orderEvaluationLevel.trim();
    }

    public String getOrderEvalutionDescription() {
        return orderEvalutionDescription;
    }

    public void setOrderEvalutionDescription(String orderEvalutionDescription) {
        this.orderEvalutionDescription = orderEvalutionDescription == null ? null : orderEvalutionDescription.trim();
    }

    public String getOrderEvaluationImage() {
        return orderEvaluationImage;
    }

    public void setOrderEvaluationImage(String orderEvaluationImage) {
        this.orderEvaluationImage = orderEvaluationImage == null ? null : orderEvaluationImage.trim();
    }

    public String getOrderCreationTime() {
        return orderCreationTime;
    }

    public void setOrderCreationTime(String orderCreationTime) {
        this.orderCreationTime = orderCreationTime == null ? null : orderCreationTime.trim();
    }

    public String getOrderCreationBatch() {
        return orderCreationBatch;
    }

    public void setOrderCreationBatch(String orderCreationBatch) {
        this.orderCreationBatch = orderCreationBatch == null ? null : orderCreationBatch.trim();
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus == null ? null : orderStatus.trim();
    }

    public String getOrderRemark1() {
        return orderRemark1;
    }

    public void setOrderRemark1(String orderRemark1) {
        this.orderRemark1 = orderRemark1 == null ? null : orderRemark1.trim();
    }

    public String getOrderRemark2() {
        return orderRemark2;
    }

    public void setOrderRemark2(String orderRemark2) {
        this.orderRemark2 = orderRemark2 == null ? null : orderRemark2.trim();
    }
}