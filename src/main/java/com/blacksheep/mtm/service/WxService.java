package com.blacksheep.mtm.service;

import java.util.HashMap;

public interface WxService {
    String getUserInfo(String code);

    String getAccessToken();
}
