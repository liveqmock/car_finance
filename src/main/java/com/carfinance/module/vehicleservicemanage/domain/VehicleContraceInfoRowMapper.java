package com.carfinance.module.vehicleservicemanage.domain;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class VehicleContraceInfoRowMapper implements RowMapper<VehicleContraceInfo>{
	public VehicleContraceInfo mapRow(ResultSet rs, int arg1) throws SQLException {
        VehicleContraceInfo vehicleContraceInfo=new VehicleContraceInfo();

        vehicleContraceInfo.setId(rs.getLong("id"));
        vehicleContraceInfo.setCustomer_name(rs.getString("customer_name"));
        vehicleContraceInfo.setCustomer_type(rs.getString("customer_type"));
        vehicleContraceInfo.setCustomer_dn(rs.getString("customer_dn"));
        vehicleContraceInfo.setCustomer_cer_type(rs.getString("customer_cer_type"));
        vehicleContraceInfo.setCustomer_cer_no(rs.getString("customer_cer_no"));
        vehicleContraceInfo.setRemark(rs.getString("remark"));
        vehicleContraceInfo.setEmployee_id(rs.getString("employee_id"));
        vehicleContraceInfo.setEmployee_name(rs.getString("employee_name"));
        vehicleContraceInfo.setCreate_by(rs.getLong("create_by"));
        vehicleContraceInfo.setCreate_at(rs.getDate("create_at"));
        vehicleContraceInfo.setUpdate_by(rs.getLong("update_by"));
        vehicleContraceInfo.setUpdate_at(rs.getDate("update_at"));
        vehicleContraceInfo.setStatus(rs.getLong("status"));
        vehicleContraceInfo.setReservation_id(rs.getLong("reservation_id"));
        String use_begin_str = rs.getTimestamp("use_begin").toString();
        String use_end_str = rs.getTimestamp("use_end").toString();
        vehicleContraceInfo.setUse_begin(use_begin_str.substring(0 , use_begin_str.length()-2));
        vehicleContraceInfo.setUse_end(use_end_str.substring(0 , use_end_str.length()-2));
        vehicleContraceInfo.setOrg_id(rs.getLong("org_id"));
        vehicleContraceInfo.setShopowner_update_by(rs.getLong("shopowner_update_by"));
        vehicleContraceInfo.setShopowner_update_at(rs.getDate("shopowner_update_at"));
        vehicleContraceInfo.setCity_shopowner_update_by(rs.getLong("city_shopowner_update_by"));
        vehicleContraceInfo.setCity_shopowner_update_at(rs.getDate("city_shopowner_update_at"));
        vehicleContraceInfo.setRegional_manager_update_by(rs.getLong("regional_manager_update_by"));
        vehicleContraceInfo.setRegional_manager_update_at(rs.getDate("regional_manager_update_at"));
        vehicleContraceInfo.setFinance_update_by(rs.getLong("finance_update_by"));
        vehicleContraceInfo.setFinance_update_at(rs.getDate("finance_update_at"));

        return vehicleContraceInfo;
	}
}