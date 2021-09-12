package app.madeinho.ohquest.common.tag;

import java.io.Serializable;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

/*import com.acube.unitel.co.code.CodeService;
import com.acube.unitel.co.member.MemberService;
import com.acube.unitel.co.member.domain.Member;
import com.acube.unitel.co.security.ElementsService;
import com.acube.unitel.co.security.SecurityService;
import com.acube.unitel.co.security.UserProfileLinkService;
import com.acube.unitel.cos.info.CosInfoService;
import com.acube.unitel.cos.reseller.ResellerService;
import com.acube.unitel.cs.cug.service.CugService;*/


@Service
public class TagConfiguration implements Serializable {

	/*  */
	private static final long serialVersionUID = 1547103793830561629L;
	private final Logger log = LoggerFactory.getLogger(TagConfiguration.class);
	
	private boolean initialized = false;
	private static TagConfiguration instance = null;
	
	@Autowired private MessageSource messageSource;
/*	@Autowired private CodeService codeService;
	@Autowired private MemberService memberService;
	@Autowired private ResellerService resellerService;
	@Autowired private SecurityService securityService ;
	@Autowired private ElementsService elementsService ;
	@Autowired private UserProfileLinkService userProfileLinkService ;
	@Autowired private CugService cugService ;
	@Autowired private CosInfoService cosInfoService ;*/
	
	
	
	
	@PostConstruct
	public void init() {
		log.info("Initializing Abas Configuration.");
		
		synchronized (this) {
			if(!isInitialized()) {
				setInitialized(true);
				setInstance(this);
			}
		}
	}

	public boolean isInitialized() {
		return initialized;
	}

	private void setInitialized(boolean initialized) {
		this.initialized = initialized;
	}

	public static TagConfiguration getInstance() {
		return instance;
	}

	private void setInstance(TagConfiguration instance) {
		TagConfiguration.instance = instance;
	}
	
	public MessageSource getMessageSource() {
		return messageSource;
	}

/*	public CodeService getCodeService() {
		return codeService;
	}
	
	public MemberService getMemberService() {
		return memberService;
	}
	
	public ResellerService getResellerService() {
		return resellerService;
	}
	
	public Member getCurrentMember(){
		return securityService.getCurrentMember() ;
	}

	public ElementsService getElementsService() {
		return elementsService;
	}

	public UserProfileLinkService getUserProfileLinkService() {
		return userProfileLinkService;
	}

	public CugService getCugService() {
		return cugService;
	}

	public CosInfoService getCosInfoService() {
		return cosInfoService;
	}

	public SecurityService getSecurityService() {
		return securityService;
	}*/
	
	
	
	
}
