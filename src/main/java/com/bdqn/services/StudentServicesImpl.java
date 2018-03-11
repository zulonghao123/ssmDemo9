package com.bdqn.services;

import com.bdqn.dao.StudentMapper;
import com.bdqn.dao.StudentNumMapper;
import com.bdqn.entity.Student;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 祖龙浩 on 2018/2/27.
 */
@Service
public class StudentServicesImpl implements StudentServices {
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private StudentNumMapper studentNumMapper;
    @Override
    public PageInfo<Student> queryAll(Integer pageNum,Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Student> list = studentMapper.queryAll();
        PageInfo<Student> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public Integer deleteStudentListByIds(List<Integer> list) {
        return studentMapper.deleteStudentListByIds(list);
    }

    @Override
    public Integer addStudent(Student student) {
        Integer gradeId = student.getGrade().getId();
        String gradeName = student.getGrade().getGradeName();
        //1.修改最大编号
        studentNumMapper.updateMaxNumByGradeId(gradeId);
        //2.获取最大编号
        Integer maxNum = studentNumMapper.queryMaxNumByGradeId(gradeId);
        //3.计算学号
        String stuNum = gradeName;
        for(int i = 0;i < (15-(gradeName+maxNum).length());i ++){
            stuNum = stuNum + 0;
        }
        stuNum = stuNum + maxNum;
        student.setStudentNum(stuNum);

        //4.添加学生
        return studentMapper.addStudent(student);
    }

    @Override
    public Student queryStudentById(Integer id) {
        return studentMapper.queryStudentById(id);
    }

    @Override
    public Integer updateStudent(Student student) {
        return studentMapper.updateStudent(student);
    }

    @Override
    public List<Student> queryStudentListByGradeId(Integer id) {
        return studentMapper.queryStudentListByGradeId(id);
    }
}
