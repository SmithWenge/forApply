<%@tag pageEncoding="UTF-8"%>
<%@ attribute name="groupValue" type="java.lang.String" required="true"%>
<%@ attribute name="itemKey" type="java.lang.Integer" required="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="dict" uri="http://www.caifeng.com/tags/dic" %>

<td>${dict:show(groupValue, itemKey)}</td>