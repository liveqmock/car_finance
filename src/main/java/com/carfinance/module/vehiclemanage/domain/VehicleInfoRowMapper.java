package com.carfinance.module.vehiclemanage.domain;

import com.carfinance.module.storemanage.domain.Store;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class VehicleInfoRowMapper implements RowMapper<VehicleInfo>{
	public VehicleInfo mapRow(ResultSet rs, int arg1) throws SQLException {
        VehicleInfo vehicleInfo=new VehicleInfo();

        vehicleInfo.setId(rs.getLong("id"));
        vehicleInfo.setArchive_no(rs.getString("archive_no"));
        vehicleInfo.setInventory_no(rs.getString("inventory_no"));
        vehicleInfo.setBrand(rs.getString("brand"));
        vehicleInfo.setModel(rs.getString("model"));
        vehicleInfo.setColor(rs.getString("color"));
        vehicleInfo.setCarframe_no(rs.getString("carframe_no"));
        vehicleInfo.setEngine_no(rs.getString("engine_no"));
        vehicleInfo.setRegistry_certificate(rs.getString("registry_certificate"));
        vehicleInfo.setCertificate_direction(rs.getString("certificate_direction"));
        vehicleInfo.setLoan_bank(rs.getString("loan_bank"));
        vehicleInfo.setConsistency_cer(rs.getString("consistency_cer"));
        vehicleInfo.setCheck_list(rs.getString("check_list"));
        vehicleInfo.setDuty_paid_proof(rs.getString("duty_paid_proof"));
        vehicleInfo.setRecord(rs.getString("record"));
        vehicleInfo.setBuy_at(rs.getDate("buy_at"));
        vehicleInfo.setSupplier(rs.getString("supplier"));
        vehicleInfo.setLicense_plate(rs.getString("license_plate"));
        vehicleInfo.setCard_at(rs.getDate("card_at"));
        vehicleInfo.setLimited_at(rs.getDate("limited_at"));
        vehicleInfo.setGuide_price(rs.getDouble("guide_price"));
        vehicleInfo.setVehicle_price(rs.getDouble("vehicle_price"));
        vehicleInfo.setVehicle_tax(rs.getDouble("vehicle_tax"));
        vehicleInfo.setInsurance_company(rs.getString("insurance_company"));
        vehicleInfo.setStrong_insurance(rs.getDouble("strong_insurance"));
        vehicleInfo.setVehicle_vessel_tax(rs.getDouble("vehicle_vessel_tax"));
        vehicleInfo.setStrong_insurance_expire_at(rs.getDate("strong_insurance_expire_at"));
        vehicleInfo.setBusiness_insurance(rs.getDouble("business_insurance"));
        vehicleInfo.setBusiness_insurance_expire_at(rs.getDate("business_insurance_expire_at"));
        vehicleInfo.setRemark(rs.getString("remark"));
        vehicleInfo.setCreate_by(rs.getLong("create_by"));
        vehicleInfo.setCreate_at(rs.getDate("create_at"));
        vehicleInfo.setOriginal_org(rs.getLong("original_org"));

        return vehicleInfo;
	}
}