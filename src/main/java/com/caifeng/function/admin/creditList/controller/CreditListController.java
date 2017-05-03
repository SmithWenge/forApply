package com.caifeng.function.admin.creditList.controller;

import com.caifeng.arc.utils.ConstantFields;
import com.caifeng.function.admin.creditList.service.CreditListServiceI;
import com.caifeng.function.admin.login.AdminUser;
import com.caifeng.function.user.credit.Credit;
import com.google.common.base.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by shihanwen on 2017/4/30.
 */
@Controller
@RequestMapping("/admin/creditList")
public class CreditListController {
    @Autowired
    private CreditListServiceI creditListService;

    @RequestMapping(value = "/page", method = RequestMethod.GET)
    public ModelAndView routeList(@PageableDefault(value = ConstantFields.DEFAULT_PAGE_SIZE)
                                      Pageable pageable, Credit credit, HttpSession session) {
        Credit searchCredit = (Credit) session.getAttribute(ConstantFields.SESSION_CREDIT_SEARCH_KEY);
        Optional<Credit> optional = Optional.fromNullable(searchCredit);
        ModelAndView mav = new ModelAndView("admin/creditList/list");

        if (optional.isPresent()) {
            credit = searchCredit;
        }
        Page<Credit> page = creditListService.queryForPage(credit, pageable);
        mav.addObject("page", page);

        return mav;
    }

    @RequestMapping(value = "/routePage", method = RequestMethod.GET)
    public ModelAndView showFirstPage(HttpSession session) {
        session.removeAttribute(ConstantFields.SESSION_CREDIT_SEARCH_KEY);

        ModelAndView mav = new ModelAndView("admin/creditList/list");
        Page<Credit> users = creditListService.queryForPage(new Credit(), new PageRequest(0, ConstantFields.DEFAULT_PAGE_SIZE));
        mav.addObject(ConstantFields.PAGE_KEY, users);

        return mav;
    }

    @RequestMapping(value = "/pageSearch")
    public ModelAndView searchStudent(@PageableDefault(value = ConstantFields.DEFAULT_PAGE_SIZE) Pageable pageable,
                                      Credit credit, HttpSession session) {
        session.setAttribute(ConstantFields.SESSION_CREDIT_SEARCH_KEY, credit);

        ModelAndView mav = new ModelAndView("admin/creditList/list");
        Page<Credit> page = creditListService.queryForPage(credit, pageable);
        mav.addObject(ConstantFields.PAGE_KEY, page);

        return mav;
    }
}
