package com.blacksheep.mtm.service;


import com.blacksheep.mtm.dto.front.Member;

public interface SSOLoginService {

    Member userLogin(String username, String password);

    Member getUserByToken(String token);

    int logout(String token);
}
