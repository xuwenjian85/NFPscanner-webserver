/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.64
 * Generated at: 2016-01-02 15:56:20 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.error;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class supportInfo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<HTML class=\"win msie msie8 trident trident8\" dbversion=\"\"\r\n");
      out.write("\twebversion=\"3.1.2.8\" contextpath=\"\" jQuery171007082987662055995=\"2\">\r\n");
      out.write("<HEAD>\r\n");
      out.write("<TITLE>NFPscancer</TITLE>\r\n");
      out.write("<META http-equiv=Content-Type content=\"text/html; charset=utf-8\">\r\n");
      out.write("<link rel=\"shortcut icon\" href=\"static/image/w1.png\" />\r\n");
      out.write("<LINK href=\"static/css/release1.css\" rel=stylesheet type=text/css>\r\n");
      out.write("<LINK href=\"static/css/min.ie.css\" rel=stylesheet type=text/css>\r\n");
      out.write("<NOSCRIPT></NOSCRIPT>\r\n");
      out.write("<SCRIPT src=\"static/js/release.js\" type=text/javascript></SCRIPT>\r\n");
      out.write("\r\n");
      out.write("<SCRIPT src=\"http://www.google-analytics.com/ga.js\" type=text/javascript\r\n");
      out.write("\tasync=\"true\"></SCRIPT>\r\n");
      out.write("\r\n");
      out.write("<SCRIPT src=\"static/js/ga.js\" type=text/javascript></SCRIPT>\r\n");
      out.write("\r\n");
      out.write("<SCRIPT src=\"http://www.google-analytics.com/ga.js\" type=text/javascript\r\n");
      out.write("\tasync=\"true\"></SCRIPT>\r\n");
      out.write("\r\n");
      out.write("<SCRIPT id=gjzonedword20150522\r\n");
      out.write("\tsrc=\"http://s.pc.qq.com/pcmgr/zonedword/gjzonedword20150522.js\"\r\n");
      out.write("\tcharset=UTF-8 gjguid=\"e69b20d876f26645286b98b102d0ef09\" bid=\"1\"\r\n");
      out.write("\tsename=\"Ñ×ÌÌ·\"\r\n");
      out.write("\tseurl=\"https://www.baidu.com/s?wd=%s&amp;tn=98012088_5_dg&amp;ch=11\"></SCRIPT>\r\n");
      out.write("</HEAD>\r\n");
      out.write("<BODY id=error_page tooltipsenabled=\"true\"\r\n");
      out.write("\tjQuery171007082987662055995=\"3\">\r\n");
      out.write("\t<DIV id=page>\r\n");
      out.write("\t\t<A href=\"\">\r\n");
      out.write("\t\t\t<!--<SPAN id=logo_big></SPAN>-->\r\n");
      out.write("\t\t</A>\r\n");
      out.write("\t\t<DIV class=message id=info_content>\r\n");
      out.write("\t\t\t<H1>A problem with your browser</H1>\r\n");
      out.write("\t\t\t<P>You are using a very old version of Internet Explorer.\r\n");
      out.write("\t\t\t\tUnfortunately, Internet Explorer is slower, buggier, and less\r\n");
      out.write("\t\t\t\tstandards-compliant than other browsers. Because of this, NFPscancer\r\n");
      out.write("\t\t\t\tdoes not support old versions of Internet Explorer.</P>\r\n");
      out.write("\t\t\t<P>However, you can quickly upgrade your browser, and you'll be\r\n");
      out.write("\t\t\t\tusing NFPscancer is no time! We recommend you upgrade to an\r\n");
      out.write("\t\t\t\talternative browser than Internet Explorer, though all of the\r\n");
      out.write("\t\t\t\tbrowsers listed below are supported.</P>\r\n");
      out.write("\t\t\t<DIV id=browsers>\r\n");
      out.write("\t\t\t\t<A href=\"http://www.google.com/chrome\" target=_blank>\r\n");
      out.write("\t\t\t\t\t<DIV class=\"ui-browserupdate-icon chrome\">\r\n");
      out.write("\t\t\t\t\t\t<SPAN class=ui-browserupdate-name>Chrome</SPAN>\r\n");
      out.write("\t\t\t\t\t</DIV>\r\n");
      out.write("\t\t\t\t</A><A href=\"http://www.apple.com/safari/download/\" target=_blank>\r\n");
      out.write("\t\t\t\t\t<DIV class=\"ui-browserupdate-icon safari\">\r\n");
      out.write("\t\t\t\t\t\t<SPAN class=ui-browserupdate-name>Safari</SPAN>\r\n");
      out.write("\t\t\t\t\t</DIV>\r\n");
      out.write("\t\t\t\t</A><A href=\"http://firefox.com\" target=_blank>\r\n");
      out.write("\t\t\t\t\t<DIV class=\"ui-browserupdate-icon firefox\">\r\n");
      out.write("\t\t\t\t\t\t<SPAN class=ui-browserupdate-name>Firefox</SPAN>\r\n");
      out.write("\t\t\t\t\t</DIV>\r\n");
      out.write("\t\t\t\t</A><A\r\n");
      out.write("\t\t\t\t\thref=\"http://windows.microsoft.com/en-US/internet-explorer/products/ie/home\"\r\n");
      out.write("\t\t\t\t\ttarget=_blank>\r\n");
      out.write("\t\t\t\t\t<DIV class=\"ui-browserupdate-icon msie\">\r\n");
      out.write("\t\t\t\t\t\t<SPAN class=ui-browserupdate-name>Internet Explorer</SPAN>\r\n");
      out.write("\t\t\t\t\t</DIV>\r\n");
      out.write("\t\t\t\t</A>\r\n");
      out.write("\t\t\t</DIV>\r\n");
      out.write("\t\t\t<DIV class=error_details exception=\"\"></DIV>\r\n");
      out.write("\t\t</DIV>\r\n");
      out.write("\t</DIV>\r\n");
      out.write("</BODY>\r\n");
      out.write("</HTML>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}