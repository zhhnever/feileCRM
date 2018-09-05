package com.blacksheep.mtm.pojo.manager;

import java.util.Date;

public class TbContract {
    private Integer id;

    private String contractCode;

    private Integer mId;

    private Integer ccId;

    private String idCode;

    private Long money;

    private Double discount;

    private Integer classType;

    private String state;

    private Date createTime;

    private Date updateTime;

    public TbContract(Integer id, String contractCode, Integer mId, Integer ccId, String idCode, Long money, Double discount, Integer classType, String state, Date createTime, Date updateTime) {
        this.id = id;
        this.contractCode = contractCode;
        this.mId = mId;
        this.ccId = ccId;
        this.idCode = idCode;
        this.money = money;
        this.discount = discount;
        this.classType = classType;
        this.state = state;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public TbContract() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContractCode() {
        return contractCode;
    }

    public void setContractCode(String contractCode) {
        this.contractCode = contractCode == null ? null : contractCode.trim();
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

    public String getIdCode() {
        return idCode;
    }

    public void setIdCode(String idCode) {
        this.idCode = idCode == null ? null : idCode.trim();
    }

    public Long getMoney() {
        return money;
    }

    public void setMoney(Long money) {
        this.money = money;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public Integer getClassType() {
        return classType;
    }

    public void setClassType(Integer classType) {
        this.classType = classType;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
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