package com.bdqn.controller;

import com.alibaba.fastjson.JSON;
import com.bdqn.entity.Student;
import com.bdqn.services.StudentServices;
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
@RequestMapping("student")
public class StudentController {
    @Autowired
    private StudentServices studentServices;
    @RequestMapping("toStudent")
    public String toStudent(Integer pageNum, Integer pageSize, Model model){
        model.addAttribute("pageInfo", studentServices.queryAll(pageNum, pageSize));
        return "student";
    }

    @ResponseBody
    @RequestMapping(value = "deleteStudentListByIds",method = RequestMethod.POST,produces = {"application/json;charset=utf-8"})
    public String deleteStudentListByIds(String ids){
        String[] str = ids.split(",");
        List<Integer> list = new ArrayList<>();
        for (String s : str) {
            list.add(Integer.parseInt(s));
        }
        Integer rows = studentServices.deleteStudentListByIds(list);
        if(rows > 0){
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }

    @ResponseBody
    @RequestMapping(value = "addStudent",method = RequestMethod.POST,produces = {"application/json;charset=utf-8"})
    public String addStudent(Student student){
        Integer rows = studentServices.addStudent(student);
        if(rows > 0){
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());

    }
    @ResponseBody
    @RequestMapping(value = "updateStudent",method = RequestMethod.POST,produces = {"application/json;charset=utf-8"})
    public String updateStudent(Student student){
        Integer rows = studentServices.updateStudent(student);
        if(rows > 0){
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());

    }

    @ResponseBody
    @RequestMapping(value = "queryStudentById",method = RequestMethod.GET,produces = {"application/json;charset=utf-8"})
    public String queryStudentById(Integer id){
        return JSON.toJSONString(studentServices.queryStudentById(id));

    }

    @ResponseBody
    @RequestMapping(value = "queryStudentListByGradeId", method = RequestMethod.GET, produces = {"application/json;charset=utf-8"})
    public String queryStudentListByGradeId(Integer id) {
        return JSON.toJSONString(studentServices.queryStudentListByGradeId(id));
    }
}
