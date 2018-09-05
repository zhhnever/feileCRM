package com.blacksheep.mtm.pojo.manager;

import java.io.Serializable;
import java.util.Date;

public class TbMemberQuestion  implements Serializable {
    private Integer id;
    // 会员id
    private Integer mId;
    //年龄
    private String age;
   // 目标课程
    private String targetClass;
   //
    private String profession;

    private String expect;

    private String competitor;

    private String mClass;

    private Date createStamp;

    private Date updateStamp;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getmId() {
        return mId;
    }

    public void setmId(Integer mId) {
        this.mId = mId;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getTargetClass() {
        return targetClass;
    }

    public void setTargetClass(String targetClass) {
        this.targetClass = targetClass;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getExpect() {
        return expect;
    }

    public void setExpect(String expect) {
        this.expect = expect;
    }

    public String getCompetitor() {
        return competitor;
    }

    public void setCompetitor(String competitor) {
        this.competitor = competitor;
    }

    public String getmClass() {
        return mClass;
    }

    public void setmClass(String mClass) {
        this.mClass = mClass;
    }

    public Date getCreateStamp() {
        return createStamp;
    }

    public void setCreateStamp(Date createStamp) {
        this.createStamp = createStamp;
    }

    public Date getUpdateStamp() {
        return updateStamp;
    }

    public void setUpdateStamp(Date updateStamp) {
        this.updateStamp = updateStamp;
    }
}