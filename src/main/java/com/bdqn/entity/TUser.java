package com.bdqn.entity;

/**
 * Created by 祖龙浩 on 2018/2/2.
 */
public class TUser {
    private Integer id;
    private String userName,password,nickName;

    public TUser() {
    }

    public TUser(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }

    public TUser(Integer id, String userName, String password, String nickName) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.nickName = nickName;
    }

    @Override
    public String toString() {
        return "TUser{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", nickName='" + nickName + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }
}
