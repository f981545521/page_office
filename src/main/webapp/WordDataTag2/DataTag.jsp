<%@ page language="java" import="java.util.*"
	import="java.util.* ,java.awt.* ,com.zhuozhengsoft.pageoffice.*,com.zhuozhengsoft.pageoffice.wordwriter.*,java.text.SimpleDateFormat,java.util.Date"
	pageEncoding="utf-8"%>
<%
	//PageOffice组件的使用
	//设置服务器页面
	PageOfficeCtrl pCtrl = new PageOfficeCtrl(request);
	pCtrl.setServerPage(request.getContextPath()+"/poserver.zz");
	//定义WordDocument对象
	WordDocument doc = new WordDocument();
	
	//定义DataTag对象
	DataTag deptTag = doc.openDataTag("{部门名}");
	deptTag.setValue("技术");
	
	DataTag userTag = doc.openDataTag("{姓名}");
	userTag.setValue("李四");
	
	DataTag dateTag = doc.openDataTag("【时间】");
	dateTag.setValue(new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString());
	
	pCtrl.setWriter(doc);
	//打开Word文件
	pCtrl.webOpen("doc/test2.doc", OpenModeType.docNormalEdit, "张佚名");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title>My JSP 'DataTag.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
            <%=pCtrl.getHtmlCode("PageOfficeCtrl1")%>
  </body>
</html>
