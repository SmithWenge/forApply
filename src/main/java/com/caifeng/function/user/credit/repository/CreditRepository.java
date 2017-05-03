package com.caifeng.function.user.credit.repository;

import com.caifeng.arc.utils.PrimaryKeyUtil;
import com.caifeng.function.user.credit.Credit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 * Created by shihanwen on 2017/4/30.
 */
@Repository
public class CreditRepository implements CreditRepositoryI {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public Boolean insert(Credit credit) {
        String sql = "INSERT INTO apply_creditlist (creditListId, creditAmount, userName, userTel, userSex, userAge, workUnit, userPost, unitTel, zhimaNum, huabeiLimit, jiebeiLimit, creditCardLimit, jiedaibaoLimit, listState, listTime, listDate) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Object[] args = {
                PrimaryKeyUtil.uuidPrimaryKey(),
                credit.getCreditAmount(),
                credit.getUserName(),
                credit.getUserTel(),
                credit.getUserSex(),
                credit.getUserAge(),
                credit.getWorkUnit(),
                credit.getUserPost(),
                credit.getUnitTel(),
                credit.getZhimaNum(),
                credit.getHuabeiLimit(),
                credit.getJiebeiLimit(),
                credit.getCreditCardLimit(),
                credit.getJiedaibaoLimit(),
                credit.getListState(),
                credit.getListTime(),
                credit.getListDate()
        };

        return jdbcTemplate.update(sql,args) == 1 ? true:false;
    }
}
