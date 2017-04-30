package com.caifeng.function.admin.login.service;

import com.caifeng.arc.utils.PasswordUtils;
import com.caifeng.function.admin.login.AdminUser;
import com.caifeng.function.admin.login.repository.LoginRepositoryI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by shihanwen on 2017/4/30.
 */
@Service
public class LoginService implements LoginServiceI {
    @Autowired
    LoginRepositoryI loginRepository;

    @Override
    public AdminUser queryAdminUser(AdminUser user) {
        user.setAdminPassWord(PasswordUtils.encrypt(user.getAdminPassWord()));
        return loginRepository.selectAdminUser(user);
    }
}
