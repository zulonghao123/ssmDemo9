package com.bdqn.dao;

import com.bdqn.entity.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 祖龙浩 on 2018/2/27.
 */
public interface StudentMapper {
    List<Student> queryAll();

    Integer deleteStudentListByIds(List<Integer> list);

    Integer addStudent(Student student);

    Student queryStudentById(@Param("stuId") Integer id);

    Integer updateStudent(Student student);

    Integer deleteStudentByGradeId(@Param("gradeId") Integer id);

    List<Student> queryStudentListByGradeId(@Param("gradeId") Integer id);

}
