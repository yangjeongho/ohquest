package app.madeinho.ohquest.common.tag;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;

import org.apache.taglibs.standard.tag.common.core.NullAttributeException;
import org.apache.taglibs.standard.tag.common.core.OutSupport;
import org.apache.taglibs.standard.tag.el.core.ExpressionUtil;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.support.JspAwareRequestContext;
import org.springframework.web.servlet.support.RequestContext;

import app.madeinho.ohquest.co.code.CodeConfiguration;
import app.madeinho.ohquest.co.code.CodeService;
import app.madeinho.ohquest.co.code.domain.LookupCode;

public class CodeOutTag extends OutSupport {

	private static final long serialVersionUID = -4146300346814560551L;

    private String value_;
    private String default_;
    private String escapeXml_;
    private boolean escapeQuote;
    private boolean escapeXmlExcludeAnchor;
    private int maxLength;
    private String typeGbn; //코드 대분류 구분자
    private String codeType; //코드유형
    private String option; //listbox, checkbox, radio
    private String include; //코드중 포함할 코드리스트: 100,101,102
    private String exclude; //코드중 제외할 코드리스트: 100,101,102
    private String inputName; //option이 checkbox,radio일때 id,name으로 사용됨
    private String cssClass; //option이 checkbox,radio일때cssClass 사용됨
    private String style; //option이 checkbox,radio일때 style 사용됨
    private String attr; //option이 checkbox,radio일때 readonly or disabled
    private String var;
    private String lang = "en"; 
    
    public static final String REQUEST_CONTEXT_PAGE_ATTRIBUTE =
			"org.springframework.web.servlet.tags.REQUEST_CONTEXT";
    private RequestContext requestContext;
    private CodeService codeService ; 

    public void setVar(String var) {
		this.var = var;
	}

	public void setOption(String option) {
		this.option = option;
	}
    	
	public void setInputName(String inputName) {
		this.inputName = inputName;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public void setAttr(String attr) {
		this.attr = attr;
	}

	public CodeOutTag() {
        super();
        init();
    }

    public int doStartTag() throws JspException {
    	
    	this.requestContext = (RequestContext) this.pageContext.getAttribute(REQUEST_CONTEXT_PAGE_ATTRIBUTE);
		if (this.requestContext == null) {
			this.requestContext = new JspAwareRequestContext(this.pageContext);
			this.pageContext.setAttribute(REQUEST_CONTEXT_PAGE_ATTRIBUTE, this.requestContext);
		}
		evaluateExpressions();
		return super.doStartTag();
	}

    public void release() {
        super.release();
        init();
    }

    public void setValue(String value_) {
        this.value_ = value_;
    }

    public void setDefault(String default_) {
        this.default_ = default_;
    }

    public void setEscapeXml(String escapeXml_) {
        this.escapeXml_ = escapeXml_;
    }

    public void setMaxLength(int maxLength) {
		this.maxLength = maxLength;
	}

	public void setEscapeQuote(boolean escapeQuote) {
		this.escapeQuote = escapeQuote;
	}

	public void setEscapeXmlExcludeAnchor(boolean escapeXmlExcludeAnchor) {
		this.escapeXmlExcludeAnchor = escapeXmlExcludeAnchor;
	}

	public void setTypeGbn(String typeGbn) {
		this.typeGbn = typeGbn;
	}

	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}

	public String getInclude() {
		return include;
	}

	public void setInclude(String include) {
		this.include = include;
	}

	public void setExclude(String exclude) {
		this.exclude = exclude;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	private void init() {
		value_ = default_ = escapeXml_ = null;
		typeGbn = codeType = option = include = exclude = lang = null ;
		inputName = cssClass = style = attr = null; 
		maxLength = 0;
		escapeQuote = escapeXmlExcludeAnchor = false;
		codeService = CodeConfiguration.getInstance().getCodeService() ;
	}

    private void evaluateExpressions() throws JspException {
		try {
			value = (String) ExpressionUtil.evalNotNull("out", "value", value_, String.class, this, pageContext);
			
			LookupCode lookupCode = new LookupCode();
			lookupCode.setCodeGroup(codeType);
			
			
			System.out.print("[SAVE evaluateExpressions XXXXXXXXXXXXXXXX} codeType >"+codeType);
			
			//세션에 저장된 locale 정보를 조회
			HttpSession httpSession = this.pageContext.getSession() ; 
			Locale locale= (Locale)httpSession.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
			
			// 세션에 저장된 정보가 있는 경우.
			if(locale != null) {
				lookupCode.setLanguage(locale.getLanguage());
			}else{//세션에 저장된 정보가 없는 경우, 디폴트 설정
				lookupCode.setLanguage(this.requestContext.getLocale().getLanguage()); 
			}
			
			//기본 codeName 값을 구할때
			if (StringUtils.hasText(codeType) && (option == null || "".equals(option))) {
				lookupCode.setCode((String) value);
				
				if(var != null && (lookupCode.getCode() == null || lookupCode.getCode().equals(""))){
					value = codeService.getCodeListFromCache(lookupCode) ;					
				}else{
					//value = codeService.getCode(lookupCode).getMeaning(); //from DB
					LookupCode code = codeService.getCodeNameFromCache(lookupCode);
					if(code != null){
						value = codeService.getCodeNameFromCache(lookupCode).getMeaning(); //from Cache
					}else{
						value = null;
					}
				}
			}
			//옵션값이 있는 경우 : radio, checkbox, listbox 등 
			else if (StringUtils.hasText(codeType) && (option != null && !"".equals(option))) {
				
				System.out.print("[Scodes skdfjskdfjksdjfkdjfk] >"+lookupCode);
				
				lookupCode.setLanguage("ALL");
				lookupCode.setCodeGroup(codeType);
				
				List<LookupCode> codes = codeService.getCodeList(lookupCode);
				//List<LookupCode> codes = codeServiceimpl.getCodeListFromCache(lookupCode);
				
				System.out.print("[Scodes skdfjskdfjksdjfkdjfk] >"+codes);
				
				if(codes != null){
					value = makeStr(codes, true); //from Cache
				}else{
					value = null;
				}
			}
			
			if(var != null) {
				pageContext.setAttribute(var, value);
				value = null;
			}
			
			escapeXml = false;
			Boolean escape = ((Boolean) ExpressionUtil.evalNotNull("out", "escapeXml", escapeXml_, Boolean.class, this, pageContext));
			if (escape != null)
				escapeXml = escape.booleanValue();

			if ("".equals(value) || null == value) {
				value = null;
				escapeXml = false;
			}
			
		} catch (NullAttributeException ex) {
			ex.printStackTrace();
			value = null;
		}
		try {
			def = (String) ExpressionUtil.evalNotNull("out", "default", default_, String.class, this, pageContext);
		} catch (NullAttributeException ex) {
			ex.printStackTrace(System.out);
			def = null;
		}
		
    }
    
    private String makeStr(List<LookupCode> codes, boolean escape){
    	StringBuffer buffer = new StringBuffer();
    	int i = 0; 
    	if(codes != null){
	    	for(LookupCode code : codes){
	    		
	    		// include 옵션있을때.. 필터링
	    		if(StringUtils.hasText(include)){
	    			if(includeCode(code)){
			    		makeOptoinString(buffer, i, code, escape);
			    		i++;
		    		}
	    		}
	    		// exclude 옵션 필터링
	    		else if(StringUtils.hasText(exclude)){
	    			if(!excludeCode(code)){
			    		makeOptoinString(buffer, i, code, escape);
			    		i++;
		    		}
	    		}
	    		// 전체 코드
	    		else{
	    			makeOptoinString(buffer, i, code, escape);
		    		i++;
	    		}	    		
	    	}
    	}
    	return buffer.toString();
    }

	private void makeOptoinString(StringBuffer buffer, int i, LookupCode code, boolean escape) {
		String codeId = code.getCodeId() ;
		String codeName = escapeXml(code.getDescription(), escape) ;
		if("listbox".equals(option)){
			buffer.append("<option value='"+codeId+"' "+(checkableItem(String.valueOf(value),codeId)?"selected='selected'":"")+">"+codeName+"</option>");
		}else{
			if("radio".equals(option)){
				buffer.append("<input type='radio'");
				
			}else if("checkbox".equals(option)){
				buffer.append("<input type='checkbox'");
			}
			buffer.append(" id='"+inputName+"_" + i + "'")
			.append(" name='"+inputName+"' ")
			.append(" value='"+codeId+"' ")
			.append(checkableItem(String.valueOf(value),codeId) ? " checked='checked'":"")
			.append((StringUtils.hasText(cssClass)) ? " class='"+cssClass+"'" : "")
			.append((StringUtils.hasText(style)) ? " style='"+style+"'" : "")
			.append((StringUtils.hasText(attr)) ? " " + attr : "")
			.append("/>&nbsp;")
			.append("<label for='"+inputName+"_" + i + "'>"+codeName+"</label>&nbsp;&nbsp;&nbsp;");
		}		
	}
	
	private boolean checkableItem(String codeValues, String compCodeId){
		if(codeValues!=null && codeValues.length()>0){
			String values[] = codeValues.split(",");
			for(String codeVal : values){
				if(codeVal.trim().equals(compCodeId)){
					return true ;
				}
			}
		}
		return false ;
	}
    
    private boolean includeCode(LookupCode code){
    	
    	if(include!= null && include.length()>0){
	    	String values[] = include.split(",");
			for(String codeId : values){
				if(codeId.trim().equals(code.getCode())){
					return true ;
				}
			}
    	}
    	/*String codeId = code.getLookupCodeId() ;
    	if(include != null && include.indexOf(codeId) != -1){
    		return true ;
    	}*/
    	return false ;
    }
    private boolean excludeCode(LookupCode code){
    	if(exclude!= null && exclude.length()>0){
	    	String values[] = exclude.split(",");
			for(String codeId : values){
				if(codeId.trim().equals(code.getCode())){
					return true ;
				}
			}
    	}
    	/*String codeId = code.getLookupCodeId() ;
    	if(exclude != null && exclude.indexOf(codeId) != -1){
    		return true ;
    	}*/
    	return false ;
    } 
    private String escapeXml(String str, boolean escape ) {
    	String retStr = str;
    	  
    	if(escape && str.length() > 0){
	    	retStr = retStr.replaceAll("<", "&lt" );
	    	retStr = retStr.replaceAll(">", "&gt");
	    	retStr = retStr.replaceAll("\"", "&quot;");
	    	retStr = retStr.replaceAll("\'", "&#39;");
    	}
    	return retStr;
	}
    
   
}
