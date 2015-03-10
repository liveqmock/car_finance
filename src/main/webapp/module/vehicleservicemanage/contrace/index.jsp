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
<form class="form-inline definewidth m20" action="${ctx}/vehicleservice/contrace/index" method="post">
    门店：
    <select id="original_org" name="original_org">
        <c:forEach var="org" items="${user_all_org_list}" varStatus="status">
            <c:if test="${org.org_id == original_org}">
                <option value="${org.org_id}" selected="selected">${org.org_name}</option>
            </c:if>
            <c:if test="${org.org_id != original_org}">
                <option value="${org.org_id}">${org.org_name}</option>
            </c:if>
        </c:forEach>
    </select>&nbsp;&nbsp;
    姓名：
    <input type="text" name="customer_name" id="customer_name"class="abc input-default" placeholder="" value="${customer_name}">&nbsp;&nbsp;
    手机号码：
    <input type="text" name="dn" id="dn"class="abc input-default" placeholder="" value="${dn}">&nbsp;&nbsp;
    证件号码：
    <input type="text" name="certificate_no" id="certificate_no"class="abc input-default" placeholder="" value="${certificate_no}">&nbsp;&nbsp;
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp;
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
        <tr>
            <th>客户姓名</th>
            <th>客户类型</th>
            <th>手机号码</th>
            <th>证件类型</th>
            <th>证件号码</th>
            <th>开始时间</th>
            <th>结束时间</th>
            <th>描述</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
    </thead>
    <c:forEach var="contrace" items="${contrace_list}" varStatus="status">
        <tr>
            <td>${contrace.customer_name}</td>
            <td>${contrace.customer_type}</td>
            <td>${contrace.customer_dn}</td>
            <td>${contrace.customer_cer_type}</td>
            <td>${contrace.customer_cer_no}</td>
            <td>${contrace.use_begin}</td>
            <td>${contrace.use_end}</td>
            <td>${contrace.remark}</td>
            <td>
                <c:if test="${contrace.status == 0}">初始状态</c:if>
                <c:if test="${contrace.status == 1}">店长审核通过</c:if>
                <c:if test="${contrace.status == 2}">市公司店长审核通过</c:if>
                <c:if test="${contrace.status == 3}">区域经理审核通过</c:if>
                <c:if test="${contrace.status == 4}">财务通过</c:if>
                <c:if test="${contrace.status == -1}">店长驳回</c:if>
            </td>
            <td>
                <c:if test="${(contrace.status == 0 || contrace.status == -1) && contrace.create_by == user.user_id}">
                    <button type="button" class="btn btn-success modify" value="${contrace.id}">编辑</button>
                    <button type="button" class="btn btn-success addvehicle" value="${contrace.id}">增加车辆</button>
                    <button type="button" class="btn btn-success audit" value="${contrace.id}">提交审核</button>
                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>
<%@ include file="/resources/page.jsp"%>
</body>
</html>
<script>
    $('.modify').click(function(){
        var contrace_id = $(this).val();
        window.location.href="${ctx}/vehicleservice/contrace/modify?contrace_id="+contrace_id;
    });

    $('.addvehicle').click(function(){
        var contrace_id = $(this).val();

        //TODO
        <%--window.location.href="${ctx}/vehicleservice/contrace/modify?contrace_id="+contrace_id;--%>
    });

    //业务员，提交合同，到门店经理审核
    //需要判断该合同中的车辆总金额，是否超过一定数额（可配，比如30W），如果超过，则需要一类门店店长审核
    $('.audit').click(function(){
        var contrace_id = $(this).val();
        $.ajax({
            url:"${ctx}/vehicleservice/contrace/toshopaudit",
            type: "get",
            data:{contrace_id:contrace_id},
            dataType:"json",
            success:function(data){
                if(data > 1){
                    alert("成功");
                    location.reload();
                } else if(data == -1) {
                    alert("您还没有绑定车辆，请先增加车辆，再提交审核");
                    return false;
                } else {
                    alert("失败");
                    return false;
                }
            }
        })
    });
</script>