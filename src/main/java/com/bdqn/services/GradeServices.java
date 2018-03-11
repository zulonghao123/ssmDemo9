package com.bdqn.services;

import com.bdqn.entity.Grade;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by 祖龙浩 on 2018/2/6.
 */
public interface GradeServices {
    PageInfo<Grade> queryAllGradeForPage(Integer pageNum,Integer pageSize);

    Grade queryGradeByGradeId(Integer id);

    Integer deleteGradeByGradeId(Integer id);

    Integer deleteGradeListByGadeIds(List<Integer> gradeIds);

    Integer addGrade(Grade grade);

    Integer updateGrade(Grade grade);

    List<Grade> queryAllGrade();
}
