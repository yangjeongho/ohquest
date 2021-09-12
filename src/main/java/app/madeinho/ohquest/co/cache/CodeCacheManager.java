package app.madeinho.ohquest.co.cache;

import java.util.List;
import java.util.Map;

import app.madeinho.ohquest.co.code.domain.LookupCode;

public interface CodeCacheManager {
	public Map<String, List<LookupCode>> getCachedCodeList();
	public void reloadCachedAllData(String cacheName);
	public List<LookupCode> appendCache(String cacheName, LookupCode lookupCode);
	public void updateCache(String cacheName, LookupCode lookupCode);
	public void removeCache(String cacheName, LookupCode lookupCode);
	/**
	 * @return
	 */
	/**
	 * @param cacheName
	 * @param prodCd
	 * @return
	 */
}
