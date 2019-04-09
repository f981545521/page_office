<%@ page language="java" 
import="java.util.*,com.zhuozhengsoft.pageoffice.*"
 pageEncoding="utf-8"%>

<%
String url=request.getSession().getServletContext().getRealPath("FileMakerSingle/doc/"+"/");
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

        //转换完毕
        function ConvertFiles() {
            //页面自刷新
            document.getElementById("iframe1").src = "FileMakerSingle.jsp";
        }
    </script>

</head>
<body>
    <form id="form1">
    <div style="text-align: center;">
        <br />
        <span style="color: Red; font-size: 12px;">演示：把数据填充到模板中生成正式的word文件，请点下面的按钮进行转换</span><br />
        <input id="Button1" type="button" value="转换Word文件" onclick="ConvertFiles()" />
        <div id="aDiv" style="display: none; color: Red; font-size: 12px;">
            <span>转换完成，可在下面的地址中打开文件名为“maker.doc”的Word文件，查看转换的效果：<%=url %></span>
        </div>
    </div>
    <div style="width: 1px; height: 1px; overflow: hidden;">
        <iframe id="iframe1" name="iframe1" src=""></iframe>
    </div>
    </form>
</body>
</html>