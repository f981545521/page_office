<%@ page language="java" import="java.util.*,com.zhuozhengsoft.pageoffice.*" pageEncoding="utf-8"%>
<%
FileSaver fs=new FileSaver(request,response);
fs.saveToFile(request.getSession().getServletContext().getRealPath("SaveReturnValue/doc")+"/"+fs.getFileName());
fs.setCustomSaveResult("ok");//·µ»ØÖµ
fs.close();
%>

