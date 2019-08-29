<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线打开文件</title>
</head>
<body>
<div style="width:1000px;height:700px;">
	${pageoffice}
</div>
<script type="text/javascript">
	/**
	 * 印章管理系统
	 * http://localhost:8080/loginseal.zz
	 */
	//加盖印章
	function AddSeal() {
		try {
			/**
			 *
			 *第一个参数，必填项，标识印章名称（当存在重名的印章时，默认选取第一个印章）；
			 *第二个参数，可选项，标识是否保护文档，为null时保护文档，为空字符串时不保护文档；
			 *第三个参数，可选项，标识盖章指定位置名称，须为英文或数字，不区分大小写
			 */
			//var bRet=document.getElementById("PageOfficeCtrl1").ZoomSeal.AddSealByName("MG",null,null);

			var bRet=document.getElementById("PageOfficeCtrl1").ZoomSeal.AddSeal("MG");
			if(bRet){
				alert("盖章成功！");
			}else{
				alert("盖章失败！");
			}
		} catch(e) {

		}
	}
</script>
</body>
</html>