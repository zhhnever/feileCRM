package com.blacksheep.mtm.pojo.manager;

import java.util.Date;

public class TbNewsCat {
    private Integer id;

    private String title;

    private Date createStamp;

    private Date updateStamp;

    public TbNewsCat(Integer id, String title, Date createStamp, Date updateStamp) {
        this.id = id;
        this.title = title;
        this.createStamp = createStamp;
        this.updateStamp = updateStamp;
    }

    public TbNewsCat() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
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