package com.caifeng.function.admin.creditList.service;

import com.caifeng.function.admin.creditList.repository.CreditListRepositoryI;
import com.caifeng.function.user.credit.Credit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

/**
 * Created by shihanwen on 2017/4/30.
 */
@Service
public class CreditListService implements CreditListServiceI {
    @Autowired
    private CreditListRepositoryI creditListRepository;

    @Override
    public Page<Credit> queryForPage(Credit credit, Pageable pageable) {
        return creditListRepository.selectForPage(credit, pageable);
    }
}
