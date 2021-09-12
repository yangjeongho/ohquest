package app.madeinho.ohquest.common.tag;

import javax.servlet.jsp.JspException;

import org.apache.taglibs.standard.tag.common.core.NullAttributeException;
import org.apache.taglibs.standard.tag.common.core.OutSupport;
import org.apache.taglibs.standard.tag.el.core.ExpressionUtil;

//import com.acube.unitel.co.member.domain.Member;

public class SecOutTag extends OutSupport {

	private static final long serialVersionUID = -4146300346814560551L;

    private String value_;
    private String default_;
    private String escapeXml_;
    private String var; 

    public void setVar(String var) {
		this.var = var;
	}
	public SecOutTag() {
        super();
        init();
    }
    public int doStartTag() throws JspException {
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
	private void init() {
		value_ = default_ = escapeXml_ = null;
	}

    private void evaluateExpressions() throws JspException {
		try {
			value = (String) ExpressionUtil.evalNotNull("out", "value", value_, String.class, this, pageContext);
		//	Member memberInfo = TagConfiguration.getInstance().getCurrentMember() ;
			/*value = memberInfo.getUserName();
			
			pageContext.setAttribute(var, memberInfo);*/
			value = null;
			
		} catch (NullAttributeException ex) {
			value = null;
		}
		try {
			def = (String) ExpressionUtil.evalNotNull("out", "default", default_, String.class, this, pageContext);
		} catch (NullAttributeException ex) {
			def = null;
		}
		escapeXml = false;
		Boolean escape = ((Boolean) ExpressionUtil.evalNotNull("out", "escapeXml", escapeXml_, Boolean.class, this, pageContext));
		if (escape != null)
			escapeXml = escape.booleanValue();

		if ("".equals(value) || null == value) {
			value = null;
			escapeXml = false;
		}
    }    
}
