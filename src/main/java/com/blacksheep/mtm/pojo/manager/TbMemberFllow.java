package com.blacksheep.mtm.pojo.manager;

import java.util.Date;

public class TbMemberFllow {
    private Integer id;

    private Integer mId;

    private Integer ccId;

    private String fllowType;

    private String fllowContent;

    private Date fllowTime;

    private String area;

    private Date createTime;

    private Date updateTime;


    public TbMemberFllow(Integer id, Integer mId, Integer ccId, String fllowType, Date fllowTime, String area, Date createTime, Date updateTime, String fllowContent) {
        this.id = id;
        this.mId = mId;
        this.ccId = ccId;
        this.fllowType = fllowType;
        this.fllowTime = fllowTime;
        this.area = area;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.fllowContent = fllowContent;
    }

    public TbMemberFllow() {
        super();
    }

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

    public Integer getCcId() {
        return ccId;
    }

    public void setCcId(Integer ccId) {
        this.ccId = ccId;
    }

    public String getFllowType() {
        return fllowType;
    }

    public void setFllowType(String fllowType) {
        this.fllowType = fllowType == null ? null : fllowType.trim();
    }

    public Date getFllowTime() {
        return fllowTime;
    }

    public void setFllowTime(Date fllowTime) {
        this.fllowTime = fllowTime;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
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

    public String getFllowContent() {
        return fllowContent;
    }

    public void setFllowContent(String fllowContent) {
        this.fllowContent = fllowContent == null ? null : fllowContent.trim();
    }
}