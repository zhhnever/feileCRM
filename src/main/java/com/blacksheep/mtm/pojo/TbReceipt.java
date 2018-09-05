package com.blacksheep.mtm.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class TbReceipt {
    private Integer id;

    private String code;

    private Date receiptDate;

    private Integer mId;

    private Long aId;

    private Integer uId;

    private BigDecimal amount;

    private String payment;

    private String type;

    private Date createTime;

    private Date updateTime;

    public TbReceipt(Integer id, String code, Date receiptDate, Integer mId, Long aId, Integer uId, BigDecimal amount, String payment, String type, Date createTime, Date updateTime) {
        this.id = id;
        this.code = code;
        this.receiptDate = receiptDate;
        this.mId = mId;
        this.aId = aId;
        this.uId = uId;
        this.amount = amount;
        this.payment = payment;
        this.type = type;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public TbReceipt() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public Date getReceiptDate() {
        return receiptDate;
    }

    public void setReceiptDate(Date receiptDate) {
        this.receiptDate = receiptDate;
    }

    public Integer getmId() {
        return mId;
    }

    public void setmId(Integer mId) {
        this.mId = mId;
    }

    public Long getaId() {
        return aId;
    }

    public void setaId(Long aId) {
        this.aId = aId;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment == null ? null : payment.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
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