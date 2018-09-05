package com.blacksheep.mtm.service;


import com.blacksheep.mtm.dto.front.SearchResult;

/**
 * @author
 */
public interface SearchService {

	/**
	 * ES商品搜索
	 * @param keyword
	 * @param page
	 * @param size
	 * @param sort
	 * @param priceGt
	 * @param priceLte
	 * @return
	 */
	SearchResult search(String keyword, int page, int size,String sort,int priceGt,int priceLte);
}
