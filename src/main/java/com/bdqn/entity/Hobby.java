package com.bdqn.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

/**
 * Created by 祖龙浩 on 2018/3/5.
 */
public class Hobby {
    private Integer id;
    private String hobbyName;
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    public Hobby() {
    }

    public Hobby(Integer id, String hobbyName, Date createTime) {
        this.id = id;
        this.hobbyName = hobbyName;
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Hobby{" +
                "id=" + id +
                ", hobbyName='" + hobbyName + '\'' +
                ", createTime=" + createTime +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHobbyName() {
        return hobbyName;
    }

    public void setHobbyName(String hobbyName) {
        this.hobbyName = hobbyName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
