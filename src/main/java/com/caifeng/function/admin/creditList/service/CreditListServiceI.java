package com.caifeng.function.admin.creditList.service;

import com.caifeng.arc.exception.BatchRollbackException;
import com.caifeng.function.admin.login.AdminUser;
import com.caifeng.function.user.credit.Credit;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;


/**
 * Created by shihanwen on 2017/4/30.
 */
public interface CreditListServiceI {

    Page<Credit> queryForPage(Credit credit, Pageable pageable);
    Credit queryCredit(String creditListId);
    Boolean remove(String creditListId, AdminUser logUser);
    Boolean edit(Credit credit, AdminUser logUser);
    List<Credit> serchForSearchExport(Credit credit, AdminUser logUser);
    Boolean batchPass(String batchIds, AdminUser logUser) throws BatchRollbackException;
    Boolean batchUnPass(String batchIds, AdminUser logUser) throws BatchRollbackException;
    List<Credit> serchForBatchExport(String batchIds, AdminUser logUser) throws BatchRollbackException;
    Boolean batchDelete(String batchIds, AdminUser logUser) throws BatchRollbackException;
}
