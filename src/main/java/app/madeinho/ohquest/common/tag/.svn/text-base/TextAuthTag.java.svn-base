package app.madeinho.ohquest.common.tag;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.TagSupport;

/*import com.acube.unitel.co.member.domain.Member;
import com.acube.unitel.co.security.ElementsService;
import com.acube.unitel.co.security.SecurityService;
import com.acube.unitel.co.security.domain.Elements;*/

public class TextAuthTag  extends TagSupport{
	private static final long serialVersionUID = 1L;
	private String m_securityNo = null;
	private String m_btnId = null;
	
	//private SecurityService securityService ; 
	String secNo = "";
	
	public TextAuthTag() {
        super();
        init();
    }
	
	private void init() {
	//	securityService = TagConfiguration.getInstance().getSecurityService();
	}
	
	public int doStartTag() throws JspException {
		HttpSession httpSession = this.pageContext.getSession() ;
		HttpServletRequest req = (HttpServletRequest) pageContext.getRequest();
    	HttpServletResponse res = (HttpServletResponse) pageContext.getResponse();
	//	BufferedImage bImage = securityService.getCapCharImage(httpSession);
	 /*   if (bImage == null) {
	        res.setContentType("text/html; charset=utf-8");
	        
	        String message = "Error! Please try later.";
	        try {
	            PrintWriter out = res.getWriter();
	            out.println(message);
	            out.flush();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }else{
	    	JspWriter jw = pageContext.getOut();
	    	try {
				jw.clear();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	    	pageContext.pushBody();
	    	ServletOutputStream sos = null;
	        try {
	            res.setContentType("image/png; charset=utf-8");
	            ByteArrayOutputStream baos = new ByteArrayOutputStream();
	             
	       //     ImageIO.write(bImage, "png", baos);

	            byte buffer[] = baos.toByteArray();
	            
	            sos = res.getOutputStream();
	            sos.write(buffer);
	            sos.flush();
	            sos.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }*/
	    return EVAL_PAGE;
	}
	
	
	public void release() {
        super.release();
    }
}
