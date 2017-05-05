package com.caifeng.function.admin.creditList.repository;

import com.caifeng.function.support.dictionary.IDictionaryManager;
import com.caifeng.function.support.dictionary.impl.DefaultDictionaryManager;
import com.caifeng.function.support.utils.RepositoryUtils;
import com.caifeng.function.user.credit.Credit;
import com.google.common.base.Optional;
import com.google.common.base.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import sun.jdbc.odbc.JdbcOdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by shihanwen on 2017/4/30.
 */
@Repository
public class CreditListRepository implements CreditListRepositoryI {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private RepositoryUtils repositoryUtils;

    @Override
    public Page<Credit> selectForPage(Credit credit, Pageable pageable) {
        StringBuilder sql = new StringBuilder("SELECT creditListId, creditAmount, userName, userTel, userSex, userAge, workUnit, userPost, unitTel, zhimaNum, huabeiLimit, jiebeiLimit, creditCardLimit, jiedaibaoLimit, listState, listDate, listTime FROM apply_creditlist WHERE deleteFlag = 0");
        List<Object> list = new ArrayList<Object>();

        Optional<Credit> optional = Optional.fromNullable(credit);
        if (optional.isPresent()) {
            if (credit.getListState() > 0) {
                sql.append(" AND listState = ?");
                list.add(credit.getListState());
            }
            if (credit.getListStartDate() != null) {
                sql.append(" AND listDate >= ?");
                list.add(credit.getListStartDate());
            }
            if (credit.getListStopDate() != null) {
                sql.append(" AND listDate <= ?");
                list.add(credit.getListStopDate());
            }
            if (!Strings.isNullOrEmpty(credit.getCreditAmount()) && !credit.getCreditAmount().equals("1234")) {
                sql.append(" AND creditAmount = ?");
                list.add(credit.getCreditAmount());
            }
        }

        Object[] args = list.toArray();

        sql.append(" ORDER BY listTime DESC");

        try {

            return repositoryUtils.select4Page(sql.toString(), pageable, args, new SelectForPageRowMapper());
        } catch (Exception e) {

            return null;
        }
    }

    class SelectForPageRowMapper implements RowMapper<Credit> {

        @Override
        public Credit mapRow(ResultSet resultSet, int rowNum) throws SQLException {
            Credit credit = new Credit();
            IDictionaryManager dictionaryManager = DefaultDictionaryManager.getInstance();
            credit.setCreditListId(resultSet.getString("creditListId"));
            credit.setCreditAmount(resultSet.getString("creditAmount"));
            credit.setUserName(resultSet.getString("userName"));
            credit.setUserTel(resultSet.getString("userTel"));
            credit.setUserAge(resultSet.getString("userAge"));
            credit.setUserPost(resultSet.getString("userPost"));
            credit.setZhimaNum(resultSet.getString("zhimaNum"));
            credit.setHuabeiLimit(resultSet.getString("huabeiLimit"));
            credit.setListDateStr(resultSet.getString("listDate"));
            credit.setListTimeStr(resultSet.getString("listTime"));

            int userSex = resultSet.getInt("userSex");
            int listState = resultSet.getInt("listState");
            String unitTel = resultSet.getString("unitTel");
            String workUnit = resultSet.getString("workUnit");
            String jiebeiLimit = resultSet.getString("jiebeiLimit");
            String creditCardLimit = resultSet.getString("creditCardLimit");
            String jiedaibaoLimit = resultSet.getString("jiedaibaoLimit");

            credit.setUserSex(userSex);
            credit.setListState(listState);
            credit.setUnitTel(Strings.isNullOrEmpty(workUnit) ? "无" : workUnit);
            credit.setWorkUnit(Strings.isNullOrEmpty(unitTel) ? "无" : unitTel);
            credit.setJiebeiLimit(Strings.isNullOrEmpty(jiebeiLimit) ? "无" : jiebeiLimit);
            credit.setCreditCardLimit(Strings.isNullOrEmpty(creditCardLimit) ? "无" : creditCardLimit);
            credit.setJiedaibaoLimit(Strings.isNullOrEmpty(jiedaibaoLimit) ? "无" : jiedaibaoLimit);

            credit.setUserSexStr(dictionaryManager.dictionary(userSex, "userSex").getItemValue());
            credit.setListStateStr(dictionaryManager.dictionary(listState, "listState").getItemValue());
            return credit;
        }
    }


    @Override
    public Credit select(String creditListId) {
        String sql = "SELECT creditListId, creditAmount, userName, userTel, userSex, userAge, workUnit, userPost, unitTel, zhimaNum, huabeiLimit, jiebeiLimit, creditCardLimit, jiedaibaoLimit, listState, listDate, listTime FROM apply_creditlist WHERE deleteFlag = 0 AND creditListId = ?";
        Object[] args = {
                creditListId
        };

        try {

            return jdbcTemplate.queryForObject(sql, args, new SelectForPageRowMapper());
        } catch (Exception e) {

            return null;
        }
    }

    @Override
    public Boolean delete(String creditListId) {
        String sql = "UPDATE apply_creditlist SET deleteFlag = 1 WHERE creditListId = ?";
        Object[] args = {
                creditListId
        };

        return jdbcTemplate.update(sql, args) == 1;
    }

    @Override
    public Boolean update(Credit credit) {
        String sql = "UPDATE apply_creditlist SET listState = ? WHERE creditListId = ?";
        Object[] args = {
                credit.getListState(),
                credit.getCreditListId()
        };

        return jdbcTemplate.update(sql, args) == 1;
    }

    @Override
    public List<Credit> selectForSearchExport(Credit credit) {
        StringBuilder sql = new StringBuilder("SELECT creditListId, creditAmount, userName, userTel, userSex, userAge, workUnit, userPost, unitTel, zhimaNum, huabeiLimit, jiebeiLimit, creditCardLimit, jiedaibaoLimit, listState, listDate, listTime FROM apply_creditlist WHERE deleteFlag = 0");
        List<Object> list = new ArrayList<Object>();

        Optional<Credit> optional = Optional.fromNullable(credit);
        if (optional.isPresent()) {
            if (credit.getListState() > 0) {
                sql.append(" AND listState = ?");
                list.add(credit.getListState());
            }
            if (credit.getListStartDate() != null) {
                sql.append(" AND listDate >= ?");
                list.add(credit.getListStartDate());
            }
            if (credit.getListStopDate() != null) {
                sql.append(" AND listDate <= ?");
                list.add(credit.getListStopDate());
            }
            if (!Strings.isNullOrEmpty(credit.getCreditAmount()) && !credit.getCreditAmount().equals("1234")) {
                sql.append(" AND creditAmount = ?");
                list.add(credit.getCreditAmount());
            }
        }

        Object[] args = list.toArray();

        sql.append(" ORDER BY listTime DESC");

        try {

            return jdbcTemplate.query(sql.toString(), args, new SelectForPageRowMapper());
        } catch (Exception e) {

            return null;
        }
    }
}
