<%@ page language="java" import="java.util.*,com.zhuozhengsoft.pageoffice.*" pageEncoding="UTF-8"%>
<%
FileSaver fs=new FileSaver(request,response);
fs.saveToFile(request.getSession().getServletContext().getRealPath("InsertSeal/Word/AddSeal3/")+"/"+fs.getFileName());
fs.close();
%>


