package com.blacksheep.mtm.pojo.manager;

import java.math.BigDecimal;
import java.util.Date;

public class TbAgreement {
    private Long id;

    private Integer mId;

    private String name;

    private String identificationNo;

    private String className;

    private BigDecimal amount;

    private Integer discount;

    private String pdf;

    private Byte state;

    private Date createTime;

    private Date updateTime;

    public TbAgreement(Long id, Integer mId, String name, String identificationNo, String className, BigDecimal amount, Integer discount, String pdf, Byte state, Date createTime, Date updateTime) {
        this.id = id;
        this.mId = mId;
        this.name = name;
        this.identificationNo = identificationNo;
        this.className = className;
        this.amount = amount;
        this.discount = discount;
        this.pdf = pdf;
        this.state = state;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public TbAgreement() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getmId() {
        return mId;
    }

    public void setmId(Integer mId) {
        this.mId = mId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getIdentificationNo() {
        return identificationNo;
    }

    public void setIdentificationNo(String identificationNo) {
        this.identificationNo = identificationNo == null ? null : identificationNo.trim();
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className == null ? null : className.trim();
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public String getPdf() {
        return pdf;
    }

    public void setPdf(String pdf) {
        this.pdf = pdf == null ? null : pdf.trim();
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
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