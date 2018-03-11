package com.bdqn.controller;

import com.alibaba.fastjson.JSON;
import com.bdqn.entity.Hobby;
import com.bdqn.services.HobbyServices;
import com.bdqn.util.Message;
import com.bdqn.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 祖龙浩 on 2018/3/4.
 */
@Controller
@RequestMapping("hobby")
public class HobbyController {
    @Autowired
    private HobbyServices hobbyServices;
    @RequestMapping(value = "toHobby",method = RequestMethod.GET)
    public String toHobby(){
        return "hobby";
    }

    @ResponseBody
    @RequestMapping(value = "queryAll",method = RequestMethod.GET,produces = {"application/json;charset=utf-8"})
    public String queryAll(Integer page,Integer rows){
        PageUtil<Hobby> pageUtil = new PageUtil<>(hobbyServices.queryAll(page, rows));
        return JSON.toJSONString(pageUtil);
    }

    @ResponseBody
    @RequestMapping(value = "addHobby",method = RequestMethod.POST,produces = {"application/json;charset=utf-8"})
    public String addHobby(Hobby hobby){
        Integer rows = hobbyServices.addHobby(hobby);
        if(rows > 0){
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }

    @ResponseBody
    @RequestMapping(value = "deleteHobbyById", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
    public String deleteHobbyById(Integer id) {
        Integer rows = hobbyServices.deleteHobbyById(id);
        if(rows > 0){
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }

    @ResponseBody
    @RequestMapping(value = "deleteHobbyListByIds",method = RequestMethod.POST,produces = {"application/json;charset=utf-8"})
    public String deleteHobbyListByIds(String idStr){
        String[] str = idStr.split(",");
        List<Integer> list = new ArrayList<>();
        for (String s : str) {
            list.add(Integer.parseInt(s));
        }
        Integer rows = hobbyServices.deleteHobbyListByIds(list);
        if(rows > 0){
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }

    @ResponseBody
    @RequestMapping(value = "queryHobbyById",method = RequestMethod.GET,produces = {"appliaction/json;charset=utf-8"})
    public String queryHobbyById(Integer id){
        Hobby hobby = hobbyServices.queryHobbyById(id);
        return JSON.toJSONString(hobby);
    }

    @ResponseBody
    @RequestMapping(value = "updateHobby",method = RequestMethod.POST,produces = {"application/json;charset=utf-8"})
    public String updateHobby(Hobby hobby){
        Integer rows = hobbyServices.updateHobby(hobby);
        if(rows > 0){
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }
}
