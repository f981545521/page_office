<%@ page language="java" 
import="java.util.*,com.zhuozhengsoft.pageoffice.*"
 pageEncoding="utf-8"%>

<%
String url=request.getSession().getServletContext().getRealPath("FileMakerPDF/doc/"+"/");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title></title>

    <script type="text/javascript">
        window.myFunc = function() {
            document.getElementById("aDiv").style.display = "";
            //alert('转换完毕！');
        };
        function ConvertFiles() {
            document.getElementById("iframe1").src = "FileMakerPDF.jsp";
        }
    </script>

</head>
<body>
    <form id="form1">
    <div style="text-align: center;">
        <br />
        <span style="color: Red; font-size: 12px;">演示：把数据填充到word模板中生成 PDF 文件，请点下面的按钮进行转换</span><br />
        <input id="Button1" type="button" value="转换Word文件为 PDF" onclick="ConvertFiles()" />
        <div id="aDiv" style="display: none; color: Red; font-size: 12px;">
            <span>转换完成，可在下面的地址中打开文件名为“maker.pdf”的 PDF 文件，查看转换的效果：<%=url %></span>
        </div>
    </div>
    <div style="width: 1px; height: 1px; overflow: hidden;">
        <iframe id="iframe1" name="iframe1" src=""></iframe>
    </div>
    </form>
</body>
</html>