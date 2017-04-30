package com.caifeng.function.user.credit.service;

import com.caifeng.function.admin.creditList.repository.CreditListRepositoryI;
import com.caifeng.function.support.log.LogContent;
import com.caifeng.function.support.log.repository.LogRepositoryI;
import com.caifeng.function.user.credit.Credit;
import com.caifeng.function.user.credit.repository.CreditRepositoryI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by shihanwen on 2017/4/30.
 */
@Service
public class CreditService implements CreditServiceI {
    @Autowired
    private LogRepositoryI logRepository;
    @Autowired
    private CreditRepositoryI repository;

    @Override
    public Boolean add(Credit credit) {
        if (repository.insert(credit)) {
            LogContent logContent = new LogContent(credit.getUserName(), "提交申请贷款" + credit.getCreditAmount(), 1, 3);
            logRepository.insertLog(logContent);

            return true;
        }else {

            return false;
        }
    }
}
