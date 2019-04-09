<%@ page language="java"
	import="java.util.*,com.zhuozhengsoft.pageoffice.*"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.pageoffice.cn" prefix="po"%>
<%
	FileSaver fs = new FileSaver(request, response);
	String id = request.getParameter("id");
	String err = "";
	if (id != null && id.length() > 0) {
		String fileName = "\\maker" + id + fs.getFileExtName();
		fs.saveToFile(request.getSession().getServletContext()
				.getRealPath("PrintFiles/doc")
				+ fileName);
	} else {
		err = "<script>alert('未获得文件名称');</script>";
	}
	fs.close();
%>
