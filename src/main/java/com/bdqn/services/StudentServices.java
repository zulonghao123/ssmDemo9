package com.bdqn.services;

import com.bdqn.entity.Student;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by 祖龙浩 on 2018/2/27.
 */
public interface StudentServices {
    PageInfo<Student> queryAll(Integer pageNum, Integer pageSize);

    Integer deleteStudentListByIds(List<Integer> list);

    Integer addStudent(Student student);


    Student queryStudentById(Integer id);

    Integer updateStudent(Student student);

    List<Student> queryStudentListByGradeId(Integer id);
}
