package com.zzzy.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhuozhengsoft.pageoffice.FileSaver;
import com.zhuozhengsoft.pageoffice.OpenModeType;
import com.zhuozhengsoft.pageoffice.PageOfficeCtrl;

@Controller
@RequestMapping("/demo")
public class DemoController {

    @RequestMapping("/index")
    public String index(){
        return "index";
    }
    
    @RequestMapping("/word")
    public String openWord(HttpServletRequest request, Map<String,Object> map){
    	String path = request.getServletContext().getRealPath("");
    	
    	PageOfficeCtrl poCtrl=new PageOfficeCtrl(request);
		poCtrl.setServerPage(request.getContextPath()+"/poserver.zz");//设置服务页面
		poCtrl.addCustomToolButton("保存","Save",1);//添加自定义保存按钮
		poCtrl.addCustomToolButton("盖章","AddSeal",2);//添加自定义盖章按钮
		poCtrl.setSaveFilePage("save");//设置处理文件保存的请求方法
		//打开word
		poCtrl.webOpen(path + "\\doc\\test.doc",OpenModeType.docAdmin,"张三");
		map.put("pageoffice",poCtrl.getHtmlCode("PageOfficeCtrl1"));

        return "word";
    }
    
    @RequestMapping("/save")
    public void save(HttpServletRequest request, HttpServletResponse response){
    	String path = request.getServletContext().getRealPath("");
    	
        FileSaver fs = new FileSaver(request, response);
        fs.saveToFile(path + "\\doc\\test.doc");
        fs.close();
    }
}