package com.blacksheep.mtm.dto;

import java.io.Serializable;
import java.util.Date;

public class MemberFllowDto implements Serializable
{
    private Integer id;

    private Integer memberId;

    private String menberName;

    private Integer ccId;

    private String ccName;

    private String fllowType;

    private Date fllowTime;

    private String fllowContent;

    private Date createTime;

    private Date updateTime;

    public MemberFllowDto(Integer id, Integer memberId, String menberName, Integer ccId, String ccName, String fllowType, Date fllowTime, String fllowContent, Date createTime, Date updateTime) {
        this.id = id;
        this.memberId = memberId;
        this.menberName = menberName;
        this.ccId = ccId;
        this.ccName = ccName;
        this.fllowType = fllowType;
        this.fllowTime = fllowTime;
        this.fllowContent = fllowContent;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public MemberFllowDto() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public String getMenberName() {
        return menberName;
    }

    public void setMenberName(String menberName) {
        this.menberName = menberName;
    }

    public Integer getCcId() {
        return ccId;
    }

    public void setCcId(Integer ccId) {
        this.ccId = ccId;
    }

    public String getCcName() {
        return ccName;
    }

    public void setCcName(String ccName) {
        this.ccName = ccName;
    }

    public String getFllowType() {
        return fllowType;
    }

    public void setFllowType(String fllowType) {
        this.fllowType = fllowType;
    }

    public String getFllowContent() {
        return fllowContent;
    }

    public void setFllowContent(String fllowContent) {
        this.fllowContent = fllowContent;
    }

    public Date getFllowTime() {
        return fllowTime;
    }

    public void setFllowTime(Date fllowTime) {
        this.fllowTime = fllowTime;
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
