<%@ page language="java"
	import="java.util.*,com.zhuozhengsoft.pageoffice.*,java.sql.*,java.io.*,javax.servlet.*,javax.servlet.http.*"
	pageEncoding="utf-8"%>
<%@page import="com.zhuozhengsoft.pageoffice.wordwriter.DataRegion"%>
<%@page import="com.zhuozhengsoft.pageoffice.wordwriter.WordDocument"%>

<%!

// 拷贝文件
public void copyFile(String oldPath, String newPath){

		try {
			int bytesum = 0;
			int byteread = 0;
			File oldfile = new File(oldPath);
			if (oldfile.exists()) { //文件存在时 
				InputStream inStream = new FileInputStream(oldPath); //读入原文件 
				FileOutputStream fs = new FileOutputStream(newPath);
				byte[] buffer = new byte[1444];
				int length;
				while ((byteread = inStream.read(buffer)) != -1) {
					bytesum += byteread; //字节数 文件大小 
					//System.out.println(bytesum);
					fs.write(buffer, 0, byteread);
				}
				inStream.close();
			}
		} catch (Exception e) {
			System.out.println("复制单个文件操作出错");
			e.printStackTrace();
		}

}
%>
<%

	String fileName = "";
	String mbName = request.getParameter("mb");


	//***************************卓正PageOffice组件的使用********************************
	PageOfficeCtrl poCtrl1 = new PageOfficeCtrl(request);
	poCtrl1.setServerPage(request.getContextPath()+"/poserver.zz"); //此行必须
	poCtrl1.setCustomToolbar(false);
	poCtrl1.setSaveFilePage("savefile.jsp");
	
	if (mbName != null && mbName.trim() != "") {
		// 选择模板后执行套红
		
		// 复制模板，命名为正式发文的文件名：zhengshi.doc
		fileName = "zhengshi.doc";
		String templateName = request.getParameter("mb");
		String templatePath = getServletContext().getRealPath("TaoHong/doc/" + templateName);
		String filePath = getServletContext().getRealPath("TaoHong/doc/" + fileName);
		copyFile(templatePath, filePath); 

		// 填充数据和正文内容到“zhengshi.doc”
		WordDocument doc = new WordDocument();
		DataRegion copies = doc.openDataRegion("PO_Copies");
		copies.setValue("6");
		DataRegion docNum = doc.openDataRegion("PO_DocNum");
		docNum.setValue("001");
		DataRegion issueDate = doc.openDataRegion("PO_IssueDate");
		issueDate.setValue("2013-5-30");
		DataRegion issueDept = doc.openDataRegion("PO_IssueDept");
		issueDept.setValue("开发部");
		DataRegion sTextS = doc.openDataRegion("PO_STextS");
		sTextS.setValue("[word]doc/test.doc[/word]");
		DataRegion sTitle = doc.openDataRegion("PO_sTitle");
		sTitle.setValue("北京某公司文件");
		DataRegion topicWords = doc.openDataRegion("PO_TopicWords");
		topicWords.setValue("Pageoffice、 套红");
		poCtrl1.setWriter(doc);
		
	} else {
		//首次加载时，加载正文内容：test.doc
		fileName = "test.doc";
		
	}
	
	poCtrl1.webOpen("doc/" + fileName, OpenModeType.docNormalEdit, "张三");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title></title>
		<link href="images/csstg.css" rel="stylesheet" type="text/css" /> 
		<script type="text/javascript">
	//初始加载模板列表
	function load() {
		if (getQueryString("mb") != null)
			document.getElementById("templateName").value = getQueryString("mb");
	}

	//获取url参数 
	function getQueryString(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		else
			return null;
	}

	//套红
	function taoHong() {
		var mb = document.getElementById("templateName").value;
		document.getElementById("form1").action = "taoHong.jsp?mb=" + mb;

		document.forms[0].submit();
	}

	//保存并关闭
	function saveAndClose() {
		document.getElementById("PageOfficeCtrl1").WebSave();
		window.external.close();
	}
</script>

	</head>
	<body onload="load();" >
		<div id="header">
			<div style="float: left; margin-left: 20px;">
				<img src="images/logo.jpg" height="30" />
			</div>
			<ul>
				<li>
					<a target="_blank" href="http://www.zhuozhengsoft.com">卓正网站</a>
				</li>
				<li>
					<a target="_blank"
						href="http://www.zhuozhengsoft.com/poask/index.asp">客户问吧</a>
				</li>
				<li>
					<a href="#">在线帮助</a>
				</li>
				<li>
					<a target="_blank"
						href="http://www.zhuozhengsoft.com/about/about/">联系我们</a>
				</li>
			</ul>
		</div>
		<div id="content">
			<div id="textcontent" style="width: 1000px; height: 800px;">
				<div class="flow4">
					<a href="#" onclick="window.external.close();"> <img alt="返回" src="images/return.gif"
							border="0" />文件列表</a>
					<span style="width: 100px;"> </span><strong>文档主题：</strong>
					<span style="color: Red;">测试文件</span>
					<form method="post" id="form1">
						<strong>模板列表：</strong>
						<span style="color: Red;"> <select name="templateName"
								id="templateName" style='width: 240px;'>
								<option value='temp2008.doc' selected="selected">
									模板一
								</option>
								<option value='temp2009.doc'>
									模板二
								</option>
								<option value='temp2010.doc'>
									模板三
								</option>
							</select> </span>
						<span style="color: Red;"><input type="button" value="一键套红"
								onclick="taoHong()"/> </span>
						<span style="color: Red;"><input type="button" value="保存关闭"
								onclick="saveAndClose()"/> </span>
					</form>
				</div>
				<!--**************   卓正 PageOffice组件 ************************-->

				        <%=poCtrl1.getHtmlCode("PageOfficeCtrl1")%>
			</div>
		</div>
		<div id="footer">
			<hr width="1000" />
			<div>
				Copyright (c) 2012 北京卓正志远软件有限公司
			</div>
		</div>

	</body>
</html>
