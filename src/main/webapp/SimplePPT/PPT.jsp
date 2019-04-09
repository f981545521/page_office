<%@ page language="java"
	import="java.util.*,com.zhuozhengsoft.pageoffice.*"
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
poCtrl.webOpen("doc/test.ppt",OpenModeType.pptNormalEdit,"张佚名");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style>
#main{
	width:1040px;
	height:890px;
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

   
<div id="main">
<div id="shut"><img src="../js/close.png"  onclick="Close()" title="关闭" /></div>
<div id="content"  style="height:850px;width:1036px;overflow:hidden;">
<%=poCtrl.getHtmlCode("PageOfficeCtrl1")%>
</div>
</div>
</body>
</html>
