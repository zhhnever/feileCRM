package com.blacksheep.mtm.pojo.manager;

import java.util.Date;

public class TbNewsDesc {
    private Integer newsId;

    private Date createStamp;

    private Date updateStamp;

    private String newsDesc;

    public TbNewsDesc(Integer newsId, Date createStamp, Date updateStamp, String newsDesc) {
        this.newsId = newsId;
        this.createStamp = createStamp;
        this.updateStamp = updateStamp;
        this.newsDesc = newsDesc;
    }

    public TbNewsDesc() {
        super();
    }

    public Integer getNewsId() {
        return newsId;
    }

    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
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

    public String getNewsDesc() {
        return newsDesc;
    }

    public void setNewsDesc(String newsDesc) {
        this.newsDesc = newsDesc == null ? null : newsDesc.trim();
    }
}