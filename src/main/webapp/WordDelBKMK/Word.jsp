<%@ page language="java"
	import="java.util.*,com.zhuozhengsoft.pageoffice.*,com.zhuozhengsoft.pageoffice.wordwriter.*"
	pageEncoding="utf-8"%>

<%
//******************************卓正PageOffice组件的使用*******************************
	PageOfficeCtrl poCtrl1 = new PageOfficeCtrl(request);
	poCtrl1.setServerPage(request.getContextPath()+"/poserver.zz"); //此行必须
	//隐藏菜单栏
	poCtrl1.setMenubar(true);
	//添加自定义按钮
    poCtrl1.addCustomToolButton("删除光标处的","delBookMark()",7);
    poCtrl1.addCustomToolButton("删除选中文本中的","delChoBookMark()",7);
	poCtrl1.webOpen("doc/template.doc", OpenModeType.docNormalEdit, "张三");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head> 
        <title>js删除光标位置的书签</title>

   </head>
<body>
    <span style="color:red"> 删除当前光标所在位置的光标::将光标放在指定书签上，点击删除当前光标所在位置书签按钮</span>
        <label>关键代码：点右键，选择“查看源文件”，看js函数：</label>
        <label style="color:blue">function  delBookMark()</label>
    <br/>
    <span style="color:red">删除所选文本中的书签：选择文本内容，点击删除选择文本内容中的书签按钮，然后看效果</span>
        <label >关键代码：点右键，选择“查看源文件”，看js函数：</label>
        <label style="color:blue">function  delChoBookMark()</label>
    <br/>
    <span>模板中的</span><span>【xxxxx】</span><span>代表书签;&nbsp;或者可以选择   插入->书签->定位进行查看书签位置</span><br/>
    <input id="Button1" type="button" onclick="delBookMark();"    value="删除当前光标所在位置的书签" /> &nbsp;&nbsp;
    <input id="Button1" type="button" onclick="delChoBookMark();" value="删除选中文本内容中的书签" /> &nbsp;&nbsp;
     <div style="width:auto; height:700px;">
                <%=poCtrl1.getHtmlCode("PageOfficeCtrl1")%>
    </div>
  <script type="text/javascript">
    //删除当前光标所在位置的书签
    function delBookMark() {
	  var mac = "Function myfunc()" + " \r\n"
	 + "If Application.Selection.Bookmarks.Count > 0 Then " + " \r\n"
	 + "   Application.Selection.Bookmarks(1).Select " + " \r\n"
	 + "   Application.Selection.Range.Delete " + " \r\n"  
	 + "  'Application.Selection.Bookmarks(1).Delete"+"\r\n" 
	 + "   Else"+"\r\n"
	 + '   MsgBox  "当前位置没有书签" ' +"\r\n"
	 + "End If " + " \r\n"
	 + "End Function " + " \r\n";
	  document.getElementById("PageOfficeCtrl1").RunMacro("myfunc", mac); 
    }
    //删除选中文本的内容中的书签   
	 function delChoBookMark() {
	 //判断当前是否选择了文本内容
	 if (document.getElementById("PageOfficeCtrl1").Document.Application.Selection.Range.Text != ""){
	  var mac = "Function myfunc()" + " \r\n"
	 + " If Application.Selection.Bookmarks.Count >= 1 Then " + " \r\n"
	 + "   ReDim aMarks(Application.Selection.Bookmarks.Count - 1)" + " \r\n"  
	 + "   i = 0"+"\r\n" 
	 + "   For Each aBookmark In Application.Selection.Bookmarks " + " \r\n"
	 + "   aMarks(i) = aBookmark.Name " + " \r\n"  
	 + "   i = i + 1"+"\r\n"
	 + "   Next aBookmark " + " \r\n"  
	 + "   For Each myElement In aMarks"+"\r\n" 
	 + "   ActiveDocument.Bookmarks(myElement).Select" + " \r\n"
	 + "   ActiveDocument.Bookmarks(myElement).Range.Delete"+" \r\n"
	 + "   Next" +"\r\n"
	 //判断选择文本中是否有书签
	 + "   Else" +"\r\n"
	 + '   MsgBox  "选择文本中没有书签" ' +"\r\n"
	 + "   End If "+ "\r\n"
	 + "   End Function " + " \r\n";
	 document.getElementById("PageOfficeCtrl1").RunMacro("myfunc", mac);  
	 }else{
	    document.getElementById("PageOfficeCtrl1").Alert("您没有选择任何文本");
	  }
      } 
</script>

</body>
</html>





