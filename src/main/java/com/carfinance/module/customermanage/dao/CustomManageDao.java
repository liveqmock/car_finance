package com.carfinance.module.customermanage.dao;

import com.carfinance.core.dao.BaseJdbcDaoImpl;
import com.carfinance.module.common.dao.CommonDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class CustomManageDao extends BaseJdbcDaoImpl {
	final Logger logger = LoggerFactory.getLogger(CustomManageDao.class);

    @Autowired
    private CommonDao commonDao;

}