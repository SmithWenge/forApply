package com.caifeng.function.admin.creditList.repository;

import com.caifeng.function.user.credit.Credit;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Created by shihanwen on 2017/4/30.
 */
public interface CreditListRepositoryI {

    Page<Credit> selectForPage(Credit credit, Pageable pageable);
    Credit select(String creditListId);
    Boolean delete(String creditListId);
    Boolean update(Credit credit);
    List<Credit> selectForSearchExport(Credit credit);
}
