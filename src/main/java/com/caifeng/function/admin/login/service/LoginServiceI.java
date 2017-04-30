package com.caifeng.function.admin.login.service;

import com.caifeng.function.admin.login.AdminUser;

/**
 * Created by shihanwen on 2017/4/30.
 */
public interface LoginServiceI {
    AdminUser queryAdminUser(AdminUser user);
}
