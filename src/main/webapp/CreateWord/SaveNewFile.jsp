<%@ page language="java"
	import="java.sql.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.text.SimpleDateFormat,java.util.Date,com.zhuozhengsoft.pageoffice.*"
	pageEncoding="gb2312"%>
<%
	//���屣�����
	FileSaver fs = new FileSaver(request, response);

	Class.forName("org.sqlite.JDBC");
			String strUrl = "jdbc:sqlite:"
				+ this.getServletContext().getRealPath("demodata/") + "\\CreateWord.db";
	Connection conn = DriverManager.getConnection(strUrl);
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select Max(ID) from word");
	int newID = 1;
	if (rs.next()) {
		newID = Integer.parseInt(rs.getString(1)) + 1;
	}
	rs.close();
	
	String FileSubject = fs.getFormField("FileSubject").trim();
	String fileName = "aabb" + newID + ".doc"; 
	String getFile = (String) request.getParameter("FileSubject");
	if (getFile != null && getFile.length() > 0)
		FileSubject = new String(getFile.getBytes("iso-8859-1"));
	//out.print(FileSubject);
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
	// new Date()Ϊ��ȡ��ǰϵͳʱ��
	String strsql = "Insert into word(ID,FileName,Subject,SubmitTime) values("
			+ newID
			+ ",'"
			+ fileName
			+ "','"
			+ FileSubject
			+ "','"
			+ df.format(new Date()) + "')";
	stmt.executeUpdate(strsql);
	stmt.close();
	conn.close();
	
	//�����ļ�
	fs.saveToFile(request.getSession().getServletContext().getRealPath("CreateWord/doc") + "/" + fileName);
	//���ñ�����
	fs.setCustomSaveResult("ok");
	//fs.showPage(300,300);
	fs.close();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>My JSP 'SaveNewFile.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

	</head>

	<body>
		<br>
	</body>
</html>
