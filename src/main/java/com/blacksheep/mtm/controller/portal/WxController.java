package com.blacksheep.mtm.controller.portal;

import com.alibaba.fastjson.JSONObject;
import com.blacksheep.mtm.pojo.common.Result;
import com.blacksheep.mtm.service.WxService;
import com.blacksheep.mtm.wx.HttpUtil;
import com.blacksheep.mtm.wx.WxSignUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("/wx")
public class WxController {
    private static final Logger LOGGER = LoggerFactory.getLogger(WxController.class);


    @Value("${WX_TOKEN}")
    private String WX_TOKEN;

    @Value("${WX_APPID}")
    private String WX_APPID;

    @Value("${WX_APPKEY}")
    private String WX_APPKEY;

    @Value("${MINIAPP_APPID}")
    private String MINIAPP_APPID;

    @Value("${MINIAPP_APPSECRET}")
    private String MINIAPP_APPSECRET;

    @Autowired
    private WxService wxService;

    @ResponseBody
    @RequestMapping(value = "/connect",method = {RequestMethod.POST,RequestMethod.GET})
    public void wxGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        request.setCharacterEncoding("UTF-8");  //微信服务器POST消息时用的是UTF-8编码，在接收时也要用同样的编码，否则中文会乱码；
        response.setCharacterEncoding("UTF-8"); //在响应消息（回复消息给用户）时，也将编码方式设置为UTF-8，原理同上；
        boolean isGet = request.getMethod().toLowerCase().equals("get");

        PrintWriter out = response.getWriter();
        try {
            if (isGet) {
                String signature = request.getParameter("signature");// 微信加密签名
                String timestamp = request.getParameter("timestamp");// 时间戳
                String nonce = request.getParameter("nonce");// 随机数
                String echostr = request.getParameter("echostr");//随机字符串
                if(WxSignUtil.checkSignature(WX_TOKEN, signature, timestamp, nonce)){
                    LOGGER.info("Connect the weixin server is successful.");
                    response.getWriter().write(echostr);
                } else {
                    LOGGER.error("Failed to verify the signature!");
                }
            }else {
                String respMessage = "异常消息！";
                try {
                    out.write(respMessage);
                    LOGGER.info("The request completed successfully");
                    LOGGER.info("to weixin server "+respMessage);
                } catch (Exception e) {
                    LOGGER.error("Failed to convert the message from weixin!");
                }
            }
        }catch (Exception e){
            LOGGER.error("Connect the weixin server is error.");
        }finally {
            out.close();
        }
    }

    @RequestMapping("/auth/{phone}")
    @ResponseBody
    public Result<JSONObject> wxAuth(HttpServletRequest request, HttpServletResponse response,@PathVariable("phone") String phone) throws IOException{
        String code=request.getParameter("code");//客户端传回来的授权码
        String atokenUrl="https://api.weixin.qq.com/sns/oauth2/access_token";
        String ret = HttpUtil.sendGet(atokenUrl,"appid="+ WX_APPID +"&secret="+WX_APPKEY+"&code="+code+"&grant_type=authorization_code");//返回带token的json字符串
        JSONObject object = JSONObject.parseObject(ret);
        Result<JSONObject> result = new Result<>();
        if (object.get("errcode")!=null){
            result.setSuccess(false);
            result.setMessage("认证失败");
            return result;
        }
        String access_token=(String) object.get("access_token");//取出token
        String openId=(String) object.get("openid");//取出openId

        String apiUrl="https://api.weixin.qq.com/sns/userinfo";
        String unifoMa = HttpUtil.sendGet(apiUrl,"access_token="+access_token+"&openid="+openId+"&lang=zh_CN");
        if(unifoMa !=null){
            JSONObject newResult = JSONObject.parseObject(unifoMa);
            if (newResult.get("errcode")!=null){
                result.setSuccess(false);
                result.setMessage("认证失败");
                return result;
            }
            result.setResult(newResult);
            return result;
        }
        result.setSuccess(false);
        result.setMessage("认证失败");
        return result;
    }


    @RequestMapping("/mini/jscode2session")
    @ResponseBody
    public Result<JSONObject> getAu(HttpServletRequest request, HttpServletResponse response, @RequestParam String jsCode){
        String atokenUrl="https://api.weixin.qq.com/sns/jscode2session";
        String ret = HttpUtil.sendGet(atokenUrl,"appid="+ MINIAPP_APPID +"&secret="+MINIAPP_APPSECRET+"&js_code="+jsCode+"&grant_type=authorization_code");//返回带token的json字符串
        JSONObject object = JSONObject.parseObject(ret);
        Result<JSONObject> result = new Result<>();
        if (object.get("errcode")!=null){
            result.setSuccess(false);
            result.setMessage("认证失败");
        }else {
            result.setSuccess(true);
            result.setMessage("认证成功");
            result.setResult(object);
        }
        return result;
    }
}
