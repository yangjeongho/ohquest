package app.madeinho.ohquest.co.cache;

import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import app.madeinho.ohquest.co.code.CodeService;
import app.madeinho.ohquest.co.code.domain.LookupCode;

@Service
@Transactional
public class CodeCacheManagerImpl implements CodeCacheManager {
	@Autowired private Ehcache codeCache;
	@Autowired private CodeService codeService;
	@Autowired CacheManager cacheManager;

	@Override
	@SuppressWarnings("unchecked")
	public Map<String, List<LookupCode>> getCachedCodeList() {
		Element cachedCodeList = this.codeCache.get("codeList");
		if(cachedCodeList == null){
			cacheCodeList();
		}
		return (Map<String, List<LookupCode>>) cachedCodeList.getValue();
	}
	

	/**
	* {@inheritDoc}
	*/
	@Override
	public void reloadCachedAllData(String cacheName) {
		reCacheCode(cacheName);
	}
	
	
	/**
	* {@inheritDoc}
	*/
	@SuppressWarnings("unchecked")
	@Override
	public List<LookupCode> appendCache(String cacheName, LookupCode lookupCode){
		String lang = lookupCode.getLanguage();
		lookupCode.setLanguage("ALL");
		
		Cache cache = cacheManager.getCache("codeCache");
		Element element = cache.get(cacheName);
		Map<String, List<LookupCode>> map = (Map<String, List<LookupCode>>) element.getValue() ;
		List<LookupCode> lookupCodes = codeService.getCodeList(lookupCode);
		map.put(lookupCode.getCodeGroup(), lookupCodes);
		
		this.codeCache.put(new Element("codeList", map));		
		lookupCode.setLanguage(lang);
		return lookupCodes ;
	}
	

	
	/**
	* {@inheritDoc}
	*/
	@SuppressWarnings("unchecked")
	@Override
	public void updateCache(String cacheName, LookupCode lookupCode){
		String lang = lookupCode.getLanguage();
		lookupCode.setLanguage("ALL");
		
		Cache cache = cacheManager.getCache("codeCache");
		Element element = cache.get("codeList");
		Map<String, List<LookupCode>> map = (Map<String, List<LookupCode>>) element.getValue() ;
		List<LookupCode> lookupCodes = codeService.getCodeList(lookupCode);
		if(lookupCodes.size() == 0){
			map.remove(lookupCode.getCodeGroup());
		}else{
			map.put(lookupCode.getCodeGroup(), lookupCodes);
		}
		
		this.codeCache.put(new Element("codeList", map));		
		lookupCode.setLanguage(lang);
	}
	
	/**
	* {@inheritDoc}
	*/
	@SuppressWarnings("unchecked")
	@Override
	public void removeCache(String cacheName, LookupCode lookupCode){
		
		Cache cache = cacheManager.getCache("codeCache");
		Element element = cache.get("codeList");
		Map<String, List<LookupCode>> map = (Map<String, List<LookupCode>>) element.getValue() ;
		List<LookupCode> lookupCodes = codeService.getCodeList(lookupCode);
		if(lookupCodes.size() == 0){
			map.remove(lookupCode.getCodeGroup());
		}else{
			map.put(lookupCode.getCodeGroup(), lookupCodes);
		}
		
		this.codeCache.put(new Element("codeList", map));
	}
	
	@PostConstruct
	public void cacheCodeList(){
		
		System.out.println("################################################");
		
		this.codeCache.put(new Element("codeList", codeService.cacheCodeData()));
		
		System.out.println("             Completed common code cache!              ");
		
		System.out.println("################################################");
	}
	
	public void reCacheCode(String cacheName){
		
		System.out.println("################################################");
		if(cacheName == null || "all".equals(cacheName)){
			this.codeCache.put(new Element("codeList", codeService.cacheCodeData()));
			System.out.println("             Completed common code cache!              ");
		}else if("codeList".equals(cacheName)){
			this.codeCache.put(new Element("codeList", codeService.cacheCodeData()));
			System.out.println("             Completed common code & product code cache!");
		}else if("productList".equals(cacheName)){
			System.out.println("             Completed product code cache!              ");
		}
		System.out.println("################################################");
	}
}
