<%@ page language="java"
	import="java.util.*, java.text.*,com.zhuozhengsoft.pageoffice.*, com.zhuozhengsoft.pageoffice.excelreader.*"
	pageEncoding="utf-8"%>

<%@ taglib uri="http://java.pageoffice.cn" prefix="po"%>
<%
	Workbook workBook = new Workbook(request, response);
	Sheet sheet = workBook.openSheet("Sheet1");
	Table table = sheet.openTable("B4:F13");
	String content = "";
	int result = 0;
	while (!table.getEOF()) {
		//获取提交的数值
		if (!table.getDataFields().getIsEmpty()) {
			content += "<br/>月份名称："
					+ table.getDataFields().get(0).getText();
			content += "<br/>计划完成量："
					+ table.getDataFields().get(1).getText();
			content += "<br/>实际完成量："
					+ table.getDataFields().get(2).getText();
			content += "<br/>累计完成量："
					+ table.getDataFields().get(3).getText();
			if (table.getDataFields().get(2).getText().equals(null)
					|| table.getDataFields().get(2).getText().trim().length()==0
                      ) {
				content += "<br/>完成率：0%";
			} else {
				float f = Float.parseFloat(table.getDataFields().get(2)
						.getText());
				f = f / Float.parseFloat(table.getDataFields().get(1).getText());
				DecimalFormat df=(DecimalFormat)NumberFormat.getInstance();
				content += "<br/>完成率：" + df.format(f*100)+"%";
			}
			content +="</br>";
		}
		//循环进入下一行
		table.nextRow();
	}
	table.close();
	workBook.showPage(500, 400);
	workBook.close();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
		<title>SaveData</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">

	</HEAD>
	<body>
	<div style=" border:solid 1px gray; ">
        <div class="errTopArea" style="text-align: left;border-bottom:solid 1px gray;">
            [提示标题：这是一个开发人员可自定义的对话框]</div>
        <div class="errTxtArea" style="height: 88%; text-align: left">
            <b class="txt_title">
                <div style="color: #FF0000;">
                    提交的信息如下：</div>
                <%=content%>
            </b>
        </div>
        
    </div>
	</body>
</HTML>

