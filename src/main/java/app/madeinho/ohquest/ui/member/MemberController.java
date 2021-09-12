package app.madeinho.ohquest.ui.member;

import java.io.IOException;
import java.util.List;
import java.util.Map;


import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//import app.madeinho.ohquest.common.domain.pagination.Pagination;

import app.madeinho.ohquest.stock.day.StockService;
import app.madeinho.ohquest.ui.member.Member;
/*import com.acube.unitel.common.exception.AcubeCommonException;
import com.acube.unitel.common.exception.AcubeException;
import com.acube.unitel.common.util.AttachFileUploader;
import com.acube.unitel.cs.cust.domain.Customer;
*/

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired MemberService memberService;
	//@Autowired AttachFileUploader attachFileUploader ;
	
	/*@RequestMapping(value="co/agent/list", method = RequestMethod.GET)
	public String retrirveUserList(@RequestParam(required=false) String callBack, Customer customer, Model model ) {
		if(StringUtils.isEmpty(callBack)){
			model.addAttribute("list", agentService.getAgentList(""));
		}
		return "dialog.co.agent.list";
	}*/
		
	
	@Autowired	StockService stockService;
	
	/*@RequestMapping("/")
	public String index() {
		return "/index";
	}*/
	
	@RequestMapping(value="/ui/stockday", method = RequestMethod.GET)
	public String stockDaySave() throws IOException {
		
		stockService.saveStock();
		

		//getURLInfo("");
	
		//List<EventLnkg> eventLnkgs =
		
		System.out.println("양정화 : STEP end");
		//return "co/notice/notice";
		return "dialog.ui.newMember";
		//return "main";
	}

	@RequestMapping(value="/ui/stocklist", method = RequestMethod.GET)
	public String stockDayList() throws IOException {
		
		//stockService.saveStock();
		

		//getURLInfo("");
	
		//List<EventLnkg> eventLnkgs =
		
		//System.out.println("양정화 : STEP end");
		//return "co/notice/notice";
		return "dialog.ui.list";
		//return "main";
	}
		
	
	/**
	 * 회원최초 등록 화면 오픈 
	 * @return
	 */
	@RequestMapping(value="/ui/newMember", method = RequestMethod.GET)
	public String viewOrUser000(Model model) {
		
		//stockService.saveStock();
		
		//List<Map<String, Object>> ipList = userService.getIpInfoListByMarket("100000");
		logger.debug("ui/newMember@@@@@@@@@@@@");		
		//model.addAttribute("ipList", ipList);
		return "dialog.ui.newMember";
	}	
	
	@RequestMapping(value = "/ui/member/sel",          method = RequestMethod.GET)
	public String retrirveSelList(Model model, 
			@RequestParam(value="page",required=false, defaultValue="0" ) int curPage,
			@RequestParam(value="searchVal",required=false, defaultValue="" ) String searchVal,
			@RequestParam(value="callBack",required=false, defaultValue="callBack" ) String callBack ,
			@RequestParam(value="mode",required=false, defaultValue="SELECT") String mode) {
		
		logger.debug("[retrirveSelList] BEGIN");
		
	//public String retrirveSelList(@RequestParam(required=false) String callBack, Customer customer, Model model ) {
		if(StringUtils.isEmpty(callBack)){
			model.addAttribute("list", memberService.getMemberList(""));
		}
		
		logger.debug("[retrirveSelList] End");
		
		return "co/agent/list";
	}
			
	
/*	@RequestMapping(value="/cs/list", method = RequestMethod.GET)
	public String retrirveUserList() {
		return "dialog.cs.cust.list";
	}	*/
	
	/**
	 * 주소 조회
	 * @param model
	 * @param curPage
	 * @param searchVal
	 * @param callBack
	 * @return
	 */
	@RequestMapping(value = "/common/member/search", method = RequestMethod.GET)
	public String list(Model model, @RequestParam(value="page",required=false, defaultValue="0" ) int curPage,
			@RequestParam(value="searchVal",required=false, defaultValue="" ) String searchVal,
			@RequestParam(value="callBack",required=false, defaultValue="callBack" ) String callBack ) {
		String retUrl = "dialog.co.agent.search" ;
		if (logger.isDebugEnabled()) {
			logger.debug("[list] BEGIN");
		}
		try {
			if(!StringUtils.isEmpty(searchVal)){
			//	Pagination pagination = new Pagination(curPage, true);
				//pagination.setObjectsCount(agentService.getAgentListCount(searchVal));
				//model.addAttribute("pagination", pagination); 
				model.addAttribute("searchVal", searchVal);				
				model.addAttribute("list", memberService.getMemberList(searchVal));
				model.addAttribute("viewNoData", false);
				retUrl = "co/agent/list" ; 
			}
			model.addAttribute("callBack", callBack);
			
			
		} catch (Exception e) {
			logger.error("[list] " + e.toString(), e);
		//	throw new AcubeCommonException("err.500", e.toString());
		} finally{	
			if (logger.isDebugEnabled()) {
				logger.debug("[list] END");
			}
		}
		return  retUrl;	
	}
	
	/**
	 * 주소 등록/수정/삭제
	 * @param model
	 * @param agent
	 * @param mode
	 * @return
	 */
	@RequestMapping(value = "/member/process/{mode}", method = RequestMethod.POST)
	@ResponseBody public Model processAgent(Model model, Member member,@PathVariable String mode ) {
		
		
		logger.debug("[processAgent] BEGIN");
		
		logger.debug("[processAgent] model" +model);
		
		if (logger.isDebugEnabled()) {
			logger.debug("[processAgent] BEGIN");
		}
		try {
			if(logger.isDebugEnabled()) {
				
			}
			if ("I".equals(mode)){				
				memberService.insertMember(member);	
				              
			}else if ("U".equals(mode)){
	//			agentService.updateAgent(agent);	
			}else if ("D".equals(mode)){
			//	agentService.deleteAgent(agent);
			}
			model.addAttribute("RESULT", "SUCCESS");
		//} catch (AcubeCommonException me) {
		/*	logger.error("[processAgent] " + me.toString(), me);
			model.addAttribute("RESULT", "FAIL");
			model.addAttribute("MESSAGE", me.getMessageCode());*/
		} catch (Exception e) {
			logger.error("[processAgent] " + e.toString(), e);
			model.addAttribute("RESULT", "FAIL");
			model.addAttribute("MESSAGE", "err.500");
		} finally{
			if (logger.isDebugEnabled()) {
				logger.debug("[processAgent] END");
			}
		}
		return model ;
	}
	
	/**
	 * 주소 중복 체크
	 * @param model
	 * @param agent
	 * @return
	 */
	@RequestMapping(value = "/common/member/check/", method = RequestMethod.POST)
	@ResponseBody public Model checkAgent(Model model, Member member) {
		
		if (logger.isDebugEnabled()) {
			logger.debug("[checkAgent] BEGIN");
		}
		try {
			if(logger.isDebugEnabled()) {
				
			}
		//	int cnt = agentService.getAgentCount(agent.getAddNum());
			model.addAttribute("RESULT", "SUCCESS");
		//	model.addAttribute("COUNT", cnt);
		/*} catch (AcubeCommonException me) {
			logger.error("[checkAgent] " + me.toString(), me);
			model.addAttribute("RESULT", "FAIL");
			model.addAttribute("MESSAGE", me.getMessageCode());*/
		} catch (Exception e) {
			logger.error("[checkAgent] " + e.toString(), e);
			model.addAttribute("RESULT", "FAIL");
			model.addAttribute("MESSAGE", "err.500");
		} finally{
			if (logger.isDebugEnabled()) {
				logger.debug("[checkAgent] END");
			}
		}
		return model ;
	}
	

	
}
