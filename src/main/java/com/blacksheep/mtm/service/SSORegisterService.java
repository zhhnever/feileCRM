package com.blacksheep.mtm.service;


import com.blacksheep.mtm.dto.front.MemberLoginRegist;

public interface SSORegisterService {

    boolean checkData(String param, int type);

    int register(MemberLoginRegist memberLoginRegist);

    int wxRegister(String userName,String userPwd);

}
