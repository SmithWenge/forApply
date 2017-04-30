package com.caifeng.function.admin.login.repository;

import com.caifeng.function.admin.login.AdminUser;

/**
 * Created by shihanwen on 2017/4/30.
 */
public interface LoginRepositoryI {
    AdminUser selectAdminUser(AdminUser user);
}
