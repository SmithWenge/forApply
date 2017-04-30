package com.caifeng.function.user.credit.controller;

import com.caifeng.arc.utils.CheckDevicesUtils;
import com.caifeng.arc.utils.ConstantFields;
import com.caifeng.function.user.credit.Credit;
import com.caifeng.function.user.credit.service.CreditServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by shihanwen on 2017/4/30.
 */
@Controller
@RequestMapping("/user/credit")
public class CreditController {

    @Autowired
    private CreditServiceI service;

    @RequestMapping(value = "/routeAdd/{creditAmount}", method = RequestMethod.GET)
    public ModelAndView router(HttpServletRequest request, @PathVariable("creditAmount") String creditAmount) {
        ModelAndView mav = new ModelAndView();
        boolean isPhone = CheckDevicesUtils.isMobileDevice(request);
        if (creditAmount.equals(ConstantFields.ONE_THOUSAND) || creditAmount.equals(ConstantFields.TWO_THOUSAND) || creditAmount.equals(ConstantFields.THREE_THOUSAND) || creditAmount.equals(ConstantFields.FIVE_THOUSAND)) {
            mav.addObject("creditAmount", creditAmount);
            if (isPhone) {
                mav.setViewName("user/credit/appCredit");
            } else {
                mav.setViewName("user/credit/credit");
            }
        } else {
            mav.addObject(ConstantFields.ERROR_MESSAGE_KEY, ConstantFields.CREDIT_AMOUNT_ERROR_MESSAGE);
            if (isPhone) {
                mav.setViewName("error/appErrorInfo");
            } else {
                mav.setViewName("error/errorInfo");
            }
        }

        return mav;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(HttpServletRequest request, RedirectAttributes redirectAttributes, Credit credit) {
        boolean isPhone = CheckDevicesUtils.isMobileDevice(request);
        boolean ifAdd = service.add(credit);

        if (ifAdd) {
            if (isPhone) {
                return "error/appSuccessInfo";
            } else {
                return "error/successInfo";
            }
        } else {
            redirectAttributes.addFlashAttribute(ConstantFields.ERROR_MESSAGE_KEY, ConstantFields.ERROR_MESSAGE);
            if (isPhone) {
                return "redirect:error/appErrorInfo";
            } else {
                return "redirect:error/errorInfo";
            }
        }
    }
}
