package com.blacksheep.mtm.pojo.manager;

import java.util.Date;

public class TbCourseReserve {
    private Integer orderId;

    private Integer courseId;

    private Long stuId;

    private Integer status;

    private Date reserveTime;

    private Date createStamp;

    private Date updateStamp;

    public TbCourseReserve(Integer orderId, Integer courseId, Long stuId, Integer status, Date reserveTime, Date createStamp, Date updateStamp) {
        this.orderId = orderId;
        this.courseId = courseId;
        this.stuId = stuId;
        this.status = status;
        this.reserveTime = reserveTime;
        this.createStamp = createStamp;
        this.updateStamp = updateStamp;
    }

    public TbCourseReserve() {
        super();
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Long getStuId() {
        return stuId;
    }

    public void setStuId(Long stuId) {
        this.stuId = stuId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getReserveTime() {
        return reserveTime;
    }

    public void setReserveTime(Date reserveTime) {
        this.reserveTime = reserveTime;
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