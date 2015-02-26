<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/jstl_contexpath.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/Css/bootstrap.css" />" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/Css/bootstrap-responsive.css" />" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/Css/style.css" />" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/Css/datepicker.css" />" />

    <script type="text/javascript" src="<c:url value="/resources/Js/jquery.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/Js/bootstrap.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/Js/ckform.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/Js/common.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/Js/bootstrap-datepicker.js" />"></script>

 

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
    <form class="definewidth m20">
        <table class="table table-bordered table-hover definewidth m10">
            <tr>
                <td class="tableleft">身份证</td>
                <td><input type="text" name="identity_id" id="identity_id" required="true" value="${customer_info.identity_id}"/></td>
            </tr>
            <tr>
                <td width="10%" class="tableleft">姓名</td>
                <td><input type="text" name="customer_name" id="customer_name" required="true" value="${customer_info.customer_name}"/></td>
            </tr>
            <tr>
                <td class="tableleft">手机号</td>
                <td><input type="text" name="customer_dn" id="customer_dn" required="true" value="${customer_info.customer_dn}"/></td>
            </tr>
            <tr>
                <td class="tableleft">邮箱</td>
                <td><input type="text" name="customer_email" id="customer_email" required="true" value="${customer_info.customer_email}"/></td>
            </tr>
            <tr>
                <td class="tableleft"></td>
                <td>
                    <button type="button" class="btn btn-primary" id="save">保存</button> &nbsp;&nbsp;
                    <button type="button" class="btn btn-success" id="backid">返回列表</button>
                    <input type="hidden" id="customer_id" name="customer_id" value="${customer_info.id}">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
<script>
    $(function () {
		$('#backid').click(function(){
            window.location.href="${ctx}/customer/info/index";
		});

        $('#save').click(function(){
            var customer_id=$.trim($('#customer_id').val());
            var identity_id=$.trim($('#identity_id').val());
            var customer_name=$.trim($('#customer_name').val());
            var customer_dn=$.trim($('#customer_dn').val());
            var customer_email=$.trim($('#customer_email').val());

            $.ajax({
                url:"${ctx}/customer/info/domodify",
                type: "post",
                data:{id:customer_id,identity_id:identity_id,customer_name:customer_name,customer_dn:customer_dn,customer_email:customer_email},
                success:function(data){
                    if(data == 1){
                        alert("成功");
                        location.reload();
                    } else {
                        alert("失败");
                        return false;
                    }
                }
            })
        })
    });
</script>