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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

    @RequestMapping(value = "/routeDetail/{creditListId}", method = RequestMethod.GET)
    public ModelAndView routeDetail(@PathVariable("creditListId") String creditListId, HttpSession session) {
        ModelAndView mav = new ModelAndView("admin/creditList/detail");
        Credit credit = creditListService.queryCredit(creditListId);
        mav.addObject("credit", credit);

        return mav;
    }

    @RequestMapping(value = "/routeEdit/{creditListId}", method = RequestMethod.GET)
    public ModelAndView routeEdit(@PathVariable("creditListId") String creditListId, HttpSession session) {
        ModelAndView mav = new ModelAndView("admin/creditList/edit");
        Credit credit = creditListService.queryCredit(creditListId);
        mav.addObject("credit", credit);

        return mav;
    }

    @RequestMapping(value = "/delete/{creditListId}", method = RequestMethod.GET)
    public String routeDetail(@PathVariable("creditListId") String creditListId, HttpSession session, RedirectAttributes redirectAttributes) {
        AdminUser logUser = (AdminUser)session.getAttribute(ConstantFields.SESSION_ADMIN_KEY);

        Boolean tmp = creditListService.remove(creditListId, logUser);
        if (tmp) {

            redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.OPERATION_SUCCESS_MESSAGE);
            return "redirect:/admin/creditList/routePage.action";
        }

        redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.OPERATION_FAILURE_MESSAGE);
        return "redirect:/admin/creditList/routePage.action";
    }

    @RequestMapping(value = "/edit")
    public String edit(Credit credit, HttpSession session,RedirectAttributes redirectAttributes) {
        AdminUser logUser = (AdminUser)session.getAttribute(ConstantFields.SESSION_ADMIN_KEY);

        Boolean tmp = creditListService.edit(credit, logUser);
        if (tmp) {

            redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.OPERATION_SUCCESS_MESSAGE);
            return "redirect:/admin/creditList/routePage.action";
        }

        redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.OPERATION_FAILURE_MESSAGE);
        return "redirect:/admin/creditList/routeEdit/" + credit.getCreditListId() + ".action";
    }
}
