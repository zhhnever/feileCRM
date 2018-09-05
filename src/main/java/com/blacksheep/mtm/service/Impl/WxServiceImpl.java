package com.blacksheep.mtm.service.Impl;

import com.alibaba.fastjson.JSONObject;
import com.blacksheep.mtm.common.exception.XmallException;
import com.blacksheep.mtm.common.jedis.JedisClient;
import com.blacksheep.mtm.wx.HttpUtil;
import com.blacksheep.mtm.service.WxService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class WxServiceImpl implements WxService {

    @Value("${WX_TOKEN}")
    private String WX_TOKEN;
    @Value("${WX_APPID}")
    private String WX_APPID;
    @Value("${WX_APPKEY}")
    private String WX_APPKEY;
    @Autowired
    private JedisClient jedisClient;

    @Override
    public String getUserInfo(String token) {

        return null;
    }

    @Override
    public String getAccessToken() {
        String atokenUrl = "https://api.weixin.qq.com/cgi-bin/token";
        String access_token = jedisClient.get("access_token");
        if (StringUtils.isEmpty(access_token)){
            String ret = HttpUtil.sendGet(atokenUrl,"appid="+ WX_APPID +"&secret="+WX_APPKEY+"&grant_type=client_credential");//返回带token的json字符串
            JSONObject object = JSONObject.parseObject(ret);
            if (object.get("errcode") !=null){
                throw new XmallException("获取微信access_token失败!"+object.get("errmsg"));
            }
            jedisClient.set("access_token",object.get("access_token").toString());
            jedisClient.expire("expires_in",7100);
            access_token = object.get("access_token").toString();
        }
        return access_token;
    }
}
