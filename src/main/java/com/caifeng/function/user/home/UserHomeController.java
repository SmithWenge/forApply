package com.caifeng.function.user.home;

import com.caifeng.arc.utils.CheckDevicesUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by shihanwen on 2017/4/30.
 */

@Controller
@RequestMapping("/user")
public class UserHomeController {

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String router(HttpServletRequest request) {
        boolean isPhone = CheckDevicesUtils.isMobileDevice(request);
        if (isPhone) {

            return "user/credit/appIndex";
        } else {

            return "user/credit/index";
        }
    }
}
