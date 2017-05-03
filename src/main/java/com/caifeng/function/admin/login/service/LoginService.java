package com.caifeng.function.admin.login.service;

import com.caifeng.arc.utils.PasswordUtils;
import com.caifeng.function.admin.login.AdminUser;
import com.caifeng.function.admin.login.repository.LoginRepositoryI;
import com.caifeng.function.support.log.LogContent;
import com.caifeng.function.support.log.repository.LogRepositoryI;
import com.google.common.base.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by shihanwen on 2017/4/30.
 */
@Service
public class LoginService implements LoginServiceI {
    @Autowired
    LoginRepositoryI loginRepository;
    @Autowired
    private LogRepositoryI logRepository;

    @Override
    public AdminUser queryAdminUser(AdminUser user) {
        user.setAdminPassWord(PasswordUtils.encrypt(user.getAdminPassWord()));
        AdminUser loginUser = loginRepository.selectAdminUser(user);
        Optional<AdminUser> optional = Optional.fromNullable(loginUser);

        if (optional.isPresent()) {
            LogContent logContent = new LogContent(user.getAdminLoginName(), "登陆系统", 2, 5);
            logRepository.insertLog(logContent);
        }

        return loginUser;
    }

    @Override
    public AdminUser resetPassword(AdminUser adminUser) {
        adminUser.setAdminPassWord(PasswordUtils.encrypt(adminUser.getAdminPassWord()));
        AdminUser canLogin = loginRepository.selectAdminUser(adminUser);

        Optional<AdminUser> optional = Optional.fromNullable(canLogin);

        if (optional.isPresent()) {
            adminUser.setAdminPassWordNew(PasswordUtils.encrypt(adminUser.getAdminPassWordNew()));

            if (loginRepository.resetPassword(adminUser)) {
                LogContent logContent = new LogContent(adminUser.getAdminLoginName(), "更改密码", 2, 4);
                logRepository.insertLog(logContent);
                adminUser.setAdminPassWord(adminUser.getAdminPassWordNew());

                return loginRepository.selectAdminUser(adminUser);
            }
        }

        return null;
    }
}
