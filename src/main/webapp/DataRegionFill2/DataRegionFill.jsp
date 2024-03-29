<%@ page language="java"
	import="java.util.*,java.awt.*,com.zhuozhengsoft.pageoffice.*,com.zhuozhengsoft.pageoffice.wordwriter.*"
	pageEncoding="utf-8"%>
<%
	PageOfficeCtrl poCtrl1 = new PageOfficeCtrl(request);
	poCtrl1.setServerPage(request.getContextPath()+"/poserver.zz"); //此行必须
	WordDocument doc = new WordDocument();
	//打开数据区域
	DataRegion dataRegion1 = doc.openDataRegion("PO_userName");
	//给数据区域赋值
	dataRegion1.setValue("张三");
	//设置字体样式
    dataRegion1.getFont().setColor(Color.blue);
    dataRegion1.getFont().setSize(24);
    dataRegion1.getFont().setName("隶书");
    dataRegion1.getFont().setBold(true);
    
	DataRegion dataRegion2 = doc.openDataRegion("PO_deptName");
	dataRegion2.setValue("销售部");
	dataRegion2.getFont().setColor(Color.red);
	
	poCtrl1.setWriter(doc);
	//隐藏菜单栏
	poCtrl1.setMenubar(false);
	//隐藏工具栏
	poCtrl1.setCustomToolbar(false);
	//打开Word文件
	poCtrl1.webOpen("doc/test.doc", OpenModeType.docNormalEdit, "张三");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>简单的给Word文档中的数据区域赋值</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">


	</head>

	<body>
		<div style="width: auto; height: 700px;">
			<%=poCtrl1.getHtmlCode("PageOfficeCtrl1")%>
		</div>
	</body>
</html>
