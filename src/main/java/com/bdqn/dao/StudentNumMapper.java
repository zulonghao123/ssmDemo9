package com.bdqn.dao;

import org.apache.ibatis.annotations.Param;

/**
 * Created by 祖龙浩 on 2018/3/1.
 */
public interface StudentNumMapper {
    Integer addStudentNum(@Param("gradeId") Integer id);

    Integer updateMaxNumByGradeId(@Param("gradeId") Integer id);

    Integer queryMaxNumByGradeId(@Param("gradeId") Integer id);
}
