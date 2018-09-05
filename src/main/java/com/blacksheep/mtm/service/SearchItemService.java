package com.blacksheep.mtm.service;


import com.blacksheep.mtm.dto.EsInfo;

/**
 * @author
 */
public interface SearchItemService {

	/**
	 * 同步索引
	 * @return
	 */
	int importAllItems();

	/**
	 * 获取ES基本信息
	 * @return
	 */
	EsInfo getEsInfo();
}
