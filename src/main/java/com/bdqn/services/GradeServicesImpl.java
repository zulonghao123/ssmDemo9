package com.bdqn.services;

import com.bdqn.dao.GradeMapper;
import com.bdqn.dao.StudentMapper;
import com.bdqn.dao.StudentNumMapper;
import com.bdqn.entity.Grade;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 祖龙浩 on 2018/2/6.
 */
@Service
public class GradeServicesImpl implements GradeServices {
    @Autowired
    private GradeMapper gradeMapper;
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private StudentNumMapper studentNumMapper;
    @Override
    public PageInfo<Grade> queryAllGradeForPage(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Grade> list = gradeMapper.queryAllGrade();
        PageInfo<Grade> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public Grade queryGradeByGradeId(Integer id) {
        return gradeMapper.queryGradeByGradeId(id);
    }

    @Override
    public Integer deleteGradeByGradeId(Integer id) {
        studentMapper.deleteStudentByGradeId(id);
        return gradeMapper.deleteGradeByGradeId(id);
    }

    @Override
    public Integer deleteGradeListByGadeIds(List<Integer> gradeIds) {
        return gradeMapper.deleteGradeListByGadeIds(gradeIds);
    }

    @Override
    public Integer addGrade(Grade grade) {
        Integer rows = gradeMapper.addGrade(grade);
        Integer id = grade.getId();
        studentNumMapper.addStudentNum(id);
        return rows;
    }

    @Override
    public Integer updateGrade(Grade grade) {
        return gradeMapper.updateGrade(grade);
    }

    @Override
    public List<Grade> queryAllGrade() {
        return gradeMapper.queryAllGrade();
    }
}
