package com.caifeng.function.admin.creditList.service;

import com.caifeng.arc.exception.BatchRollbackException;
import com.caifeng.function.admin.creditList.repository.CreditListRepositoryI;
import com.caifeng.function.admin.login.AdminUser;
import com.caifeng.function.support.log.LogContent;
import com.caifeng.function.support.log.repository.LogRepositoryI;
import com.caifeng.function.user.credit.Credit;
import com.google.common.base.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by shihanwen on 2017/4/30.
 */
@Service
public class CreditListService implements CreditListServiceI {
    @Autowired
    private CreditListRepositoryI creditListRepository;
    @Autowired
    private LogRepositoryI logRepository;

    @Override
    public Page<Credit> queryForPage(Credit credit, Pageable pageable) {
        return creditListRepository.selectForPage(credit, pageable);
    }

    @Override
    public Credit queryCredit(String creditListId) {
        return creditListRepository.select(creditListId);
    }

    @Override
    public Boolean remove(String creditListId, AdminUser logUser) {
        Credit credit = creditListRepository.select(creditListId);

        Optional<Credit> optional = Optional.fromNullable(credit);

        if (optional.isPresent()) {
            boolean tmp = creditListRepository.delete(creditListId);

            if (tmp) {
                LogContent logContent = new LogContent(logUser.getAdminUserName(), "删除贷款单,其ID为" + creditListId, 2, 2);
                logRepository.insertLog(logContent);
            }

            return tmp;
        }

        return false;
    }

    @Override
    public Boolean edit(Credit credit, AdminUser logUser) {
        boolean tmp = creditListRepository.update(credit);

        if (tmp) {
            LogContent logContent = new LogContent(logUser.getAdminUserName(), "编辑贷款单，其ID为" + credit.getCreditListId(), 2, 4);
            logRepository.insertLog(logContent);
        }

        return tmp;
    }

    @Override
    public List<Credit> serchForSearchExport(Credit credit, AdminUser logUser) {
        List<Credit> list = creditListRepository.selectForSearchExport(credit);

        if (list != null) {
            LogContent logContent = new LogContent(logUser.getAdminUserName(), "导出申请列表", 2, 5);
            logRepository.insertLog(logContent);
        }

        return list;
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = BatchRollbackException.class)
    @Override
    public Boolean batchPass(String batchIds, AdminUser logUser) throws BatchRollbackException {
        String[] courseIds = batchIds.split(",");
        int successSum = 0;
        Credit credit = new Credit();

        for (String courseId : courseIds) {
            credit.setCreditListId(courseId);
            credit.setListState(2);
            successSum += creditListRepository.update(credit) == true ? 1 : 0;
        }

        if (courseIds.length != successSum) {
            throw new BatchRollbackException();
        } else {
            LogContent logContent = new LogContent(logUser.getAdminUserName(), "批量通过审核贷款单，它们的ID为" + batchIds + "(以逗号隔开)", 2, 4);
            logRepository.insertLog(logContent);

            return true;
        }
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = BatchRollbackException.class)
    @Override
    public Boolean batchUnPass(String batchIds, AdminUser logUser) throws BatchRollbackException {
        String[] courseIds = batchIds.split(",");
        int successSum = 0;
        Credit credit = new Credit();

        for (String courseId : courseIds) {
            credit.setCreditListId(courseId);
            credit.setListState(3);
            successSum += creditListRepository.update(credit) == true ? 1 : 0;
        }

        if (courseIds.length != successSum) {
            throw new BatchRollbackException();
        } else {
            LogContent logContent = new LogContent(logUser.getAdminUserName(), "批量未通过审核贷款单，它们的ID为" + batchIds + "(以逗号隔开)", 2, 4);
            logRepository.insertLog(logContent);

            return true;
        }
    }

    @Override
    public List<Credit> serchForBatchExport(String batchIds, AdminUser logUser) throws BatchRollbackException {
        String[] courseIds = batchIds.split(",");
        int successSum = 0;
        Credit credit;
        List<Credit> list = new ArrayList<>();

        for (String courseId : courseIds) {
            credit = creditListRepository.select(courseId);
            successSum += credit != null ? 1 : 0;
            list.add(credit);
        }

        if (courseIds.length != successSum) {
            throw new BatchRollbackException();
        } else {
            LogContent logContent = new LogContent(logUser.getAdminUserName(), "批量导出贷款单，它们的ID为" + batchIds + "(以逗号隔开)", 2, 5);
            logRepository.insertLog(logContent);

            return list;
        }
    }
}
