package com.caifeng.function.admin.home.controller;

import com.caifeng.arc.utils.ConstantFields;
import com.caifeng.function.admin.home.Home;
import com.caifeng.function.admin.home.service.HomeServiceI;
import com.caifeng.function.admin.login.AdminUser;
import com.google.common.base.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class HomeController {
    @Autowired
    private HomeServiceI homeService;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView routeLogin(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        Home home = homeService.selectNumsForHome();
        mav.addObject("home", home);
        mav.setViewName("admin/home/index");

        return mav;
    }
}
