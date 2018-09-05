package com.blacksheep.mtm.shiro;

public enum LoginType {
    User("User"),ADMIN("Admin");

    private String type;

    private LoginType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return this.type.toString();
    }
}
