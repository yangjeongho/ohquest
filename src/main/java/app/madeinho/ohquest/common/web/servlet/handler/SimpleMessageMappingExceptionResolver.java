package app.madeinho.ohquest.common.web.servlet.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.AbstractHandlerExceptionResolver;

//import com.acube.unitel.common.exception.AcubeException;

/**
 * AcubeException을 상속받는 하위클래스들에 한하여
 * message properties 의 키값을 view로 보내준다.
 * 
 * @author YangByeongSub
 * @since 1.0
 * 
 */
public class SimpleMessageMappingExceptionResolver extends AbstractHandlerExceptionResolver {

	private static final Logger logger = LoggerFactory.getLogger(SimpleMessageMappingExceptionResolver.class);

	/** The default name of the exception attribute: "exception". */
	public static final String DEFAULT_EXCEPTION_ATTRIBUTE = "exception";

	private String viewName;

	private String exceptionAttribute = DEFAULT_EXCEPTION_ATTRIBUTE;

	public void setViewName(String viewName) {
		this.viewName = viewName;
	}

	@Override
	protected ModelAndView doResolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
		if (viewName == null) {
			return null;
		}
		//int depth = getDepth(AcubeException.class.getName(), ex);
		int depth = 0;
		if (depth >= 0 && depth < Integer.MAX_VALUE) {
		/*	if(logger.isDebugEnabled()){
				logger.debug("URI: {}", request.getRequestURI());
				logger.debug("ExceptionName: {}", ex.getClass().getName());
				logger.debug(ex.getMessage(), ex.getCause());
			}
			ModelAndView mav = getModelAndView(viewName, ex);
			AcubeException ae = (AcubeException) ex;
			mav.addObject("messageCode", ae.getMessageCode());
			mav.addObject("message", ae.getMessage());*/
			return null;
		} else {
			return null;
		}
	}

	/**
	 * Return the depth to the superclass matching.
	 * <p>
	 * 0 means ex matches exactly. Returns -1 if there's no match. Otherwise,
	 * returns depth. Lowest depth wins.
	 */
	protected int getDepth(String exceptionMapping, Exception ex) {
		return getDepth(exceptionMapping, ex.getClass(), 0);
	}

	private int getDepth(String exceptionMapping, Class exceptionClass, int depth) {
		if (exceptionClass.getName().contains(exceptionMapping)) {
			// Found it!
			return depth;
		}
		// If we've gone as far as we can go and haven't found it...
		if (exceptionClass.equals(Throwable.class)) {
			return -1;
		}
		return getDepth(exceptionMapping, exceptionClass.getSuperclass(), depth + 1);
	}

	/**
	 * Return a ModelAndView for the given view name and exception.
	 * <p>
	 * The default implementation adds the specified exception attribute. Can be
	 * overridden in subclasses.
	 * 
	 * @param viewName
	 *            the name of the error view
	 * @param ex
	 *            the exception that got thrown during handler execution
	 * @return the ModelAndView instance
	 * @see #setExceptionAttribute
	 */
	protected ModelAndView getModelAndView(String viewName, Exception ex) {
		ModelAndView mv = new ModelAndView(viewName);
		if (this.exceptionAttribute != null) {
			if (logger.isDebugEnabled()) {
				logger.debug("Exposing Exception as model attribute '" + this.exceptionAttribute + "'");
			}
			mv.addObject(this.exceptionAttribute, ex);
		}
		return mv;
	}

}
