package com.blacksheep.mtm.pojo.manager;

import java.util.Date;

public class CrmStaff {
    private Integer id;

    private String name;

    private String eCode;

    private Byte isTeacher;

    private Byte sex;

    private Integer age;

    private Date birthDate;

    private String address;

    private String wxId;

    private Date inTime;

    private Byte status;

    private Date createStamp;

    private Date updateStamp;

    public CrmStaff(Integer id, String name, String eCode, Byte isTeacher, Byte sex, Integer age, Date birthDate, String address, String wxId, Date inTime, Byte status, Date createStamp, Date updateStamp) {
        this.id = id;
        this.name = name;
        this.eCode = eCode;
        this.isTeacher = isTeacher;
        this.sex = sex;
        this.age = age;
        this.birthDate = birthDate;
        this.address = address;
        this.wxId = wxId;
        this.inTime = inTime;
        this.status = status;
        this.createStamp = createStamp;
        this.updateStamp = updateStamp;
    }

    public CrmStaff() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String geteCode() {
        return eCode;
    }

    public void seteCode(String eCode) {
        this.eCode = eCode == null ? null : eCode.trim();
    }

    public Byte getIsTeacher() {
        return isTeacher;
    }

    public void setIsTeacher(Byte isTeacher) {
        this.isTeacher = isTeacher;
    }

    public Byte getSex() {
        return sex;
    }

    public void setSex(Byte sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getWxId() {
        return wxId;
    }

    public void setWxId(String wxId) {
        this.wxId = wxId == null ? null : wxId.trim();
    }

    public Date getInTime() {
        return inTime;
    }

    public void setInTime(Date inTime) {
        this.inTime = inTime;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
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