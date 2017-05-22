package com.caifeng.arc.excel.output.mapper;

import com.caifeng.arc.excel.output.ExcelMapper;
import com.caifeng.function.user.credit.Credit;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableSheet;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

/**
 * Created by shihanwen on 2017/5/5.
 */
public class CreditExcelMapper implements ExcelMapper<Credit> {

    @Override
    public void mapToExcel(WritableSheet sheet, Credit credit, WritableCellFormat wcf, int rowNum) {
        try {
            sheet.addCell(new Label(0, rowNum, credit.getCreditListId()));
            sheet.addCell(new Label(1, rowNum, credit.getUserName()));
            sheet.addCell(new Label(2, rowNum, credit.getUserSexStr()));
            sheet.addCell(new Label(3, rowNum, credit.getUserAge()));
            sheet.addCell(new Label(4, rowNum, credit.getUserTel()));
            sheet.addCell(new Label(5, rowNum, credit.getQq()));
            sheet.addCell(new Label(6, rowNum, credit.getCreditAmount()));
            sheet.addCell(new Label(7, rowNum, credit.getListStateStr()));
            sheet.addCell(new Label(8, rowNum, credit.getWorkUnit()));
            sheet.addCell(new Label(9, rowNum, credit.getUserPost()));
            sheet.addCell(new Label(10, rowNum, credit.getUnitTel()));
            sheet.addCell(new Label(11, rowNum, credit.getZhimaNum()));
            sheet.addCell(new Label(12, rowNum, credit.getHuabeiLimit()));
            sheet.addCell(new Label(13, rowNum, credit.getJiebeiLimit()));
            sheet.addCell(new Label(14, rowNum, credit.getCreditCardLimit()));
            sheet.addCell(new Label(15, rowNum, credit.getJiedaibaoLimit()));
            sheet.addCell(new Label(16, rowNum, credit.getListTimeStr()));

        } catch (RowsExceededException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (WriteException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
