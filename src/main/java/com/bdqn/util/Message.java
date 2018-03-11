package com.bdqn.util;

/**
 * Created by 祖龙浩 on 2018/2/25.
 */
public class Message {
    private String code,msg;

    public Message() {
    }

    public Message(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }
    public static  Message success(){
        return new Message("0000", "操作成功");
    }
    public static  Message error(){
        return new Message("0001", "操作失败");
    }
    @Override
    public String toString() {
        return "Message{" +
                "code='" + code + '\'' +
                ", msg='" + msg + '\'' +
                '}';
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
