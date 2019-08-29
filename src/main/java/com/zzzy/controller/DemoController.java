package com.zzzy.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhuozhengsoft.pageoffice.wordwriter.Table;
import com.zhuozhengsoft.pageoffice.wordwriter.WordDocument;
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
    @RequestMapping("/word2")
    public String openWord2(HttpServletRequest request, Map<String,Object> map){
    	String path = request.getServletContext().getRealPath("");

    	PageOfficeCtrl poCtrl=new PageOfficeCtrl(request);
		poCtrl.setServerPage(request.getContextPath()+"/poserver.zz");//设置服务页面
		poCtrl.addCustomToolButton("保存","Save",1);//添加自定义保存按钮
		poCtrl.addCustomToolButton("盖章","AddSeal",2);//添加自定义盖章按钮
		poCtrl.setSaveFilePage("save");//设置处理文件保存的请求方法

        WordDocument doc = new WordDocument();
        Table table1 = doc.openDataRegion("PO_TABLE").openTable(1);
        int size = 3;

        // 填充数据
        table1.openCellRC(2, 2).setValue("AA");
        table1.openCellRC(2, 3).setValue("BB");
        table1.openCellRC(2, 4).setValue("CC");
        table1.openCellRC(2, 5).setValue("DD");
        table1.openCellRC(2, 6).setValue("EE");
        // 扩充表格  //在第2行的最后一个单元格下插入新行
        table1.insertRowAfter(table1.openCellRC(2, 5));
        // 填充数据
        table1.openCellRC(3, 2).setValue("AA");
        table1.openCellRC(3, 3).setValue("BB");
        table1.openCellRC(3, 4).setValue("CC");
        table1.openCellRC(3, 5).setValue("DD");
        table1.openCellRC(3, 6).setValue("EE");
        // 扩充表格  //在第2行的最后一个单元格下插入新行
        table1.insertRowAfter(table1.openCellRC(3, 5));
        // 填充数据
        table1.openCellRC(4, 2).setValue("AA");
        table1.openCellRC(4, 3).setValue("BB");
        table1.openCellRC(4, 4).setValue("CC");
        table1.openCellRC(4, 5).setValue("DD");
        table1.openCellRC(4, 6).setValue("EE");
        // 扩充表格  //在第2行的最后一个单元格下插入新行
        table1.insertRowAfter(table1.openCellRC(4, 5));
        //代理人：——————————————————————————————申请人到第4行

        // 填充数据
        table1.openCellRC(7, 2).setValue("AA");
        table1.openCellRC(7, 3).setValue("BB");
        table1.openCellRC(7, 4).setValue("CC");
        table1.openCellRC(7, 5).setValue("DD");
        table1.openCellRC(7, 6).setValue("EE");
        // 扩充表格  //在第2行的最后一个单元格下插入新行
        // 填充数据
        table1.openCellRC(8, 2).setValue("AA");
        table1.openCellRC(8, 3).setValue("BB");
        table1.openCellRC(8, 4).setValue("CC");
        table1.openCellRC(8, 5).setValue("DD");
        table1.openCellRC(8, 6).setValue("EE");
        // 扩充表格  //在第2行的最后一个单元格下插入新行
        table1.insertRowAfter(table1.openCellRC(8, 5));


        table1.openCellRC(1, 1).mergeTo(5, 1);
        table1.openCellRC(1, 1).setValue("申请人");

        table1.openCellRC(6, 1).mergeTo(9, 1);
        table1.openCellRC(1, 2).setValue("代理人");

        //Table dlrTable = doc.openDataRegion("PO_TABLE_DLR").openTable(1);
//
        //// 扩充表格  //在第2行的最后一个单元格下插入新行
        //dlrTable.insertRowAfter(table1.openCellRC(1, 5));
        //// 填充数据
        //dlrTable.openCellRC(1, 2).setValue("方法");
        //dlrTable.openCellRC(1, 3).setValue("方法");
        //dlrTable.openCellRC(1, 4).setValue("发");
        //dlrTable.openCellRC(1, 5).setValue("方法");
        //dlrTable.openCellRC(1, 6).setValue("法国");
        poCtrl.setWriter(doc);
		//打开word
		poCtrl.webOpen(path + "\\doc\\公证申请表(个人).docx",OpenModeType.docAdmin,"张三");
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