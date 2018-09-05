package com.blacksheep.mtm.pojo.manager;

import java.io.Serializable;
import java.util.Date;

public class TbCourse implements Serializable {
    private Integer id;

    private Integer teacher;

    private String date;

    private String reserveTime;

    private Byte status;

    private Date createStamp;

    private Date updateStamp;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTeacher() {
        return teacher;
    }

    public void setTeacher(Integer teacher) {
        this.teacher = teacher;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getReserveTime() {
        return reserveTime;
    }

    public void setReserveTime(String reserveTime) {
        this.reserveTime = reserveTime;
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

    public TbCourse(Integer id, Integer teacher, String date, String reserveTime, Byte status, Date createStamp, Date updateStamp) {
        this.id = id;
        this.teacher = teacher;
        this.date = date;
        this.reserveTime = reserveTime;
        this.status = status;
        this.createStamp = createStamp;
        this.updateStamp = updateStamp;
    }

    public TbCourse() {
        super();
    }

}