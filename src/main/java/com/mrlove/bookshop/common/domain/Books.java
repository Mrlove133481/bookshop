package com.mrlove.bookshop.common.domain;

public class Books {
    private String bookId;

    private String bookNumber;

    private String bookName;

    private String bookImage1;

    private String bookImage2;

    private String bookImage3;

    private String bookOriginalPrice;

    private String bookPromotionPrice;

    private String bookCost;

    private String bookClazz;

    private String bookSubclazz;

    private String bookMonthlySales;

    private String bookTotalSales;

    private String bookAuthor;

    private String bookPress;

    private String bookPublicationYear;

    private String bookPlotSummary;

    private String bookBiography;

    private String bookCatalog;

    private String bookMediaComments;

    private String bookUserComments;

    private String bookInventory;

    private String bookStatus;

    private String bookCreationTime;

    private String bookRemark1;

    private String bookRemark2;

    public Books() {
    }

    public Books(String bookId, String bookNumber, String bookName, String bookImage1, String bookImage2, String bookImage3, String bookOriginalPrice, String bookPromotionPrice, String bookCost, String bookClazz, String bookSubclazz, String bookMonthlySales, String bookTotalSales, String bookAuthor, String bookPress, String bookPublicationYear, String bookPlotSummary, String bookBiography, String bookCatalog, String bookMediaComments, String bookUserComments, String bookInventory, String bookStatus, String bookCreationTime, String bookRemark1, String bookRemark2) {
        this.bookId = bookId;
        this.bookNumber = bookNumber;
        this.bookName = bookName;
        this.bookImage1 = bookImage1;
        this.bookImage2 = bookImage2;
        this.bookImage3 = bookImage3;
        this.bookOriginalPrice = bookOriginalPrice;
        this.bookPromotionPrice = bookPromotionPrice;
        this.bookCost = bookCost;
        this.bookClazz = bookClazz;
        this.bookSubclazz = bookSubclazz;
        this.bookMonthlySales = bookMonthlySales;
        this.bookTotalSales = bookTotalSales;
        this.bookAuthor = bookAuthor;
        this.bookPress = bookPress;
        this.bookPublicationYear = bookPublicationYear;
        this.bookPlotSummary = bookPlotSummary;
        this.bookBiography = bookBiography;
        this.bookCatalog = bookCatalog;
        this.bookMediaComments = bookMediaComments;
        this.bookUserComments = bookUserComments;
        this.bookInventory = bookInventory;
        this.bookStatus = bookStatus;
        this.bookCreationTime = bookCreationTime;
        this.bookRemark1 = bookRemark1;
        this.bookRemark2 = bookRemark2;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId == null ? null : bookId.trim();
    }

    public String getBookNumber() {
        return bookNumber;
    }

    public void setBookNumber(String bookNumber) {
        this.bookNumber = bookNumber == null ? null : bookNumber.trim();
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName == null ? null : bookName.trim();
    }

    public String getBookImage1() {
        return bookImage1;
    }

    public void setBookImage1(String bookImage1) {
        this.bookImage1 = bookImage1 == null ? null : bookImage1.trim();
    }

    public String getBookImage2() {
        return bookImage2;
    }

    public void setBookImage2(String bookImage2) {
        this.bookImage2 = bookImage2 == null ? null : bookImage2.trim();
    }

    public String getBookImage3() {
        return bookImage3;
    }

    public void setBookImage3(String bookImage3) {
        this.bookImage3 = bookImage3 == null ? null : bookImage3.trim();
    }

    public String getBookOriginalPrice() {
        return bookOriginalPrice;
    }

    public void setBookOriginalPrice(String bookOriginalPrice) {
        this.bookOriginalPrice = bookOriginalPrice == null ? null : bookOriginalPrice.trim();
    }

    public String getBookPromotionPrice() {
        return bookPromotionPrice;
    }

    public void setBookPromotionPrice(String bookPromotionPrice) {
        this.bookPromotionPrice = bookPromotionPrice == null ? null : bookPromotionPrice.trim();
    }

    public String getBookCost() {
        return bookCost;
    }

    public void setBookCost(String bookCost) {
        this.bookCost = bookCost == null ? null : bookCost.trim();
    }

    public String getBookClazz() {
        return bookClazz;
    }

    public void setBookClazz(String bookClazz) {
        this.bookClazz = bookClazz == null ? null : bookClazz.trim();
    }

    public String getBookSubclazz() {
        return bookSubclazz;
    }

    public void setBookSubclazz(String bookSubclazz) {
        this.bookSubclazz = bookSubclazz == null ? null : bookSubclazz.trim();
    }

    public String getBookMonthlySales() {
        return bookMonthlySales;
    }

    public void setBookMonthlySales(String bookMonthlySales) {
        this.bookMonthlySales = bookMonthlySales == null ? null : bookMonthlySales.trim();
    }

    public String getBookTotalSales() {
        return bookTotalSales;
    }

    public void setBookTotalSales(String bookTotalSales) {
        this.bookTotalSales = bookTotalSales == null ? null : bookTotalSales.trim();
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor == null ? null : bookAuthor.trim();
    }

    public String getBookPress() {
        return bookPress;
    }

    public void setBookPress(String bookPress) {
        this.bookPress = bookPress == null ? null : bookPress.trim();
    }

    public String getBookPublicationYear() {
        return bookPublicationYear;
    }

    public void setBookPublicationYear(String bookPublicationYear) {
        this.bookPublicationYear = bookPublicationYear == null ? null : bookPublicationYear.trim();
    }

    public String getBookPlotSummary() {
        return bookPlotSummary;
    }

    public void setBookPlotSummary(String bookPlotSummary) {
        this.bookPlotSummary = bookPlotSummary == null ? null : bookPlotSummary.trim();
    }

    public String getBookBiography() {
        return bookBiography;
    }

    public void setBookBiography(String bookBiography) {
        this.bookBiography = bookBiography == null ? null : bookBiography.trim();
    }

    public String getBookCatalog() {
        return bookCatalog;
    }

    public void setBookCatalog(String bookCatalog) {
        this.bookCatalog = bookCatalog == null ? null : bookCatalog.trim();
    }

    public String getBookMediaComments() {
        return bookMediaComments;
    }

    public void setBookMediaComments(String bookMediaComments) {
        this.bookMediaComments = bookMediaComments == null ? null : bookMediaComments.trim();
    }

    public String getBookUserComments() {
        return bookUserComments;
    }

    public void setBookUserComments(String bookUserComments) {
        this.bookUserComments = bookUserComments == null ? null : bookUserComments.trim();
    }

    public String getBookInventory() {
        return bookInventory;
    }

    public void setBookInventory(String bookInventory) {
        this.bookInventory = bookInventory == null ? null : bookInventory.trim();
    }

    public String getBookStatus() {
        return bookStatus;
    }

    public void setBookStatus(String bookStatus) {
        this.bookStatus = bookStatus == null ? null : bookStatus.trim();
    }

    public String getBookCreationTime() {
        return bookCreationTime;
    }

    public void setBookCreationTime(String bookCreationTime) {
        this.bookCreationTime = bookCreationTime == null ? null : bookCreationTime.trim();
    }

    public String getBookRemark1() {
        return bookRemark1;
    }

    public void setBookRemark1(String bookRemark1) {
        this.bookRemark1 = bookRemark1 == null ? null : bookRemark1.trim();
    }

    public String getBookRemark2() {
        return bookRemark2;
    }

    public void setBookRemark2(String bookRemark2) {
        this.bookRemark2 = bookRemark2 == null ? null : bookRemark2.trim();
    }
}