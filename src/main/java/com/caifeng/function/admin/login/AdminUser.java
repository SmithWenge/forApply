package com.caifeng.function.admin.login;

import com.caifeng.arc.Entry;

public class AdminUser extends Entry {
    private String adminUserName;
    private String adminPassWord;
    private String adminLoginName;
    private String adminId;
    private String adminUserTel;

    public void setAdminUserName(String adminUserName) {
        this.adminUserName = adminUserName;
    }

    public void setAdminPassWord(String adminPassWord) {
        this.adminPassWord = adminPassWord;
    }

    public void setAdminLoginName(String adminLoginName) {
        this.adminLoginName = adminLoginName;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public void setAdminUserTel(String adminUserTel) {
        this.adminUserTel = adminUserTel;
    }

    public String getAdminUserName() {
        return adminUserName;
    }

    public String getAdminPassWord() {
        return adminPassWord;
    }

    public String getAdminLoginName() {
        return adminLoginName;
    }

    public String getAdminId() {
        return adminId;
    }

    public String getAdminUserTel() {
        return adminUserTel;
    }
}
