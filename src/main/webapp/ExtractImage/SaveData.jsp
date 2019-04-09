<%@ page language="java" import="java.util.*,com.zhuozhengsoft.pageoffice.wordreader.*,java.io.*" pageEncoding="utf-8"%>
<%
	WordDocument doc=new WordDocument(request,response);
	DataRegion dr=doc.openDataRegion("PO_image");
	//将提取的图片保存到服务器上，图片的名称为:a.jpg
	dr.openShape(1).saveAsJPG(request.getSession().getServletContext().getRealPath("ExtractImage/doc/")+"/a.jpg");
	doc.setCustomSaveResult("保存成功,文件保存到："+request.getSession().getServletContext().getRealPath("ExtractImage/doc/")+"\\a.jpg");
	doc.close();
%>


