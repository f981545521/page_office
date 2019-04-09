<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page
	import="com.zhuozhengsoft.pageoffice.*,com.zhuozhengsoft.pageoffice.wordreader.*"%>
<%
	FileSaver fs = new FileSaver(request, response);
        //String aa=fs.getFileExtName();
	if (fs.getFileExtName().equals(".jpg")) {
		fs.saveToFile(request.getSession().getServletContext().getRealPath("SaveFirstPageAsImg/images")+"/"+fs.getFileName());
	} else {
		fs.saveToFile(request.getSession().getServletContext().getRealPath("SaveFirstPageAsImg/doc")+ "/" + fs.getFileName());
	}
	fs.setCustomSaveResult("ok");
	fs.close();
%>

