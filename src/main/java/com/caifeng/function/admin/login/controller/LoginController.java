package com.caifeng.function.admin.login.controller;

import com.caifeng.arc.utils.ConstantFields;
import com.caifeng.function.admin.login.AdminUser;
import com.caifeng.function.admin.login.service.LoginServiceI;
import com.google.common.base.Optional;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

/**
 * Created by shihanwen on 2017/4/21.
 */
@Controller
@RequestMapping("/admin")
public class LoginController {
    @Autowired
    private LoginServiceI loginService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(HttpSession session, AdminUser user) {
        AdminUser adminUser = loginService.queryAdminUser(user);
        Optional<AdminUser> optional = Optional.fromNullable(adminUser);
        ModelAndView mav = new ModelAndView();

        if (!optional.isPresent()) {
            mav.addObject(ConstantFields.ERROR_MESSAGE_KEY, ConstantFields.USERNAME_PASS_ERROR);
            mav.setViewName("error/errorInfo");
        } else {
            session.setAttribute(ConstantFields.SESSION_ADMIN_KEY, adminUser);
            mav.setViewName("redirect:/admin/home.action");
        }

        return mav;
    }

    @RequestMapping(value = "/routePass", method = RequestMethod.GET)
    public ModelAndView routePass(HttpSession session) {
        AdminUser loginUser = (AdminUser) session.getAttribute(ConstantFields.SESSION_ADMIN_KEY);
        Optional<AdminUser> optional = Optional.fromNullable(loginUser);
        ModelAndView mav = new ModelAndView();

        if (optional.isPresent()) {
            mav.setViewName("admin/login/adminPassword");
        } else{
            mav.setViewName("admin/login/adminLogin");
        }

        return mav;
    }

    @RequestMapping(value = "/password", method = RequestMethod.POST)
    public ModelAndView password(AdminUser adminUser, HttpSession session) {
        ModelAndView mav = new ModelAndView("admin/login/adminLogin");
        AdminUser newUser = loginService.resetPassword(adminUser);
        Optional<AdminUser> optional = Optional.fromNullable(newUser);

        if (optional.isPresent()) {
            session.removeAttribute(ConstantFields.SESSION_ADMIN_KEY);

            return mav;
        }

        return new ModelAndView("redirect:/admin/routePass.action");
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute(ConstantFields.SESSION_ADMIN_KEY);

        return "admin/login/adminLogin";
    }

}
