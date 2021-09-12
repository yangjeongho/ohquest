package app.madeinho.ohquest.co.code;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import app.madeinho.ohquest.co.code.Code;
import app.madeinho.ohquest.co.code.domain.LookupCode;
import app.madeinho.ohquest.common.exception.OhquestCommonException;
import app.madeinho.ohquest.common.exception.OhquestException;
import app.madeinho.ohquest.common.type.MessageParam;
import app.madeinho.ohquest.common.type.ResultCode;
import app.madeinho.ohquest.common.util.AttachFileUploader;

@Controller
public class CodeController {

	private static final Logger logger = LoggerFactory
			.getLogger(CodeController.class);
	@Autowired
	CodeService codeService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {

		// 날짜 데이타가 값이 입력이 안되는 경우 '' 를 Date 변환시 에러가 나는 문제 처리.
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		dateFormat.setLenient(false);

		// true passed to CustomDateEditor constructor means convert empty
		// String to null
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));
	}

	/**
	 * reload cached code list!
	 * 
	 * @param cacheName
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/code/cache/{cacheName}", method = RequestMethod.GET)
	@ResponseBody
	public String cachedCodeReload(@PathVariable String cacheName, Model model) {
		// cacheManager.reloadCachedAllData(cacheName);
		return "success reload!";
	}

	/**
	 * 코드 유형 조회 화면(전체)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/code/view/{language}", method = RequestMethod.GET)
	public String codeView(Model model, @PathVariable String language) {
		model.addAttribute("codeTypeList",
				codeService.getCodeTypeList(language));
		return "dialog.co.code.view";
	}

	/**
	 * 코드 유형 리스트 조회
	 * 
	 * @return
	 */
	@RequestMapping(value = "/codetype/{codeGroup}/{language}", method = RequestMethod.GET)
	public String codeTypeList(Model model, @PathVariable String codeGroup,
			@PathVariable String language) {
		
		logger.debug("[양정호 codeGroup]=" + codeGroup);
		System.out.println("[양정호 codeGroup]=" + codeGroup);
		System.out.println("[양정호 language]=" + language);
		
		model.addAttribute("list", codeService.getCodeTypeList(language));
		return "co/code/type-list";
	}

	/**
	 * 코드 유형별 코드리스트 조회
	 * 
	 * @return
	 */
	@RequestMapping(value = "/code/{codeGroup}/{language}", method = RequestMethod.GET)
	public String codeList(Model model, LookupCode lookupCode) {
		lookupCode.setManageFlag(true);// 관리자는 사용기간에 상관없이 모든 코드목록을 조회 할 수 있다.
		model.addAttribute("list", codeService.getCodeList(lookupCode));
		return "co/code/list";
	}

	/**
	 * 코드 등록화면
	 * 
	 * @return
	 */
	@RequestMapping(value = "/code/form/{language}", method = RequestMethod.GET)
	public String codeForm(Model model, @ModelAttribute LookupCode lookupCode) {
		LookupCode lookupCode2 = new LookupCode();
		lookupCode2.setCodeGroup("LANGUAGE");
		lookupCode2.setLanguage(lookupCode.getLanguage());
		lookupCode2.setManageFlag(true);// 관리자는 사용기간에 상관없이 모든 코드목록을 조회 할 수 있다.
		model.addAttribute("languages", codeService.getCodeList(lookupCode2));
		return "dialog.co.code.form";
	}

	/**
	 * 코드 등록 처리
	 * 
	 * @return
	 */
	@RequestMapping(value = "/code/form/{language}", method = RequestMethod.POST)
	@ResponseBody
	public MessageParam addCode(Model model,
			@ModelAttribute LookupCode lookupCode) {
		try {
			lookupCode.setApplicationId("regCode");
			if (logger.isDebugEnabled()) {
				logger.debug("[code]=" + lookupCode.toString());
			}

			//codeService.addCode(lookupCode);

			// 공통코드 websphere 전송
		//	String response = codeDeployService.deployCode(lookupCode);

			//System.out.println("\n\n $$$::" + response);

			//return new MessageParam(ResultCode.SUCCESS, response);
		//} catch (AcubeCommonException e) {
			return new MessageParam(ResultCode.SUCCESS, "저장은 성공했으나 연동은 실패");
		} catch (DuplicateKeyException e) {
			if (logger.isErrorEnabled()) {
				logger.error("error", e);
			}
			return new MessageParam(ResultCode.FAIL, "err.000001");
		} catch (Exception e) {

			if (logger.isErrorEnabled()) {
				logger.error("error", e);
			}
			/*
			 * String param[] = {"param1", "param2", "param3"}; return new
			 * MessageParam(ResultCode.FAIL, "err.000002", param);
			 */
			return new MessageParam(ResultCode.FAIL, e.toString());
		}
	}
	
	/*
	 * @Autowired CodeApiTestService codeApiTestService;
	 * 
	 * @RequestMapping(value="/code/form/{language}", method =
	 * RequestMethod.POST)
	 * 
	 * @ResponseBody public Map addCode(Model model, @ModelAttribute Code Code)
	 * { Map res = new HashMap(); try { Code.setApplicationId("regCode");
	 * if(logger.isDebugEnabled()){ logger.debug("[code]=" + Code.toString()); }
	 * //codeService.addCode(Code); codeApiTestService.test(Code);
	 * res.put("res", Code); return res; } catch(DuplicateKeyException e){
	 * if(logger.isErrorEnabled()){ logger.error("error", e); } //return new
	 * MessageParam(ResultCode.FAIL, "err.000001"); } catch (Exception e) {
	 * 
	 * if(logger.isErrorEnabled()){ logger.error("error", e); } String param[] =
	 * {"param1", "param2", "param3"}; return new MessageParam(ResultCode.FAIL,
	 * "err.000002", param);
	 * 
	 * ///return new MessageParam(ResultCode.FAIL, e.toString());
	 * 
	 * } return res; }
	 */

	/**
	/**
	 * 코드 수정화면
	 * 
	 * @return
	 */
	@RequestMapping(value = "/code/form/{codeGroup}/{code}/{language}", method = RequestMethod.GET)
	public String modifyForm(Model model, @ModelAttribute LookupCode lookupCode) {

		LookupCode lookupCode2 = new LookupCode();
		lookupCode2.setCodeGroup("LANGUAGE");
		lookupCode2.setLanguage(lookupCode.getLanguage());
		lookupCode2.setManageFlag(true);// 관리자는 사용기간에 상관없이 모든 코드목록을 조회 할 수 있다.
		List<LookupCode> languages = codeService.getCodeList(lookupCode2);
		model.addAttribute("languages", languages);

		Map<String, LookupCode> codes = new HashMap<String, LookupCode>();
		for (LookupCode code : languages) {
			lookupCode.setLanguage(code.getCode());
			LookupCode code2 = (LookupCode) codeService.getCode(lookupCode);
			if (code2 != null) {
				codes.put(code.getCode(), code2);
				// 메인 lookupCode에 데이타 세팅
				lookupCode.setEnabledFlag(code2.isEnabledFlag());
				lookupCode.setSecurityGroupId(code2.getSecurityGroupId());
				lookupCode.setApplicationId(code2.getApplicationId());
				lookupCode.setStartDateActive(code2.getStartDateActive());
				lookupCode.setEndDateActive(code2.getEndDateActive());
				lookupCode.setSvcDomain(code2.getSvcDomain());
				lookupCode.setSubGrp1(code2.getSubGrp1());
				lookupCode.setSubGrp2(code2.getSubGrp2());
			}
		}

		model.addAttribute("codes", codes);

		return "dialog.co.code.form";
	}

	/**
	 * 코드 수정 처리
	 * 
	 * @return
	 */
	@RequestMapping(value = "/code/form/{codeGroup}/{code}/{language}", method = RequestMethod.POST)
	@ResponseBody
	public MessageParam modifyCode(Model model,
			@ModelAttribute LookupCode lookupCode) {
		try {
			lookupCode.setApplicationId("updateCode");
			if (logger.isDebugEnabled()) {
				logger.debug("[code]=" + lookupCode.toString());
			}
		//	codeService.updateCode(lookupCode);

		//	String response = codeDeployService.deployCode(lookupCode);

		///	System.out.println("\n\n $$$::" + response);
			return new MessageParam(ResultCode.SUCCESS, "");

		} catch (Exception e) {

			if (logger.isErrorEnabled()) {
				logger.error("error", e);
			}
			/*
			 * String param[] = {"param1", "param2", "param3"}; return new
			 * MessageParam(ResultCode.FAIL, "err.000002", param);
			 */
			return new MessageParam(ResultCode.FAIL, e.toString());
		}
	}

	/**
	 * 코드 삭제 처리
	 * 
	 * @return
	 */
	@RequestMapping(value = "/code/form/{codeGroup}/{code}", method = RequestMethod.DELETE)
	@ResponseBody
	public MessageParam deleteCode(Model model,
			@ModelAttribute LookupCode lookupCode) {
		try {
			if (logger.isDebugEnabled()) {
				logger.debug("[code]=" + lookupCode.toString());
			}
		//	codeService.deleteCode(lookupCode);
			return new MessageParam(ResultCode.SUCCESS);
		} catch (Exception e) {
			if (logger.isErrorEnabled()) {
				logger.error("error", e);
			}
			return new MessageParam(ResultCode.FAIL, e.toString());
		}
	}


	/**
	 * 코드 건별 조회화면
	 * 
	 * @return
	 */
	@RequestMapping(value = "/code/{codeGroup}/{code}/{language}", method = RequestMethod.GET)
	public String codeDetail(Model model, @ModelAttribute Code Code, LookupCode lookupCode) {
		model.addAttribute("codeList", codeService.getCodeList(lookupCode));
		return "dialog.co.code.view";
	}

	/**
	 * CSV File Upload
	 * 
	 * @return
	 */
	/*
	 * @RequestMapping(value = "/code/upload", method = RequestMethod.POST)
	 * public String csvUpload(Model model, HttpServletRequest request) { try {
	 * List<Code> Codes =
	 * codeService.addCodeByCsv(attachFileUploader.upload(request)) ;
	 * model.addAttribute("result", Codes); for(Code Code : Codes){ //en만 전달
	 * if(Code.getLanguage().equals("en")){ String response =
	 * codeDeployService.deployCode(Code); if (logger.isDebugEnabled()) {
	 * logger.debug("batch upload code ", "respons = "+ response+ ", " +
	 * Code.toString()); } } } } catch (OhquestException e) {
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } return
	 * "co/code/upload-result"; }
	 */

	/**
	 * 리스트박스 생성 : 공통코드 용
	 * 
	 * @param model
	 * @param request
	 * @param httpSession
	 * @param codeGroup
	 * @param code
	 * @return
	 */
	@RequestMapping(value = "/code/listbox/{codeGroup}", method = RequestMethod.GET)
	public String getCodeListBox(Model model, HttpServletRequest request,
			HttpSession httpSession, @PathVariable String codeGroup,
			@RequestParam(required = false) String code) {
		String retUrl = "co/code/listbox";
		if (logger.isDebugEnabled()) {
			logger.debug("[getCodeListBox] BEGIN");
		}
		try {
			LookupCode lookupCode = new LookupCode();
			lookupCode.setCodeGroup(codeGroup);

			// 세션에 저장된 locale 정보를 조회
			Locale locale = (Locale) httpSession
					.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);

			// 세션에 저장된 정보가 있는 경우.
			if (locale != null) {
				lookupCode.setLanguage(locale.getLanguage());
			} else {// 세션에 저장된 정보가 없는 경우, 디폴트 설정
				lookupCode.setLanguage(request.getLocale().getLanguage());
			}
			List<LookupCode> codeList = codeService
					.getCodeListFromCache(lookupCode);
			model.addAttribute("code", code);
			model.addAttribute("list", codeList);
		} catch (Exception e) {
			if (logger.isErrorEnabled())
				logger.error("[getCodeListBox] " + e.toString(), e);
			//throw new AcubeException("err.500", e.toString());
		} finally {
			if (logger.isDebugEnabled()) {
				logger.debug("[getCodeListBox] END");
			}
		}
		return retUrl;
	}

	@RequestMapping(value = "/code/codeName/{codeGroup}/{code}", method = RequestMethod.GET)
	@ResponseBody
	public String getCodeName(Model model, HttpServletRequest request,
			HttpSession httpSession, @PathVariable String codeGroup,
			@PathVariable String code) {
		if (logger.isDebugEnabled()) {
			logger.debug("[getCodeName] BEGINxxxxxxxx");
		}
		String codeName = "";
		try {
			logger.debug("[getCodeName] 1111111111");
			LookupCode lookupCode = new LookupCode();
			lookupCode.setCodeGroup(codeGroup);
			lookupCode.setCode(code);
			logger.debug("[getCodeName] 22222222222");
			// 세션에 저장된 locale 정보를 조회
			Locale locale = (Locale) httpSession
					.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
			logger.debug("[getCodeName] 3333333333");
			// 세션에 저장된 정보가 있는 경우.
			if (locale != null) {
				lookupCode.setLanguage(locale.getLanguage());
			} else {// 세션에 저장된 정보가 없는 경우, 디폴트 설정
				lookupCode.setLanguage(request.getLocale().getLanguage());
			}
			logger.debug("[getCodeName] getCodeNameFromCache All");
			codeName = codeService.getCodeNameFromCache(lookupCode)
					.getMeaning();
		} catch (Exception e) {
			if (logger.isErrorEnabled())
				logger.error("[getCodeName] " + e.toString(), e);
			//throw new AcubeException("err.500", e.toString());
		} finally {
			if (logger.isDebugEnabled()) {
				logger.debug("[getCodeName] END");
			}
		}
		return codeName;
	}

	@Deprecated
	@RequestMapping(value = "/code/codeNames", method = RequestMethod.POST, consumes = { "application/json" })
	@ResponseBody
	public List<Code> getCodeNameList(Model model, HttpServletRequest request,
			HttpSession httpSession, @RequestBody Code[] codes) {
		if (logger.isDebugEnabled()) {
			logger.debug("[getCodeName] BEGINqqqqqqqqqqq");
		}
		List<Code> Codes = new ArrayList<Code>();
		try {

			// 세션에 저장된 locale 정보를 조회
			Locale locale = (Locale) httpSession
					.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
			String language = "";
			// 세션에 저장된 정보가 있는 경우.
			if (locale != null) {
				language = locale.getLanguage();

			} else {// 세션에 저장된 정보가 없는 경우, 디폴트 설정
				language = request.getLocale().getLanguage();
			}

			for (Code code : codes) {
				code.setLanguage(language);
				Codes.add(code);
			}

		} catch (Exception e) {
			if (logger.isErrorEnabled()) {
				logger.error("[getCodeName] " + e.toString(), e);
			}
			throw new OhquestException("err.500", e.toString());
		} finally {
			if (logger.isDebugEnabled()) {
				logger.debug("[getCodeName] END");
			}
		}
		return Codes;
	}

	@RequestMapping(value = "/code/codeList", method = RequestMethod.POST, consumes = { "application/json" })
	@ResponseBody
	public Map<String, List<LookupCode>> getCodeList(Model model,
			HttpServletRequest request, HttpSession httpSession,
			@RequestBody LookupCode[] codes) {
		if (logger.isDebugEnabled()) {
			logger.debug("[getCodeName] BEGINuuuuu");
			logger.debug("[getCodeName] 000000000000");
		}
		logger.debug("[getCodeName] 111111111111");
		Map<String, List<LookupCode>> lookupCodes = new HashMap<String, List<LookupCode>>();
		logger.debug("[getCodeName] 222222222222");
		try {

			// 세션에 저장된 locale 정보를 조회
			Locale locale = (Locale) httpSession
					.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
			String language = "";
			
			logger.debug("[getCodeName] 111111111111");
			// 세션에 저장된 정보가 있는 경우.
			if (locale != null) {
				language = locale.getLanguage();

			} else {// 세션에 저장된 정보가 없는 경우, 디폴트 설정
				language = request.getLocale().getLanguage();
			}

			logger.debug("[getCodeName] 2222222222");
			
			for (LookupCode code : codes) {
				code.setLanguage(language);
				lookupCodes.put(code.getCodeGroup(),
						codeService.getCodeListFromCache(code));
			}

			logger.debug("[getCodeName] 33333333333" + lookupCodes.size());
		} catch (Exception e) {
			if (logger.isErrorEnabled()) {
				logger.error("[getCodeName] " + e.toString(), e);
			}
		//	throw new AcubeException("err.500", e.toString());
		} finally {
			if (logger.isDebugEnabled()) {
				logger.debug("[getCodeName] END");
			}
		}
		return lookupCodes;
	}

	/**
	 * 코드 리스트 박스 생성 : 상담 코드 ( 대,중,소)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/code/counselListbox", method = RequestMethod.GET)
	public String counselListbox(Model model, Code code) {
		String retUrl = "co/code/other_listbox";
		if (logger.isDebugEnabled()) {
			logger.debug("[counselListbox] BEGIN, dataHomePath=");
		}
		try {
			model.addAttribute("list", codeService.getCounselCode(code));
		} catch (Exception e) {
			if (logger.isErrorEnabled()) {
				logger.error("[counselListbox] " + e.toString(), e);
			}
			throw new OhquestException("err.500", e.toString());
		} finally {
			if (logger.isDebugEnabled()) {
				logger.debug("[counselListbox] END");
			}
		}
		return retUrl;
	}

	/**
	 * 코드 리스트 박스 생성 : 장비목록
	 * 
	 * @return
	 */
	@RequestMapping(value = "/code/deviceListbox/{type}", method = RequestMethod.GET)
	public String deviceInfo(Model model, @PathVariable String type,
			@RequestParam String svcCd,
			@RequestParam(required = false) String eqipClssCd,
			@RequestParam(required = false) String manufacturer) {
		String retUrl = "co/code/other_listbox";
		if (logger.isDebugEnabled()) {
			logger.debug("[deviceInfo] BEGIN, dataHomePath=");
		}
		try {
			HashMap<String, String> hashmap = new HashMap<String, String>();
			if (!StringUtils.isEmpty(svcCd))
				hashmap.put("svcCd", svcCd);
			if (!StringUtils.isEmpty(eqipClssCd))
				hashmap.put("eqipClssCd", eqipClssCd);
			if (!StringUtils.isEmpty(manufacturer))
				hashmap.put("manufacturer", manufacturer);
			model.addAttribute("list",
					codeService.getDeviceByType(type, hashmap));
		} catch (Exception e) {
			if (logger.isErrorEnabled()) {
				logger.error("[deviceInfo] " + e.toString(), e);
			}
			throw new OhquestException("err.500", e.toString());
		} finally {
			if (logger.isDebugEnabled()) {
				logger.debug("[deviceInfo] END");
			}
		}
		return retUrl;
	}

	/**
	 * 서비스 도메인 목록
	 * 
	 * @return
	 */
	@RequestMapping(value = "/code/serviceDomain", method = RequestMethod.GET)
	@ResponseBody
	public List<Code> serviceDomain() {
		if (logger.isDebugEnabled()) {
			logger.debug("[serviceDomain] BEGIN");
		}
		try {
			return codeService.getServiceDomain();
		} catch (Exception e) {
			if (logger.isErrorEnabled()) {
				logger.error("[serviceDomain] " + e.toString(), e);
			}
			throw new OhquestException("err.500", e.toString());
		} finally {
			if (logger.isDebugEnabled()) {
				logger.debug("[serviceDomain] END");
			}
		}
	}

	/**
	 * 코드 리스트 박스 생성 : 상담 코드 ( 대,중,소)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/code/workEventListbox", method = RequestMethod.GET)
	public String workEventListbox(Model model, Code code) {
		String retUrl = "co/code/other_listbox";
		if (logger.isDebugEnabled()) {
			logger.debug("[workActivityListbox] BEGIN, dataHomePath=");
		}
		try {
			model.addAttribute("list", codeService.getWorkEventCode(code));
		} catch (Exception e) {
			if (logger.isErrorEnabled()) {
				logger.error("[workActivityListbox] " + e.toString(), e);
			}
			throw new OhquestException("err.500", e.toString());
		} finally {
			if (logger.isDebugEnabled()) {
				logger.debug("[workActivityListbox] END");
			}
		}
		return retUrl;
	}

	@RequestMapping(value = "/code/ftrcode/{language}", method = RequestMethod.GET)
	public String ftrCodeView(Model model, @PathVariable String language) {

		System.out.println("FEATURE CODE");
		// model.addAttribute("featureCodeList",
		// codeService.getFeatureCodeList());
		return "dialog.co.code.ftrcode";
	}

	// @RequestMapping(value = "/code/getRevenueCode/", method =
	// RequestMethod.POST)
	// public String revenueCodeView(Model model, String featureCode) {
	// System.out.println("REVENUE CODE VIEW:  "+featureCode);
	// model.addAttribute("revenueCodeList",codeService.getRevenueCodeList(featureCode));
	// return "dialog.co.code.ftrcode";
	// }
	//
	// @RequestMapping(value = "/code/regRevenuCode", method =
	// RequestMethod.POST)
	// @ResponseBody public String revenueCodeReg(Model model, FeatureCode
	// featureCode) {
	// System.out.println("REVENUE CODE REG:  "+featureCode);
	// codeService.regRevenueCode(featureCode);
	// return "dialog.co.code.ftrcode";
	// }

	/**
	 * 코드 리스트 박스 생성 : 주소 city Code
	 * 
	 * @return
	 */
	@RequestMapping(value = "/code/cityListbox", method = RequestMethod.GET)
	public String cityListbox(Model model, Code code) {
		String retUrl = "co/code/other_listbox";
		if (logger.isDebugEnabled()) {
			logger.debug("[cityListbox] BEGIN, dataHomePath=");
		}
		try {
			model.addAttribute("list", codeService.getCityCode(code));
		} catch (Exception e) {
			if (logger.isErrorEnabled()) {
				logger.error("[cityListbox] " + e.toString(), e);
			}
			throw new OhquestException("err.500", e.toString());
		} finally {
			if (logger.isDebugEnabled()) {
				logger.debug("[cityListbox] END");
			}
		}
		return retUrl;
	}

	/**
	 * 코드 리스트 박스 생성 : 주소 district Code
	 * 
	 * @return
	 */
	@RequestMapping(value = "/code/districtListbox", method = RequestMethod.GET)
	public String districtListbox(Model model, Code code) {
		String retUrl = "co/code/other_listbox";
		if (logger.isDebugEnabled()) {
			logger.debug("[districtListbox] BEGIN, dataHomePath=");
		}
		try {
			model.addAttribute("list", codeService.getDistrictCode(code));
		} catch (Exception e) {
			if (logger.isErrorEnabled()) {
				logger.error("[districtListbox] " + e.toString(), e);
			}
			throw new OhquestException("err.500", e.toString());
		} finally {
			if (logger.isDebugEnabled()) {
				logger.debug("[districtListbox] END");
			}
		}
		return retUrl;
	}

	/**
	 * 코드 리스트 박스 생성 : 주소 subDistrictList Code
	 * 
	 * @return
	 */
	@RequestMapping(value = "/code/subDistrictListbox", method = RequestMethod.GET)
	public String subDistrictListbox(Model model, Code code) {
		String retUrl = "co/code/other_listbox";
		if (logger.isDebugEnabled()) {
			logger.debug("[subDistrictListbox] BEGIN, dataHomePath=");
		}
		try {
			model.addAttribute("list", codeService.getSubDistrictCode(code));
		} catch (Exception e) {
			if (logger.isErrorEnabled()) {
				logger.error("[subDistrictListbox] " + e.toString(), e);
			}
			throw new OhquestException("err.500", e.toString());
		} finally {
			if (logger.isDebugEnabled()) {
				logger.debug("[subDistrictListbox] END");
			}
		}
		return retUrl;
	}

	/**
	 * 코드 리스트 박스 생성 : 주소 building Code
	 * 
	 * @return
	 */
	@RequestMapping(value = "/code/buildingListbox", method = RequestMethod.GET)
	public String buildingListbox(Model model, Code code) {
		String retUrl = "co/code/other_listbox";
		if (logger.isDebugEnabled()) {
			logger.debug("[buildingListbox] BEGIN, dataHomePath=");
		}
		try {
			model.addAttribute("list", codeService.getBuildingCode(code));
		} catch (Exception e) {
			if (logger.isErrorEnabled()) {
				logger.error("[buildingListbox] " + e.toString(), e);
			}
			throw new OhquestException("err.500", e.toString());
		} finally {
			if (logger.isDebugEnabled()) {
				logger.debug("[buildingListbox] END");
			}
		}
		return retUrl;
	}

	/**
	 * 코드 리스트 박스 생성 : 주소 Entrance Code
	 * 
	 * @return
	 */
	@RequestMapping(value = "/code/entranceListbox", method = RequestMethod.GET)
	public String entranceListbox(Model model, Code code) {
		String retUrl = "co/code/other_listbox";
		if (logger.isDebugEnabled()) {
			logger.debug("[entranceListbox] BEGIN, dataHomePath=");
		}
		try {
			model.addAttribute("list", codeService.getEntranceCode(code));
		} catch (Exception e) {
			if (logger.isErrorEnabled()) {
				logger.error("[entranceListbox] " + e.toString(), e);
			}
			throw new OhquestException("err.500", e.toString());
		} finally {
			if (logger.isDebugEnabled()) {
				logger.debug("[entranceListbox] END");
			}
		}
		return retUrl;
	}

	/**
	 * 코드 리스트 박스 생성 : 주소 Door Code
	 * 
	 * @return
	 */
	@RequestMapping(value = "/code/doorListbox", method = RequestMethod.GET)
	public String doorListbox(Model model, Code code) {
		String retUrl = "co/code/other_listbox";
		if (logger.isDebugEnabled()) {
			logger.debug("[doorListbox] BEGIN, dataHomePath=");
		}
		try {
			model.addAttribute("list", codeService.getDoorCode(code));
		} catch (Exception e) {
			if (logger.isErrorEnabled()) {
				logger.error("[doorListbox] " + e.toString(), e);
			}
			throw new OhquestException("err.500", e.toString());
		} finally {
			if (logger.isDebugEnabled()) {
				logger.debug("[doorListbox] END");
			}
		}
		return retUrl;
	}

	/**
	 * 코드 리스트 박스 생성 : 주소 Door Code
	 * 
	 * @return
	 */
	@RequestMapping(value = "/code/groupListbox", method = RequestMethod.GET)
	public String groupListbox(Model model, Code code) {
		String retUrl = "co/code/other_listbox";
		if (logger.isDebugEnabled()) {
			logger.debug("[groupListbox] BEGIN, dataHomePath=");
		}
		try {
			model.addAttribute("list", codeService.getGroupList(code));
		} catch (Exception e) {
			if (logger.isErrorEnabled()) {
				logger.error("[groupListbox] " + e.toString(), e);
			}
			throw new OhquestException("err.500", e.toString());
		} finally {
			if (logger.isDebugEnabled()) {
				logger.debug("[groupListbox] END");
			}
		}
		return retUrl;
	}

}
