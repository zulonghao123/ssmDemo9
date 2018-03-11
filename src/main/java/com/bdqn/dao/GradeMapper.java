package com.bdqn.dao;

import com.bdqn.entity.Grade;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 祖龙浩 on 2018/2/6.
 */
public interface GradeMapper {
    List<Grade> queryAllGrade();



    Grade queryGradeByGradeId(@Param("gradeId") Integer id);

    Integer deleteGradeByGradeId(@Param("gradeId") Integer id);

    Integer deleteGradeListByGadeIds(List<Integer> gradeIds);

    Integer addGrade(Grade grade);

    Integer updateGrade(Grade grade);
}
