package com.caifeng.function.user.credit;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by shihanwen on 2017/4/30.
 */
public class Credit {

    private String creditListId;
    private String creditAmount;
    private String userName;
    private String userTel;
    private int userSex;
    private String userAge;
    private String workUnit; //工作单位
    private String userPost; //工作岗位
    private String unitTel; //单位电话
    private String zhimaNum; //芝麻信用积分
    private String huabeiLimit; //花呗额度
    private String jiebeiLimit; //借呗额度
    private String creditCardLimit; //信用卡额度
    private String jiedaibaoLimit; //借贷宝额度
    private int listState;
    private Date listTime;
    private Date listDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date listStartDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date listStopDate;
    private String listDateStr;
    private String listTimeStr;

    public Date getListStartDate() {
        return listStartDate;
    }

    public void setListStartDate(Date listStartDate) {
        this.listStartDate = listStartDate;
    }

    public Date getListStopDate() {
        return listStopDate;
    }

    public void setListStopDate(Date listStopDate) {
        this.listStopDate = listStopDate;
    }

    public String getListTimeStr() {
        return listTimeStr;
    }

    public void setListTimeStr(String listTimeStr) {
        this.listTimeStr = listTimeStr;
    }

    public String getListDateStr() {
        return listDateStr;
    }

    public void setListDateStr(String listDateStr) {
        this.listDateStr = listDateStr;
    }

    public Date getListDate() {
        return listDate;
    }

    public void setListDate(Date listDate) {
        this.listDate = listDate;
    }

    public Date getListTime() {
        return listTime;
    }

    public void setListTime(Date listTime) {
        this.listTime = listTime;
    }

    public int getListState() {
        return listState;
    }

    public void setListState(int listState) {
        this.listState = listState;
    }

    public void setCreditListId(String creditListId) {
        this.creditListId = creditListId;
    }

    public void setCreditAmount(String creditAmount) {
        this.creditAmount = creditAmount;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel;
    }

    public void setUserSex(int userSex) {
        this.userSex = userSex;
    }

    public void setUserAge(String userAge) {
        this.userAge = userAge;
    }

    public void setWorkUnit(String workUnit) {
        this.workUnit = workUnit;
    }

    public void setUserPost(String userPost) {
        this.userPost = userPost;
    }

    public void setUnitTel(String unitTel) {
        this.unitTel = unitTel;
    }

    public void setZhimaNum(String zhimaNum) {
        this.zhimaNum = zhimaNum;
    }

    public void setHuabeiLimit(String huabeiLimit) {
        this.huabeiLimit = huabeiLimit;
    }

    public void setJiebeiLimit(String jiebeiLimit) {
        this.jiebeiLimit = jiebeiLimit;
    }

    public void setCreditCardLimit(String creditCardLimit) {
        this.creditCardLimit = creditCardLimit;
    }

    public void setJiedaibaoLimit(String jiedaibaoLimit) {
        this.jiedaibaoLimit = jiedaibaoLimit;
    }

    public String getCreditListId() {
        return creditListId;
    }

    public String getCreditAmount() {
        return creditAmount;
    }

    public String getUserName() {
        return userName;
    }

    public String getUserTel() {
        return userTel;
    }

    public int getUserSex() {
        return userSex;
    }

    public String getUserAge() {
        return userAge;
    }

    public String getWorkUnit() {
        return workUnit;
    }

    public String getUserPost() {
        return userPost;
    }

    public String getUnitTel() {
        return unitTel;
    }

    public String getZhimaNum() {
        return zhimaNum;
    }

    public String getHuabeiLimit() {
        return huabeiLimit;
    }

    public String getJiebeiLimit() {
        return jiebeiLimit;
    }

    public String getCreditCardLimit() {
        return creditCardLimit;
    }

    public String getJiedaibaoLimit() {
        return jiedaibaoLimit;
    }
}
