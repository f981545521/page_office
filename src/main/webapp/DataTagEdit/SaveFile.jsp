<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.zhuozhengsoft.pageoffice.*,com.zhuozhengsoft.pageoffice.wordreader.*"%>
<%
FileSaver fs = new FileSaver(request, response);
fs.saveToFile(request.getSession().getServletContext().getRealPath("DataTagEdit/doc/") + "/" + fs.getFileName());
//fs.showPage(300,300);
fs.close();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <br>
  </body>
</html>
