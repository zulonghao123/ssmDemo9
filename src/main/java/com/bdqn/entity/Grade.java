package com.bdqn.entity;

import java.util.Date;

/**
 * Created by 祖龙浩 on 2018/2/6.
 */
public class Grade {
    private Integer id;
    private String gradeName,details;
    private Date createDate;

    public Grade() {
    }

    public Grade(Integer id, String gradeName, String details, Date createDate) {
        this.id = id;
        this.gradeName = gradeName;
        this.details = details;
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "Grade{" +
                "id=" + id +
                ", gradeName='" + gradeName + '\'' +
                ", details='" + details + '\'' +
                ", createDate=" + createDate +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGradeName() {
        return gradeName;
    }

    public void setGradeName(String gradeName) {
        this.gradeName = gradeName;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
