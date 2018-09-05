package com.blacksheep.mtm.common.utils;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import org.springframework.beans.factory.annotation.Value;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class PdfUtil {

    @Value("${AGREEMENT_PATH}")
    private static String AGREEMENT_PATH;
    @Value("${AGREEMENT_OUTPATH}")
    private static String AGREEMENT_OUTPATH;

    private static String pdfout(Map<String,Object> o) {
        // 模板路径
        String templatePath = "c:/zl/template.pdf";
        // 生成的新文件路径
        String outName = UUID.randomUUID().toString().replace("-","")+".pdf";
        String newPDFPath = "c:/zl/"+outName;

        PdfReader reader;
        FileOutputStream out;
        ByteArrayOutputStream bos;
        PdfStamper stamper;
        try {
            BaseFont bf = BaseFont.createFont("c://windows//fonts//simsun.ttc,1" , BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            Font FontChinese = new Font(bf, 5, Font.NORMAL);
            out = new FileOutputStream(newPDFPath);// 输出流
            reader = new PdfReader(templatePath);// 读取pdf模板
            bos = new ByteArrayOutputStream();
            stamper = new PdfStamper(reader, bos);
            AcroFields form = stamper.getAcroFields();
            //文字类的内容处理
            Map<String,String> datemap = (Map<String,String>)o.get("datemap");
            form.addSubstitutionFont(bf);
            for(String key : datemap.keySet()){
                String value = datemap.get(key);
                form.setField(key,value);
            }
            stamper.setFormFlattening(true);// 如果为false，生成的PDF文件可以编辑，如果为true，生成的PDF文件不可以编辑
            stamper.close();
            Document doc = new Document();
            Font font = new Font(bf, 12);
            PdfCopy copy = new PdfCopy(doc, out);
            doc.open();
            //每一页都复制
            Integer pdfPage = reader.getNumberOfPages();
            for (int i = 1;i<=pdfPage;i++){
                doc.newPage();
                PdfImportedPage importPage = copy.getImportedPage(new PdfReader(bos.toByteArray()),i);
                copy.addPage(importPage);
            }
            doc.close();

        } catch (IOException e) {
            System.out.println(e);
        } catch (DocumentException e) {
            System.out.println(e);
        }
        return outName;
    }

    public static void main(String[] args) {
        Map<String,String> map = new HashMap();
        map.put("a_name","长沙菲乐文化传播有限公司");
        map.put("legal_representative","凉白开");
        map.put("a_add","长沙");
        map.put("name","李白");
        map.put("sex","男");
        map.put("phone","185272135");
        map.put("dino","43251521456787");
        Map<String,Object> o=new HashMap();
        o.put("datemap",map);
        pdfout(o);
    }
}
