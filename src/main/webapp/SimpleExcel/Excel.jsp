<%@ page language="java"
	import="java.util.*,com.zhuozhengsoft.pageoffice.*,com.zhuozhengsoft.pageoffice.excelwriter.*"
	pageEncoding="utf-8"%>
<%
PageOfficeCtrl poCtrl=new PageOfficeCtrl(request);
//设置服务器页面
poCtrl.setServerPage(request.getContextPath()+"/poserver.zz");
//添加自定义按钮
poCtrl.addCustomToolButton("保存","Save",1);
poCtrl.addCustomToolButton("关闭","Close",21);
//设置保存页面
poCtrl.setSaveFilePage("SaveFile.jsp");
//打开Word文档
poCtrl.webOpen("doc/test.xls",OpenModeType.xlsNormalEdit,"张佚名");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>最简单的打开保存Excel文件</title>
     
       
    
 <style>
#main{
	width:750px;
	height:800px;
	border:#83b3d9 2px solid;
	background:#f2f7fb;
	
}
#shut{
	width:45px;
	height:30px;
	float:right;
	margin-right:-1px;
}
#shut:hover{
	}
</style>
</head>
<body style="overflow:hidden" >
    <script type="text/javascript">
        function Save() {
            document.getElementById("PageOfficeCtrl1").WebSave();
        }
        function Close() {
               window.external.close();
        }
    </script>
    <form id="form1">
   <div id="main">
<div id="shut"><img src="../js/close.png"  onclick="Close()" title="关闭" /></div>
<div id="content"  style="height:750px;width:750px;overflow-y:hidden;">
<%=poCtrl.getHtmlCode("PageOfficeCtrl1")%>
</div>
    </form>
</body>
</html>
