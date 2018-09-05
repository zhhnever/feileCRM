package com.blacksheep.mtm.pojo.manager;

import java.util.Date;

public class TbNews {
    private Integer id;

    private String title;

    private Integer cid;

    private Long authorId;

    private Date createStamp;

    private Date updateStamp;

    private String pic;

    public TbNews(Integer id, String title, Integer cid, Long authorId, Date createStamp, Date updateStamp, String pic) {
        this.id = id;
        this.title = title;
        this.cid = cid;
        this.authorId = authorId;
        this.createStamp = createStamp;
        this.updateStamp = updateStamp;
        this.pic = pic;
    }

    public TbNews() {
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

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Long getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Long authorId) {
        this.authorId = authorId;
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

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic == null ? null : pic.trim();
    }
}