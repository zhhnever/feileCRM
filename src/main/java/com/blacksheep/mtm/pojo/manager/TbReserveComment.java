package com.blacksheep.mtm.pojo.manager;

import java.util.Date;

public class TbReserveComment {
    private Integer id;

    private Integer reserveId;

    private Integer commentStars;

    private Date createStamp;

    private Date updateStamp;

    public TbReserveComment(Integer id, Integer reserveId, Integer commentStars, Date createStamp, Date updateStamp) {
        this.id = id;
        this.reserveId = reserveId;
        this.commentStars = commentStars;
        this.createStamp = createStamp;
        this.updateStamp = updateStamp;
    }

    public TbReserveComment() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getReserveId() {
        return reserveId;
    }

    public void setReserveId(Integer reserveId) {
        this.reserveId = reserveId;
    }

    public Integer getCommentStars() {
        return commentStars;
    }

    public void setCommentStars(Integer commentStars) {
        this.commentStars = commentStars;
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