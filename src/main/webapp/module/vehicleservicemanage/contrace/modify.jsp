<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/jstl_contexpath.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/Css/bootstrap.min.css" />" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/Css/bootstrap-responsive.css" />" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/Css/datetimepicker.css" />" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/Css/style.css" />" />

    <script type="text/javascript" src="<c:url value="/resources/Js/jquery.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/Js/bootstrap.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/Js/bootstrap-datetimepicker.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/Js/bootstrap-datetimepicker.zh-CN.js" />"></script>
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
    <form class="definewidth m20">
        <table class="table table-bordered table-hover definewidth m10">
            <tr>
                <td width="10%" class="tableleft">所属门店</td>
                <td colspan="5">
                    <select id="original_org" name="original_org">
                        <c:forEach var="org" items="${user_all_org_list}" varStatus="status">
                            <c:if test="${org.org_id == vehicle_contrace_info.org_id}">
                                <option value="${org.org_id}" selected="selected">${org.org_name}</option>
                            </c:if>
                            <c:if test="${org.org_id != vehicle_contrace_info.org_id}">
                                <option value="${org.org_id}">${org.org_name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="tableleft">客户姓名</td>
                <td><input type="text" name="customer_name" id="customer_name" required="true" value="${vehicle_contrace_info.customer_name}"/></td>
                <td class="tableleft">客户类型</td>
                <td>
                    <select id="customer_type" name="customer_type">
                        <option value="个人用户" <c:if test="${vehicle_contrace_info.customer_type == '个人用户'}"> selected="selected" </c:if>>个人用户</option>
                        <option value="企业用户" <c:if test="${vehicle_contrace_info.customer_type == '企业用户'}"> selected="selected" </c:if>>企业用户</option>
                    </select>
                </td>
                <td class="tableleft">客户手机</td>
                <td><input type="text" name="customer_dn" id="customer_dn" required="true" value="${vehicle_contrace_info.customer_dn}"/></td>
            </tr>
            <tr>
                <td class="tableleft">证件类型</td>
                <td>
                    <select id="certificate_type" name="certificate_type">
                        <option value="身份证" <c:if test="${vehicle_contrace_info.customer_cer_type == '身份证'}"> selected="selected" </c:if>>身份证</option>
                        <option value="国际护照" <c:if test="${vehicle_contrace_info.customer_cer_type == '国际护照'}"> selected="selected" </c:if>>国际护照</option>
                        <option value="回乡证" <c:if test="${vehicle_contrace_info.customer_cer_type == '回乡证'}"> selected="selected" </c:if>>回乡证</option>
                        <option value="台胞证" <c:if test="${vehicle_contrace_info.customer_cer_type == '台胞证'}"> selected="selected" </c:if>>台胞证</option>
                    </select>
                </td>
                <td class="tableleft">证件号码</td>
                <td colspan="3"><input type="text" name="certificate_no" id="certificate_no" required="true" value="${vehicle_contrace_info.customer_cer_no}"/></td>
            </tr>
            <tr>
                <td class="tableleft">用车开始时间</td>
                <td>
                    <input class="form_datetime" size="16" type="text" id="use_begin_date" name="use_begin_date" value="${vehicle_contrace_info.use_begin}" required="true" readonly>
                </td>
                <td class="tableleft">用车结束时间</td>
                <td colspan="3">
                    <input class="form_datetime" size="16" type="text" id="use_end_date" name="use_end_date" value="${vehicle_contrace_info.use_end}" required="true" readonly>
                </td>
            </tr>
            <tr>
                <td class="tableleft">业务员id</td>
                <td><input type="text" name="employee_id" id="employee_id" value="${vehicle_contrace_info.employee_id}" required="true"/></td>
                <td class="tableleft">业务员姓名</td>
                <td colspan="3"><input type="text" name="employee_name" id="employee_name" required="true" value="${vehicle_contrace_info.employee_name}"/></td>
            </tr>
            <tr>
                <td class="tableleft">描述</td>
                <td colspan="5"><textarea id="remark" rows="4" style="margin: 0px 0px 10px; width: 766px; height: 140px;" >${vehicle_contrace_info.remark}</textarea></td>
            </tr>
            <tr>
                <td class="tableleft"></td>
                <td colspan="5">
                    <input type="hidden" id="contrace_id" value="${vehicle_contrace_info.id}">
                    <button type="button" class="btn btn-primary" id="save">保存</button> &nbsp;&nbsp;
                    <button type="button" class="btn btn-success" id="backid">返回列表</button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
<script>
    $(function () {
        window.prettyPrint && prettyPrint();
//        $('#use_begin').datetimepicker({
//            format: 'yyyy-mm-dd hh:ii',
//            language: 'zh-CN',
//            pickDate: true,
//            pickTime: true,
//            hourStep: 1,
//            minuteStep: 15,
//            secondStep: 30,
//            inputMask: true
//        });
//        $('#use_end').datetimepicker({
//            format: 'yyyy-mm-dd hh:ii',
//            language: 'en',
//            pickDate: true,
//            pickTime: true,
//            hourStep: 1,
//            minuteStep: 15,
//            secondStep: 30,
//            inputMask: true
//        });

        $('.form_datetime').datetimepicker({
            format: 'yyyy-mm-dd hh:ii',
            language: 'zh-CN',
            pickDate: true,
            pickTime: true,
            hourStep: 1,
            minuteStep: 15,
            secondStep: 30,
            inputMask: true
        });

		$('#backid').click(function(){
            window.location.href="${ctx}/vehicleservice/contrace/index";
		});

        $('#save').click(function(){
            var contrace_id=$.trim($('#contrace_id').val());
            var original_org=$.trim($('#original_org').val());
            var customer_name=$.trim($('#customer_name').val());
            var customer_type=$.trim($('#customer_type').val());
            var customer_dn=$.trim($('#customer_dn').val());
            var certificate_type=$.trim($('#certificate_type').val());
            var certificate_no=$.trim($('#certificate_no').val());
            var use_begin_date=$.trim($('#use_begin_date').val());
            var use_end_date=$.trim($('#use_end_date').val());
            var employee_id=$.trim($('#employee_id').val());
            var employee_name=$.trim($('#employee_name').val());
            var remark=$.trim($('#remark').val());

            $.ajax({
                url:"${ctx}/vehicleservice/contrace/domodify",
                type: "post",
                data:{contrace_id:contrace_id,original_org:original_org,customer_name:customer_name,customer_type:customer_type,customer_dn:customer_dn,
                    certificate_type:certificate_type,certificate_no:certificate_no,use_begin:use_begin_date,use_end:use_end_date,employee_id:employee_id,
                    employee_name:employee_name,remark:remark},
                success:function(data){
                    if(data > 0){
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