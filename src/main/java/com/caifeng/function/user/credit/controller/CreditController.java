package com.caifeng.function.user.credit.controller;

import com.caifeng.arc.utils.CheckDevicesUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by shihanwen on 2017/4/30.
 */
@Controller
@RequestMapping("/user/credit")
public class CreditController {

    @RequestMapping(value = "/routeAdd/{creditAmount}", method = RequestMethod.GET)
    public ModelAndView router(HttpServletRequest request, @PathVariable("creditAmount") String creditAmount) {
        boolean isPhone = CheckDevicesUtils.isMobileDevice(request);
        ModelAndView mav = new ModelAndView();
        mav.addObject("creditAmount", creditAmount);

        if (isPhone) {
            mav.setViewName("user/credit/appCredit");
        } else {
            mav.setViewName("user/credit/credit");
        }

        return mav;
    }
}
