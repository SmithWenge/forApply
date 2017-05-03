package com.caifeng.arc.interceptor;

import com.caifeng.arc.utils.ConstantFields;
import com.caifeng.function.admin.login.AdminUser;
import com.google.common.base.Optional;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class AdminLoginInterceptor implements HandlerInterceptor {
    private List<String> excludedUris;

    public void setExcludedUris(List<String> excludedUris) {
        this.excludedUris = excludedUris;
    }

    public List<String> getExcludedUris() {

        return excludedUris;
    }

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        String requestUri = httpServletRequest.getRequestURI();
        HttpSession session = httpServletRequest.getSession();

        for (String uri : excludedUris) {
            if (requestUri.endsWith(uri)) {
                return true;
            }
        }

        AdminUser adminUser = (AdminUser) session.getAttribute(ConstantFields.SESSION_ADMIN_KEY);
        Optional<AdminUser> optional = Optional.fromNullable(adminUser);

        if (!optional.isPresent()) {
            String redirectLocation = httpServletRequest.getContextPath() + "/admin/routeLogin.action";
            httpServletResponse.sendRedirect(redirectLocation);
            return false;
        } else {
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
