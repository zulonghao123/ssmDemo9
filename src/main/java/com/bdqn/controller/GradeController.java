package com.bdqn.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.bdqn.entity.Grade;
import com.bdqn.services.GradeServices;
import com.bdqn.util.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 祖龙浩 on 2018/2/6.
 */
@Controller
@RequestMapping("grade")
public class GradeController {
    @Autowired
    private GradeServices gradeServices;
    @RequestMapping("toGrade")
    public String toGrade(Integer pageNum, Integer pageSize, Model model){
        model.addAttribute("pageInfo", gradeServices.queryAllGradeForPage(pageNum, pageSize));
        return "grade";
    }

    @ResponseBody
    @RequestMapping(value = "queryGradeById",method = RequestMethod.GET,produces = {"application/json;charset=utf-8"})
    public String queryGradeById(Integer gradeId){
        Grade grade = gradeServices.queryGradeByGradeId(gradeId);
        return JSON.toJSONString(grade);
    }
    @ResponseBody
    @RequestMapping(value = "deleteGradeById",method = RequestMethod.GET,produces = {"application/json;charset=utf-8"})
    public String deleteGradeById(Integer gradeId){
        Integer rows = gradeServices.deleteGradeByGradeId(gradeId);
        if(rows > 0){
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }
    @ResponseBody
    @RequestMapping(value = "deleteGradeListByIds",method = RequestMethod.POST,produces = {"application/json;charset=utf-8"})
    public String deleteGradeListByIds(String gradeIds){
        String[] str = gradeIds.split(",");
        List<Integer> list = new ArrayList<>();
        for (String s : str) {
            Integer i = Integer.parseInt(s);
            list.add(i);
        }
        Integer rows = gradeServices.deleteGradeListByGadeIds(list);
        if(rows > 0){
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }
    @ResponseBody
    @RequestMapping(value = "addGrade",method = RequestMethod.POST,produces = {"application/json;charset=utf-8"})
    public String addGrade(Grade grade){
        Integer rows = gradeServices.addGrade(grade);
        if(rows > 0){
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }
    @ResponseBody
    @RequestMapping(value = "updateGrade",method = RequestMethod.POST,produces = {"application/json;charset=utf-8"})
    public String updateGrade(Grade grade){
        Integer rows = gradeServices.updateGrade(grade);
        if(rows > 0){
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }
    @ResponseBody
    @RequestMapping(value = "queryAllGrade",method = RequestMethod.GET,produces = {"application/json;charset=utf-8"})
    public String queryAllGrade(){
        return JSONArray.toJSONString(gradeServices.queryAllGrade());
    }
}
