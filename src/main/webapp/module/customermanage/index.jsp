<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/jstl_contexpath.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/Css/bootstrap.css" />" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/Css/bootstrap-responsive.css" />" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/Css/style.css" />" />
    <script type="text/javascript" src="<c:url value="/resources/Js/jquery.js" />"></script>

    <script type="text/javascript" src="<c:url value="/resources/Js/bootstrap.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/Js/ckform.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/Js/common.js" />"></script>

    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
</head>
<body>
<form class="form-inline definewidth m20" action="${ctx}/customer/info/index" method="post">
    证件号码：
    <input type="text" name="certificate_no" id="certificate_no"class="abc input-default" placeholder="" value="${certificate_no}">&nbsp;&nbsp;
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp;
    <button type="button" class="btn btn-success" id="addnew">新增客户</button>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
        <tr>
            <th>客户姓名</th>
            <th>证件类型</th>
            <th>证件号码</th>
            <th>客户手机</th>
            <th>客户邮箱</th>
            <th>客户类型</th>
            <th>客户房产</th>
            <th>客户车辆</th>
            <th>客户担保人/单位</th>
            <th>操作</th>
        </tr>
    </thead>
    <c:forEach var="customer" items="${customer_list}" varStatus="status">
        <tr>
            <td>${customer.customer_name}</td>
            <td>${customer.certificate_type}</td>
            <td>${customer.certificate_no}</td>
            <td>${customer.customer_dn}</td>
            <td>${customer.customer_email}</td>
            <td>${customer.customer_type}</td>
            <td>${customer.customer_house}</td>
            <td>${customer.customer_vehicle}</td>
            <td>${customer.customer_guarantee}</td>
            <td><a href="${ctx}/customer/info/modify?id=${customer.id}">修改</a></td>
        </tr>
    </c:forEach>
</table>
<%@ include file="/resources/page.jsp"%>
</body>
</html>
<script>
    $('#addnew').click(function(){
        window.location.href="${ctx}/customer/info/add";
    });
</script>