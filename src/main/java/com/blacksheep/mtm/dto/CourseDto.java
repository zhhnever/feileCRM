package com.blacksheep.mtm.dto;

import io.swagger.models.auth.In;
import org.elasticsearch.common.collect.HppcMaps;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class CourseDto implements Serializable {
    private Integer id;

    private String tname;

    private Integer teacher;

    private String[] reserveTime;

    private String date;

    private Date createStamp;

    private Date updateStamp;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public Integer getTeacher() {
        return teacher;
    }

    public void setTeacher(Integer teacher) {
        this.teacher = teacher;
    }

    public String[] getReserveTime() {
        return reserveTime;
    }

    public void setReserveTime(String[] reserveTime) {
        this.reserveTime = reserveTime;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
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
