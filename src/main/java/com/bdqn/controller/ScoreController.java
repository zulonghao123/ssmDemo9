package com.bdqn.controller;

import com.alibaba.fastjson.JSON;
import com.bdqn.services.ScoreServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by 祖龙浩 on 2018/3/4.
 */
@Controller
@RequestMapping("score")
public class ScoreController {
    @Autowired
    private ScoreServices scoreServices;

    @RequestMapping(value = "toScore",method = RequestMethod.GET)
    public String toScore(){
        return "score";
    }


    @ResponseBody
    @RequestMapping(value = "queryScoreByGradeIdAndStudentId",method = RequestMethod.GET,produces = {"application/json;charset=utf-8"})
    public String queryScoreByGradeIdAndStudentId(Integer gradeId,Integer studentId,Integer page,Integer rows){
        if (gradeId != null && gradeId == -1) {
            gradeId = null;
        }
        if (studentId != null && studentId == -1) {
            studentId = null;
        }
        return JSON.toJSONString(scoreServices.queryScoreByGradeIdAndStudentId(gradeId, studentId, page, rows));
    }
}
