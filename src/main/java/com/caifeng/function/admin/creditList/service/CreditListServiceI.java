package com.caifeng.function.admin.creditList.service;

import com.caifeng.function.user.credit.Credit;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


/**
 * Created by shihanwen on 2017/4/30.
 */
public interface CreditListServiceI {

    Page<Credit> queryForPage(Credit credit, Pageable pageable);
}
