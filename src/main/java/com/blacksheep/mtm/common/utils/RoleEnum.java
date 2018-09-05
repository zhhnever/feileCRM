package com.blacksheep.mtm.common.utils;

/**
 * 角色权限枚举
 */
public enum RoleEnum {
    ADMIN(1,"管理员"),CUSTOMER_SERVICER(2,"客服"),TEACHER(3,"老师"),CC(5,"CC"),SALER(4,"网站管理员");

    private final int code;
    private final String desc;
    RoleEnum(int code,String desc){
        this.code = code;
        this.desc =desc;
    }

    public int getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }
}
