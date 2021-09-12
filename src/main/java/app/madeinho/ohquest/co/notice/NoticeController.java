package app.madeinho.ohquest.co.notice;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

//import app.madeinho.ohquest.co.security.SecurityService;
import app.madeinho.ohquest.common.domain.pagination.Pagination;
import app.madeinho.ohquest.common.domain.searchFilter.SearchFilter;
import app.madeinho.ohquest.common.exception.OhquestCommonException;
import app.madeinho.ohquest.common.exception.OhquestException;
import app.madeinho.ohquest.common.type.MessageParam;
import app.madeinho.ohquest.common.type.ResultCode;
import app.madeinho.ohquest.common.util.AttachFileUploader;
//import app.madeinho.ohquest.cs.cust.domain.Customer;
//import app.madeinho.ohquest.co.notice.domain.Notice;
//import app.madeinho.ohquest.cs.notice.domain.CsNoticeFile;
//import app.madeinho.ohquest.res.domain.ResBasicModel;


@Controller
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	@Autowired NoticeService csNoticeService;
//	@Autowired SecurityService securityService;
	@Autowired NoticeRepository csNoticeRepository;
//	@Autowired AttachFileUploader attachFileUploader ;
	@Value("/home/user/mcbs/notice") private String noticeUploadPath ;
	
	/**
	 * 공지사항 조회
	 * @param model
	 * @param curPage
	 * @param searchVal
	 * @param    callBack
	 * @return
	 */    

	
	@RequestMapping(value = "/notice/list", method = RequestMethod.GET)
	public String list(Model model, SearchFilter searchFilter, @RequestParam(value="page",required=false, defaultValue="0" ) int curPage,
		@RequestParam(value="callBack",required=false, defaultValue="callBack" ) String callBack ) {
			
		Pagination pagination = new Pagination(searchFilter.getPage());
		pagination.setObjectsCount(csNoticeService.getCsNoticeListCount(searchFilter));
		model.addAttribute("pagination", pagination);
		model.addAttribute("list",csNoticeService.getCsNoticeList(searchFilter, pagination));
		
		try {
			model.addAttribute("jsonlist", new ObjectMapper().defaultPrettyPrintingWriter().writeValueAsString(csNoticeService.getCsNoticeList(searchFilter, pagination)));
			
			/*if(securityService.getCurrentMember().getUserLevel().equals("C")){
				model.addAttribute("myCounselJobList", new ObjectMapper().defaultPrettyPrintingWriter().writeValueAsString(csNoticeService.getMyCounselJobList()));
			}else if( securityService.getCurrentMember().getUserLevel().equals("W") || securityService.getCurrentMember().getUserLevel().equals("M")){
				model.addAttribute("myWorkJobList", new ObjectMapper().defaultPrettyPrintingWriter().writeValueAsString(csNoticeService.getMyWorkJobList()));
			}*/
			//model.addAttribute("myTodoList", new ObjectMapper().defaultPrettyPrintingWriter().writeValueAsString(csNoticeService.getMyTodoList()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("viewNoData", false);
		model.addAttribute("callBack", callBack);
			
		return  "co/notice/list";	
	}
	
	
	@RequestMapping(value = "/notice/notice_detail", method = RequestMethod.GET)
	public String notice_detail(Model model, SearchFilter searchFilter) {
		String returnUrl="popup.co.notice.notice_detail";
		if(logger.isDebugEnabled()){
			logger.debug("[listXXXXXXXXXXXXXXXXX} BEGIN");
		}
			model.addAttribute("authType","User");
		try{
			//model.addAttribute("userId", this.securityService.getCurrentMember().getUserId());
		}catch(Exception e){
			logger.error("[list]"+e.toString(),e);
			throw new OhquestCommonException("err.500",e.toString());
		}finally{
			if(logger.isDebugEnabled()){
				logger.debug("[list] END");
			}
		}
		return 	returnUrl;
	}
	
	
	/**
	 * 공지사항 관리자화면 
	 * @param model
	 * @param searchFilter
	 * @return
	 */
	@RequestMapping(value = "co/notice/coNotice001", method = RequestMethod.GET)
	public String notice_coNotice001(Model model, SearchFilter searchFilter) {
		String returnUrl="dialog.co.notice.notice_detail";
		if(logger.isDebugEnabled()){
			logger.debug("[list} BEGIN");
		}
			model.addAttribute("authType","Manager");
		
		try{
			//model.addAttribute("userId", this.securityService.getCurrentMember().getUserId());
		}catch(Exception e){
			logger.error("[list]"+e.toString(),e);
			throw new OhquestCommonException("err.500",e.toString());
		}finally{
			if(logger.isDebugEnabled()){
				logger.debug("[list] END");
			}
		}
		return 	returnUrl;
	}
	
	
	/*
	 * 그리드 화면 뿌리기
	 * 
	 */
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value="/notice/notice_detailgrid", method = RequestMethod.POST)
	@ResponseBody public  Map  modelGrid(Notice csNotice, SearchFilter searchFilter) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		Pagination pagination = new Pagination(searchFilter.getPage(),10);
		pagination.setObjectsCount(csNoticeService.getCsNoticeListCount2(searchFilter));
		List<Notice> csNoticeList = (List<Notice>) csNoticeService.getCsNoticeGrid(csNotice, pagination);
		map.put("list",csNoticeList);
		map.put("pagination", pagination);

		return map;
	}	
	
	
	/**
	 * 공지사항 입력,수정
	 * @param model
	 * @param csNotice
	 * @param mode
	 * @return
	 */
	@RequestMapping(value = "/notice/update_notice", method = RequestMethod.POST)
	@ResponseBody public Model insert_updateNotice(Model model, Notice csNotice ) {
		
		//csNotice.setLoginId(this.securityService.getCurrentMember().getUserId());
		if(csNotice.getNotice_seqno()!=-1){
			model.addAttribute("notice_seqno", csNotice.getNotice_seqno());
			csNoticeService.updateCsNotice(csNotice);
		}else{
			csNotice.setNotice_seqno(csNoticeRepository.getNoticeSeqno());
			model.addAttribute("notice_seqno", csNotice.getNotice_seqno());
			csNoticeService.insertNotice(csNotice);
		}
		model.addAttribute("RESULT", "RECEIVED");
		model.addAttribute("notice_seqno", csNotice.getNotice_seqno());
		return model ;
	}	
	
	/**
	 * 메인화면 공지사항 뷰 
	 */
	@RequestMapping(value = "/notice/noticeView/{seqNo}", method = RequestMethod.GET)
	public String insert_showNotice(Model model,@PathVariable String seqNo) {
		String returnUrl="dialog.co.notice.notice_show";
		model.addAttribute("notice",csNoticeService.getCsNoticeListDetail(seqNo));
		model.addAttribute("RESULT","RECEIVED");
		
		return returnUrl;
	}
	
	/** 
	 * 공지사항  삭제
	 */
	@RequestMapping(value="notice/notice_detail",method = RequestMethod.DELETE)
	@ResponseBody public MessageParam res001delete(Notice csNotice){
		
		try {
			csNoticeService.deleteNotice(csNotice);
			return new MessageParam(ResultCode.SUCCESS);
		} catch (OhquestCommonException me) {
			logger.error("[processAddress] " + me.toString(), me);
			return new MessageParam(ResultCode.FAIL, me.toString());
		}
	}
	
	/**
	 * 공지사항신규팝업
	 * */
	@RequestMapping(value = "/notice/notice_new", method = RequestMethod.GET)
	public String notice_new(Model model, Notice csNotice) {
		String returnUrl="dialog.co.notice.notice_new";
		if(logger.isDebugEnabled()){
			logger.debug("[notice_new] BEGIN");
		}
		try{
			//model.addAttribute("userId", this.securityService.getCurrentMember().getUserId());
		}catch(Exception e){
			logger.error("[notice_new]"+e.toString(),e);
			throw new OhquestCommonException("err.500",e.toString());
		}finally{
			if(logger.isDebugEnabled()){
				logger.debug("[notice_new] END");
			}
		}
		return 	returnUrl;
	}
	
	/**
	 * 공지사항 수정팝업
	 **/
	@RequestMapping(value = "/notice/notice_modify/{notice_seqno}", method = RequestMethod.GET)
	public String notice_modify(Model model,@PathVariable String notice_seqno) {
		String returnUrl="dialog.co.notice.notice_update";
		if(logger.isDebugEnabled()){
			logger.debug("[notice_modify] BEGIN");
		}
		try{
			//model.addAttribute("userId", this.securityService.getCurrentMember().getUserId());
			model.addAttribute("notice",csNoticeService.getCsNoticeListDetail(notice_seqno));
			
		}catch(Exception e){
			logger.error("[notice_modify]"+e.toString(),e);
			throw new OhquestCommonException("err.500",e.toString());
		}finally{
			if(logger.isDebugEnabled()){
				logger.debug("[notice_modify] END");
			}
		}
		return 	returnUrl;
	}
	
	

	/**
	 * 공지사항 관리자 화면 호출
	 */
	
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="/notice/notice_upload", method = RequestMethod.POST)
	@ResponseBody public MessageParam uploadFiles(Notice csNotice,  HttpServletRequest request) {
		MessageParam messageParam = new MessageParam(ResultCode.SUCCESS);
		if(logger.isDebugEnabled()){
			logger.debug("[notice_upload] START");
		}
		try {
			//csNotice.setOperator(securityService.getCurrentMember());
			//csNotice.setLoginId(securityService.getCurrentMember().getUserId());
			csNotice.setApplicationId("csNotice");
			//List<MultipartFile> multipartFiles = attachFileUploader.uploadFiles(request);
			//csNoticeService.addNoticeFile(csNotice, multipartFiles);
			return messageParam;
		} catch (OhquestException e) {
			return new MessageParam(ResultCode.FAIL, e.getMessageCode());
		}catch (Exception e) {
			return new MessageParam(ResultCode.FAIL, e.toString());
		}finally{
			if(logger.isDebugEnabled()){
				logger.debug("[notice_upload] END");
			}
		}
	}
	
	
	
	@RequestMapping(value="/notice/downFile", method = RequestMethod.GET)
	public void download(@RequestParam String downLoadPath , @RequestParam String fileName,HttpServletResponse response) {
		FileInputStream fis = null;
		try {
			response.setHeader("Content-Disposition",
					"attachment;fileName=\"" + StringUtils.replace(fileName, "+", "%20")
							+ "\";");
			
			File file = new File(noticeUploadPath+ downLoadPath);
			response.setContentType("application/octet-stream");
			response.setContentLength((int) file.length());
			response.setHeader("Content-Transfer-Encoding", "binary");
			OutputStream out;
			out = response.getOutputStream();
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					e.printStackTrace();

				}
			}
		}
	}
	
	/**
	 * 공지사항 리스트화면 선택시 파일유무 체크(see more 화면 :notice_detail)
	 * @param model
	 * @param csNotice
	 * @return
	 */
	@RequestMapping(value = "/notice/fileCheck", method = RequestMethod.POST)
	@ResponseBody public Model fileCheck(Model model, Notice csNotice ) {
		
		try{
			//csNotice.setLoginId(this.securityService.getCurrentMember().getUserId());
			int file_cnt = csNoticeService.getNoticeFileCnt(csNotice.getNotice_seqno());
			
			model.addAttribute("notice_seqno", csNotice.getNotice_seqno());
			model.addAttribute("filecnt", file_cnt);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return model ;
	}	
	
	
	@RequestMapping(value = "/notice/dialog_todolist", method = RequestMethod.GET)
	public String dialogTodoList(Model model, SearchFilter searchFilter) {
		String returnUrl="dialog.co.notice.todolist_dialog";
		try {
		//	model.addAttribute("myTodoList", new ObjectMapper().defaultPrettyPrintingWriter().writeValueAsString(csNoticeService.getMyTodoList()));
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return  returnUrl;	
	}
	
	
	/**
	 * 공지사항 파일리스트조회
	 **/
	@RequestMapping(value = "/notice/searchNoticeFile/{notice_seqno}", method = RequestMethod.GET)
	public String searchNoticeFile(Model model,@PathVariable String notice_seqno) {
		String returnUrl="dialog.co.notice.notice_update";
		if(logger.isDebugEnabled()){
			logger.debug("[notice_modify] BEGIN");
		}
		try{
			//model.addAttribute("fileList",csNoticeService.getNoticeFileList(notice_seqno));
		}catch(Exception e){
			logger.error("[notice_modify]"+e.toString(),e);
			throw new OhquestCommonException("err.500",e.toString());
		}finally{
			if(logger.isDebugEnabled()){
				logger.debug("[notice_modify] END");
			}
		}
		return 	returnUrl;
	}
	
	
}
