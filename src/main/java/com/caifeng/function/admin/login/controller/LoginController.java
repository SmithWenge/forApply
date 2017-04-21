package com.caifeng.function.admin.login.controller;

import com.caifeng.arc.utils.ConstantFields;
import com.caifeng.function.admin.login.AdminUser;
import com.google.common.base.Optional;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * Created by wenge on 2017/4/21.
 */
@Controller
@RequestMapping("/admin")
public class LoginController {

    @RequestMapping(value = "/routeLogin", method = RequestMethod.GET)
    public String routeLogin(HttpSession session) {
        AdminUser loginUser = (AdminUser) session.getAttribute(ConstantFields.SESSION_ADMIN_KEY);
        Optional<AdminUser> optional = Optional.fromNullable(loginUser);
        if (optional.isPresent()) {

            return "redirect:/admin/home/index.action";
        }

        return "admin/login/adminLogin";
    }

}
