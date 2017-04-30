package com.caifeng.function.admin.login.repository;

import com.caifeng.function.admin.login.AdminUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by shihanwen on 2017/4/30.
 */
@Repository
public class LoginRepository implements LoginRepositoryI {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public AdminUser selectAdminUser(AdminUser user) {
        String sql = "SELECT adminId, adminUserName, adminPassWord, adminUserTel, adminLoginName FROM apply_admin WHERE adminLoginName = ? AND adminPassWord = ? AND deleteFlag = 0";
        Object[] args = {
                user.getAdminLoginName(),
                user.getAdminPassWord()
        };


        try {
            return jdbcTemplate.queryForObject(sql, args, new SelectAdminUserRowMapper());
        } catch (Exception e) {
            return null;
        }
    }

    class SelectAdminUserRowMapper implements RowMapper<AdminUser> {

        @Override
        public AdminUser mapRow(ResultSet resultSet, int rowNum) throws SQLException {
            AdminUser user = new AdminUser();
            user.setAdminId(resultSet.getString("adminId"));
            user.setAdminUserName(resultSet.getString("adminUserName"));
            user.setAdminPassWord(resultSet.getString("adminPassWord"));
            user.setAdminUserTel(resultSet.getString("adminUserTel"));
            user.setAdminLoginName(resultSet.getString("adminLoginName"));

            return user;
        }
    }
}
