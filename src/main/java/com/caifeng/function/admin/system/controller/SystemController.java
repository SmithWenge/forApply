package com.caifeng.function.admin.system.controller;

import com.caifeng.arc.utils.ConstantFields;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by shihanwen on 2017/5/6.
 */
@Controller
@RequestMapping("/admin/system")
public class SystemController {

    @RequestMapping(value = "/routeColor", method = RequestMethod.GET)
    public String routeColor() {

        return "/admin/system/color";
    }

    @RequestMapping(value = "/routeFont", method = RequestMethod.GET)
    public String routeFont() {

        return "/admin/system/font";
    }

    @RequestMapping(value = "/routeBig", method = RequestMethod.GET)
    public String routeBig() {

        return "/admin/system/grund";
    }

    @RequestMapping(value = "/colorDefault", method = RequestMethod.GET)
    public String colorDefault(HttpServletRequest req, RedirectAttributes redirectAttributes) {
        req.getSession().getServletContext().setAttribute(ConstantFields.SESSION_BG_COLOR, ConstantFields.DEFAULT_BACKGROUND_COLOR_SETTING);
        redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.CONFIG_SUCCESS_MESSAGE);

        return "/admin/system/color";
    }

    @RequestMapping(value = "/fontDefault", method = RequestMethod.GET)
    public String fontDefault(HttpServletRequest req, RedirectAttributes redirectAttributes) {
        req.getSession().getServletContext().setAttribute(ConstantFields.SESSION_BG_FONT, ConstantFields.DEFAULT_BACKGROUND_FONT_SETTING);

        redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.CONFIG_SUCCESS_MESSAGE);
        return "/admin/system/font";
    }

    @RequestMapping(value = "/bigColorDefault", method = RequestMethod.GET)
    public String bigColorDefault(HttpServletRequest req, RedirectAttributes redirectAttributes) {
        req.getSession().getServletContext().setAttribute(ConstantFields.SESSION_BG_BIG_COLOR, ConstantFields.DEFAULT_BACKGROUND_SETTING);

        redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.CONFIG_SUCCESS_MESSAGE);
        return "/admin/system/font";
    }

    @RequestMapping(value = "/colorChange", method = RequestMethod.POST)
    public String fontChange(@RequestParam("configColor") String configColor,HttpServletRequest req, RedirectAttributes redirectAttributes) {
        ConstantFields.SAVE_BACKGROUND_COLOR_SETTING = configColor;

        req.getSession().getServletContext().setAttribute(ConstantFields.SESSION_BG_COLOR, configColor);
        redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.CONFIG_SUCCESS_MESSAGE);
        return "/admin/system/color";

    }

    @RequestMapping(value = "/fontChange", method = RequestMethod.POST)
    public String colorChange(@RequestParam("configFont") String configFont,HttpServletRequest req, RedirectAttributes redirectAttributes) {
        ConstantFields.SAVE_BACKGROUND_FONT_SETTING = configFont;

        req.getSession().getServletContext().setAttribute(ConstantFields.SESSION_BG_FONT, configFont);
        redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.CONFIG_SUCCESS_MESSAGE);
        return "/admin/system/font";
    }

    @RequestMapping(value = "/BigColorChange", method = RequestMethod.POST)
    public String BigColorChange(@RequestParam("configBigColor") String configBigColor,HttpServletRequest req, RedirectAttributes redirectAttributes) {
        ConstantFields.SAVE_BACKGROUND_SETTING = configBigColor;

        req.getSession().getServletContext().setAttribute(ConstantFields.SESSION_BG_BIG_COLOR, configBigColor);
        redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.CONFIG_SUCCESS_MESSAGE);
        return "/admin/system/grund";
    }
}
