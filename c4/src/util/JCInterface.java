package util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface JCInterface {

	public void process(HttpServletRequest request, HttpServletResponse response);
}
