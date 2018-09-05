package com.blacksheep.mtm.dto.front;

import com.blacksheep.mtm.pojo.manager.TbMemberQuestion;

import java.io.Serializable;

/**
 * @author
 */
public class MemberLoginRegist implements Serializable {

    private String userName;

    private String userPwd;

    private String challenge;

    private String validate;

    private String seccode;

    private TbMemberQuestion tags;

    private String phone;

    private String sex;

    private String education;

    private String channel;

    public String getChannel() {
        return channel;
    }

    public void setChannel(String channel) {
        this.channel = channel;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getChallenge() {
        return challenge;
    }

    public void setChallenge(String challenge) {
        this.challenge = challenge;
    }

    public String getValidate() {
        return validate;
    }

    public void setValidate(String validate) {
        this.validate = validate;
    }

    public String getSeccode() {
        return seccode;
    }

    public void setSeccode(String seccode) {
        this.seccode = seccode;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public TbMemberQuestion getTags() {
        return tags;
    }

    public void setTags(TbMemberQuestion tags) {
        this.tags = tags;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }
}
