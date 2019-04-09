<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.zhuozhengsoft.pageoffice.*"%>
<%
FileSaver fs = new FileSaver(request, response);
fs.saveToFile(request.getSession().getServletContext().getRealPath("TaoHong/doc/") + "/" + fs.getFileName());
//fs.showPage(300,300);
fs.close();
%>

