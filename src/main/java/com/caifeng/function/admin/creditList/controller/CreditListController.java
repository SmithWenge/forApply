package com.caifeng.function.admin.creditList.controller;

import com.caifeng.arc.excel.output.Excel;
import com.caifeng.arc.excel.output.ExcelFactory;
import com.caifeng.arc.excel.output.mapper.CreditExcelMapper;
import com.caifeng.arc.exception.BatchRollbackException;
import com.caifeng.arc.utils.ConstantFields;
import com.caifeng.function.admin.creditList.service.CreditListServiceI;
import com.caifeng.function.admin.login.AdminUser;
import com.caifeng.function.user.credit.Credit;
import com.google.common.base.Optional;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.Arrays;
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

    @RequestMapping(value = "/searchOutput",method = RequestMethod.POST)
    public void creditListExport(HttpServletResponse response, Credit credit, HttpSession session) {
        AdminUser logUser = (AdminUser)session.getAttribute(ConstantFields.SESSION_ADMIN_KEY);

        List<Credit> records = creditListService.serchForSearchExport(credit, logUser);
        ExcelFactory<Credit> factory = new ExcelFactory<Credit>();
        File file = new File("贷款申请列表（检索导出）.xls");

        try {
            WritableWorkbook workbook = factory.createExcel(new FileOutputStream(file),
                    new Excel("申请列表（检索）", 0), Arrays.asList("序号", "姓名", "性别", "年龄", "电话", "QQ", "金额", "审核进度", "单位全称", "职务", "单位电话", "芝麻信用分", "花呗额度", "借呗额度", "信用卡额度", "借贷宝已借金额", "借贷时间"), records, new CreditExcelMapper());
            workbook.write();
            workbook.close();

            response.setContentType("application/x-export");
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Disposition", "attachment; filename=" + java.net.URLEncoder.encode(file.getName(), "UTF-8"));
            response.setHeader("Content-Length", String.valueOf(file.length()));
            int length = 0;
            byte[] buffer = new byte[1024];
            FileInputStream fis = new FileInputStream(file);
            OutputStream os = response.getOutputStream();
            while (-1 != (length = fis.read(buffer, 0, buffer.length))) {
                os.write(buffer, 0, length);
            }
            fis.close();
            os.flush();
            os.close();
        } catch (RowsExceededException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (WriteException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            file.delete();
        }
    }

    @RequestMapping(value = "/allOutput",method = RequestMethod.GET)
    public void creditListAllExport(HttpServletResponse response, Credit credit, HttpSession session) {
        AdminUser logUser = (AdminUser)session.getAttribute(ConstantFields.SESSION_ADMIN_KEY);

        List<Credit> records = creditListService.serchForSearchExport(credit, logUser);
        ExcelFactory<Credit> factory = new ExcelFactory<Credit>();
        File file = new File("贷款申请列表（导出所有）.xls");

        try {
            WritableWorkbook workbook = factory.createExcel(new FileOutputStream(file),
                    new Excel("申请列表", 0), Arrays.asList("序号", "姓名", "性别", "年龄", "电话", "QQ", "金额", "审核进度", "单位全称", "职务", "单位电话", "芝麻信用分", "花呗额度", "借呗额度", "信用卡额度", "借贷宝已借金额", "借贷时间"), records, new CreditExcelMapper());
            workbook.write();
            workbook.close();

            response.setContentType("application/x-export");
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Disposition", "attachment; filename=" + java.net.URLEncoder.encode(file.getName(), "UTF-8"));
            response.setHeader("Content-Length", String.valueOf(file.length()));
            int length = 0;
            byte[] buffer = new byte[1024];
            FileInputStream fis = new FileInputStream(file);
            OutputStream os = response.getOutputStream();
            while (-1 != (length = fis.read(buffer, 0, buffer.length))) {
                os.write(buffer, 0, length);
            }
            fis.close();
            os.flush();
            os.close();
        } catch (RowsExceededException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (WriteException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            file.delete();
        }
    }

    @RequestMapping(value = "/batch/pass")
    public String batchPass(@RequestParam("batchId") String batchIds, HttpSession session, RedirectAttributes redirectAttributes) {
        AdminUser logUser = (AdminUser) session.getAttribute(ConstantFields.SESSION_ADMIN_KEY);

        try {
            if (creditListService.batchPass(batchIds, logUser)) {

                redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.OPERATION_SUCCESS_MESSAGE);
                return "redirect:/admin/creditList/routePage.action";
            }
        } catch (BatchRollbackException e) {
            e.printStackTrace();

            redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.OPERATION_FAILURE_MESSAGE);
            return "redirect:/admin/creditList/routePage.action";
        }

        redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.OPERATION_FAILURE_MESSAGE);
        return "redirect:/admin/creditList/routePage.action";
    }

    @RequestMapping(value = "/batch/unpass")
    public String batchUnPass(@RequestParam("batchId") String batchIds, HttpSession session, RedirectAttributes redirectAttributes) {
        AdminUser logUser = (AdminUser) session.getAttribute(ConstantFields.SESSION_ADMIN_KEY);

        try {
            if (creditListService.batchUnPass(batchIds, logUser)) {

                redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.OPERATION_SUCCESS_MESSAGE);
                return "redirect:/admin/creditList/routePage.action";
            }
        } catch (BatchRollbackException e) {
            e.printStackTrace();

            redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.OPERATION_FAILURE_MESSAGE);
            return "redirect:/admin/creditList/routePage.action";
        }

        redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.OPERATION_FAILURE_MESSAGE);
        return "redirect:/admin/creditList/routePage.action";
    }

    @RequestMapping(value = "/batch/delete")
    public String batchDelete(@RequestParam("batchId") String batchIds, HttpSession session, RedirectAttributes redirectAttributes) {
        AdminUser logUser = (AdminUser) session.getAttribute(ConstantFields.SESSION_ADMIN_KEY);

        try {
            if (creditListService.batchDelete(batchIds, logUser)) {

                redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.OPERATION_SUCCESS_MESSAGE);
                return "redirect:/admin/creditList/routePage.action";
            }
        } catch (BatchRollbackException e) {
            e.printStackTrace();

            redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.OPERATION_FAILURE_MESSAGE);
            return "redirect:/admin/creditList/routePage.action";
        }

        redirectAttributes.addFlashAttribute(ConstantFields.OPERATION_MESSAGE, ConstantFields.OPERATION_FAILURE_MESSAGE);
        return "redirect:/admin/creditList/routePage.action";
    }

    @RequestMapping(value = "/batch/output",method = RequestMethod.POST)
    public void batchOutput(HttpServletResponse response, @RequestParam("batchId") String batchIds, HttpSession session) throws BatchRollbackException{
        AdminUser logUser = (AdminUser)session.getAttribute(ConstantFields.SESSION_ADMIN_KEY);

        List<Credit> records = creditListService.serchForBatchExport(batchIds, logUser);
        ExcelFactory<Credit> factory = new ExcelFactory<Credit>();
        File file = new File("贷款申请列表（选中导出）.xls");

        try {
            WritableWorkbook workbook = factory.createExcel(new FileOutputStream(file),
                    new Excel("申请列表", 0), Arrays.asList("序号", "姓名", "性别", "年龄", "电话", "QQ", "金额", "审核进度", "单位全称", "职务", "单位电话", "芝麻信用分", "花呗额度", "借呗额度", "信用卡额度", "借贷宝已借金额", "借贷时间"), records, new CreditExcelMapper());
            workbook.write();
            workbook.close();

            response.setContentType("application/x-export");
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Disposition", "attachment; filename=" + java.net.URLEncoder.encode(file.getName(), "UTF-8"));
            response.setHeader("Content-Length", String.valueOf(file.length()));
            int length = 0;
            byte[] buffer = new byte[1024];
            FileInputStream fis = new FileInputStream(file);
            OutputStream os = response.getOutputStream();
            while (-1 != (length = fis.read(buffer, 0, buffer.length))) {
                os.write(buffer, 0, length);
            }
            fis.close();
            os.flush();
            os.close();
        } catch (RowsExceededException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (WriteException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            file.delete();
        }
    }
}
