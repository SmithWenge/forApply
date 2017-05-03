package com.caifeng.function.admin.home.repository;

import com.caifeng.function.admin.home.Home;
import com.google.common.base.Optional;
import com.google.common.base.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class HomeRepository implements HomeRepositoryI {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int selectNumsForHome(Home home) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(1) FROM apply_creditlist WHERE deleteFlag = 0");
        List<Object> list = new ArrayList<Object>();
        Optional<Home> optional = Optional.fromNullable(home);
        if (optional.isPresent()) {
            if (home.getListState() > 0) {
                sql.append(" AND listState = ?");
                list.add(home.getListState());
            }
            if (!Strings.isNullOrEmpty(home.getNowaday())) {
                sql.append(" AND listDate = ?");
                list.add(home.getNowaday());
            }
        }

        Object[] args = list.toArray();

        return jdbcTemplate.queryForObject(sql.toString(),args, Integer.class);
    }
}
