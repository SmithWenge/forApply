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

    @RequestMapping(value = "/routeFontColor", method = RequestMethod.GET)
    public String routeColor() {

        return "/admin/system/color";
    }

    @RequestMapping(value = "/routeFontStyle", method = RequestMethod.GET)
    public String routeFont() {

        return "/admin/system/font";
    }

    @RequestMapping(value = "/routeBackGround", method = RequestMethod.GET)
    public String routeBig() {

        return "/admin/system/grund";
    }

    @RequestMapping(value = "/routeJiange", method = RequestMethod.GET)
    public String routeJiange() {

        return "/admin/system/jiange";
    }

    @RequestMapping(value = "/backGroundColorDefault", method = RequestMethod.GET)
    public String backGroundColorDefault(HttpServletRequest req, RedirectAttributes redirectAttributes) {
        req.getSession().getServletContext().setAttribute(ConstantFields.SESSION_BACKGROUND_COLOR, ConstantFields.DEFAULT_BACKGROUND_SETTING);
        redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.CONFIG_SUCCESS_MESSAGE);

        return "/admin/system/grund";
    }

    @RequestMapping(value = "/fontStyleDefault", method = RequestMethod.GET)
    public String fontStyleDefault(HttpServletRequest req, RedirectAttributes redirectAttributes) {
        req.getSession().getServletContext().setAttribute(ConstantFields.SESSION_FONT_STYLE, ConstantFields.DEFAULT_FONT_STYLE_SETTING);

        redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.CONFIG_SUCCESS_MESSAGE);
        return "/admin/system/font";
    }

    @RequestMapping(value = "/fontColorDefault", method = RequestMethod.GET)
    public String fontColorDefault(HttpServletRequest req, RedirectAttributes redirectAttributes) {
        req.getSession().getServletContext().setAttribute(ConstantFields.SESSION_FONT_COLOR, ConstantFields.DEFAULT_FONT_COLOR_SETTING);

        redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.CONFIG_SUCCESS_MESSAGE);
        return "/admin/system/color";
    }

    @RequestMapping(value = "/jiangeColorDefault", method = RequestMethod.GET)
    public String jiangeColorDefault(HttpServletRequest req, RedirectAttributes redirectAttributes) {
        req.getSession().getServletContext().setAttribute(ConstantFields.SESSION_JIANGE_COLOR, ConstantFields.DEFAULT_JIANGE_SETTING);

        redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.CONFIG_SUCCESS_MESSAGE);
        return "/admin/system/jiange";
    }

    @RequestMapping(value = "/fontColorChange", method = RequestMethod.POST)
    public String fontChange(@RequestParam("configColor") String configColor,HttpServletRequest req, RedirectAttributes redirectAttributes) {
        ConstantFields.SAVE_FONT_COLOR_SETTING = configColor;

        req.getSession().getServletContext().setAttribute(ConstantFields.SESSION_FONT_COLOR, configColor);
        redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.CONFIG_SUCCESS_MESSAGE);
        return "/admin/system/color";

    }

    @RequestMapping(value = "/fontStyleChange", method = RequestMethod.POST)
    public String colorChange(@RequestParam("configFont") String configFont,HttpServletRequest req, RedirectAttributes redirectAttributes) {
        ConstantFields.SAVE_FONT_STYLE_SETTING = configFont;

        req.getSession().getServletContext().setAttribute(ConstantFields.SESSION_FONT_STYLE, configFont);
        redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.CONFIG_SUCCESS_MESSAGE);
        return "/admin/system/font";
    }

    @RequestMapping(value = "/backGroundColorChange", method = RequestMethod.POST)
    public String BigColorChange(@RequestParam("configColor") String configColor,HttpServletRequest req, RedirectAttributes redirectAttributes) {
        ConstantFields.SAVE_BACKGROUND_SETTING = configColor;

        req.getSession().getServletContext().setAttribute(ConstantFields.SESSION_BACKGROUND_COLOR, configColor);
        redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.CONFIG_SUCCESS_MESSAGE);
        return "/admin/system/grund";
    }

    @RequestMapping(value = "/jiangeColorChange", method = RequestMethod.POST)
    public String jiangeColorChange(@RequestParam("configColor") String configColor,HttpServletRequest req, RedirectAttributes redirectAttributes) {
        ConstantFields.SAVE_JIANGE_SETTING = configColor;

        req.getSession().getServletContext().setAttribute(ConstantFields.SESSION_JIANGE_COLOR, configColor);
        redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.CONFIG_SUCCESS_MESSAGE);
        return "/admin/system/jiange";
    }
}
