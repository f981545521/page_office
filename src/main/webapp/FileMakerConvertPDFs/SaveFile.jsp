<%@ page language="java" import="java.util.*,com.zhuozhengsoft.pageoffice.*" contentType="text/html;charset=gb2312"%>
<%

    FileSaver fs = new FileSaver(request, response);
    fs.saveToFile(request.getSession().getServletContext().getRealPath("FileMakerConvertPDFs/doc/")+"/"+fs.getFileName());
    fs.close();
%>

