package com.caifeng.function.admin.creditList.service;

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
    public List<Credit> serchForSearchExport(Credit credit) {
        return creditListRepository.selectForSearchExport(credit);
    }
}
