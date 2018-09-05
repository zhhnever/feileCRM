package com.blacksheep.mtm.pojo.manager;

import java.util.Date;

public class TbCourseReserve {
    private Integer orderId;

    private Integer tId;

    private Long stuId;

    private Integer status;

    private Date reserveTime;

    private Date createStamp;

    private Date updateStamp;

    public TbCourseReserve(Integer orderId, Integer tId, Long stuId, Integer status, Date reserveTime, Date createStamp, Date updateStamp) {
        this.orderId = orderId;
        this.tId = tId;
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

    public Integer gettId() {
        return tId;
    }

    public void settId(Integer courseId) {
        this.tId = courseId;
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