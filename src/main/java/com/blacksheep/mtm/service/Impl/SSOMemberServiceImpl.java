package com.blacksheep.mtm.service.Impl;

import com.blacksheep.mtm.common.exception.XmallException;
import com.blacksheep.mtm.common.jedis.JedisClient;
import com.blacksheep.mtm.common.utils.QiniuUtil;
import com.blacksheep.mtm.dto.front.Member;
import com.blacksheep.mtm.dao.TbMemberMapper;
import com.blacksheep.mtm.pojo.manager.TbMember;
import com.blacksheep.mtm.service.SSOLoginService;
import com.blacksheep.mtm.service.SSOMemberService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class SSOMemberServiceImpl implements SSOMemberService {

    @Autowired
    private SSOLoginService SSOLoginService;
    @Autowired
    private TbMemberMapper tbMemberMapper;
    @Autowired
    private JedisClient jedisClient;
    @Value("${SESSION_EXPIRE}")
    private Integer SESSION_EXPIRE;

    @Override
    public String imageUpload(Long userId,String token,String imgData) {

        //过滤data:URL
        String base64=QiniuUtil.base64Data(imgData);
        String imgPath= QiniuUtil.qiniuBase64Upload(base64);

        TbMember tbMember=tbMemberMapper.selectByPrimaryKey(userId);
        if(tbMember==null){
            throw new XmallException("通过id获取用户失败");
        }
        tbMember.setFile(imgPath);
        if(tbMemberMapper.updateByPrimaryKey(tbMember)!=1){
            throw new XmallException("更新用户头像失败");
        }

        //更新缓存
        Member member= SSOLoginService.getUserByToken(token);
        member.setFile(imgPath);
        jedisClient.set("SESSION:" + token, new Gson().toJson(member));
        return imgPath;
    }
}
