package com.blacksheep.mtm.pojo;

import java.util.Date;

public class TbCCAssign {
    private Integer id;

    private Integer ccId;

    private Integer state;

    private Integer createrId;

    private Date createTime;

    private Date updateTime;

    public TbCCAssign(Integer id, Integer ccId, Integer state, Integer createrId, Date createTime, Date updateTime) {
        this.id = id;
        this.ccId = ccId;
        this.state = state;
        this.createrId = createrId;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public TbCCAssign() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCcId() {
        return ccId;
    }

    public void setCcId(Integer ccId) {
        this.ccId = ccId;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getCreaterId() {
        return createrId;
    }

    public void setCreaterId(Integer createrId) {
        this.createrId = createrId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}